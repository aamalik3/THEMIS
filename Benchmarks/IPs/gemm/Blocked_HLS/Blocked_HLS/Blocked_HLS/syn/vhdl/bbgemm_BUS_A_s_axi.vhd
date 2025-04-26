-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity bbgemm_BUS_A_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 17;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    m1_address0           :in   STD_LOGIC_VECTOR(11 downto 0);
    m1_ce0                :in   STD_LOGIC;
    m1_q0                 :out  STD_LOGIC_VECTOR(63 downto 0);
    m2_address0           :in   STD_LOGIC_VECTOR(11 downto 0);
    m2_ce0                :in   STD_LOGIC;
    m2_q0                 :out  STD_LOGIC_VECTOR(63 downto 0);
    prod_address0         :in   STD_LOGIC_VECTOR(11 downto 0);
    prod_ce0              :in   STD_LOGIC;
    prod_we0              :in   STD_LOGIC;
    prod_d0               :in   STD_LOGIC_VECTOR(63 downto 0);
    prod_q0               :out  STD_LOGIC_VECTOR(63 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC
);
end entity bbgemm_BUS_A_s_axi;

-- ------------------------Address Info-------------------
-- 0x00000 : Control signals
--           bit 0  - ap_start (Read/Write/COH)
--           bit 1  - ap_done (Read/COR)
--           bit 2  - ap_idle (Read)
--           bit 3  - ap_ready (Read)
--           bit 7  - auto_restart (Read/Write)
--           others - reserved
-- 0x00004 : Global Interrupt Enable Register
--           bit 0  - Global Interrupt Enable (Read/Write)
--           others - reserved
-- 0x00008 : IP Interrupt Enable Register (Read/Write)
--           bit 0  - enable ap_done interrupt (Read/Write)
--           bit 1  - enable ap_ready interrupt (Read/Write)
--           others - reserved
-- 0x0000c : IP Interrupt Status Register (Read/TOW)
--           bit 0  - ap_done (COR/TOW)
--           bit 1  - ap_ready (COR/TOW)
--           others - reserved
-- 0x08000 ~
-- 0x0ffff : Memory 'm1' (4096 * 64b)
--           Word 2n   : bit [31:0] - m1[n][31: 0]
--           Word 2n+1 : bit [31:0] - m1[n][63:32]
-- 0x10000 ~
-- 0x17fff : Memory 'm2' (4096 * 64b)
--           Word 2n   : bit [31:0] - m2[n][31: 0]
--           Word 2n+1 : bit [31:0] - m2[n][63:32]
-- 0x18000 ~
-- 0x1ffff : Memory 'prod' (4096 * 64b)
--           Word 2n   : bit [31:0] - prod[n][31: 0]
--           Word 2n+1 : bit [31:0] - prod[n][63:32]
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of bbgemm_BUS_A_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL   : INTEGER := 16#00000#;
    constant ADDR_GIE       : INTEGER := 16#00004#;
    constant ADDR_IER       : INTEGER := 16#00008#;
    constant ADDR_ISR       : INTEGER := 16#0000c#;
    constant ADDR_M1_BASE   : INTEGER := 16#08000#;
    constant ADDR_M1_HIGH   : INTEGER := 16#0ffff#;
    constant ADDR_M2_BASE   : INTEGER := 16#10000#;
    constant ADDR_M2_HIGH   : INTEGER := 16#17fff#;
    constant ADDR_PROD_BASE : INTEGER := 16#18000#;
    constant ADDR_PROD_HIGH : INTEGER := 16#1ffff#;
    constant ADDR_BITS         : INTEGER := 17;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_ap_idle         : STD_LOGIC;
    signal int_ap_ready        : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    -- memory signals
    signal int_m1_address0     : UNSIGNED(11 downto 0);
    signal int_m1_ce0          : STD_LOGIC;
    signal int_m1_we0          : STD_LOGIC;
    signal int_m1_be0          : UNSIGNED(7 downto 0);
    signal int_m1_d0           : UNSIGNED(63 downto 0);
    signal int_m1_q0           : UNSIGNED(63 downto 0);
    signal int_m1_address1     : UNSIGNED(11 downto 0);
    signal int_m1_ce1          : STD_LOGIC;
    signal int_m1_we1          : STD_LOGIC;
    signal int_m1_be1          : UNSIGNED(7 downto 0);
    signal int_m1_d1           : UNSIGNED(63 downto 0);
    signal int_m1_q1           : UNSIGNED(63 downto 0);
    signal int_m1_read         : STD_LOGIC;
    signal int_m1_write        : STD_LOGIC;
    signal int_m1_shift        : UNSIGNED(0 downto 0);
    signal int_m2_address0     : UNSIGNED(11 downto 0);
    signal int_m2_ce0          : STD_LOGIC;
    signal int_m2_we0          : STD_LOGIC;
    signal int_m2_be0          : UNSIGNED(7 downto 0);
    signal int_m2_d0           : UNSIGNED(63 downto 0);
    signal int_m2_q0           : UNSIGNED(63 downto 0);
    signal int_m2_address1     : UNSIGNED(11 downto 0);
    signal int_m2_ce1          : STD_LOGIC;
    signal int_m2_we1          : STD_LOGIC;
    signal int_m2_be1          : UNSIGNED(7 downto 0);
    signal int_m2_d1           : UNSIGNED(63 downto 0);
    signal int_m2_q1           : UNSIGNED(63 downto 0);
    signal int_m2_read         : STD_LOGIC;
    signal int_m2_write        : STD_LOGIC;
    signal int_m2_shift        : UNSIGNED(0 downto 0);
    signal int_prod_address0   : UNSIGNED(11 downto 0);
    signal int_prod_ce0        : STD_LOGIC;
    signal int_prod_we0        : STD_LOGIC;
    signal int_prod_be0        : UNSIGNED(7 downto 0);
    signal int_prod_d0         : UNSIGNED(63 downto 0);
    signal int_prod_q0         : UNSIGNED(63 downto 0);
    signal int_prod_address1   : UNSIGNED(11 downto 0);
    signal int_prod_ce1        : STD_LOGIC;
    signal int_prod_we1        : STD_LOGIC;
    signal int_prod_be1        : UNSIGNED(7 downto 0);
    signal int_prod_d1         : UNSIGNED(63 downto 0);
    signal int_prod_q1         : UNSIGNED(63 downto 0);
    signal int_prod_read       : STD_LOGIC;
    signal int_prod_write      : STD_LOGIC;
    signal int_prod_shift      : UNSIGNED(0 downto 0);

    component bbgemm_BUS_A_s_axi_ram is
        generic (
            BYTES   : INTEGER :=4;
            DEPTH   : INTEGER :=256;
            AWIDTH  : INTEGER :=8);
        port (
            clk0    : in  STD_LOGIC;
            address0: in  UNSIGNED(AWIDTH-1 downto 0);
            ce0     : in  STD_LOGIC;
            we0     : in  STD_LOGIC;
            be0     : in  UNSIGNED(BYTES-1 downto 0);
            d0      : in  UNSIGNED(BYTES*8-1 downto 0);
            q0      : out UNSIGNED(BYTES*8-1 downto 0);
            clk1    : in  STD_LOGIC;
            address1: in  UNSIGNED(AWIDTH-1 downto 0);
            ce1     : in  STD_LOGIC;
            we1     : in  STD_LOGIC;
            be1     : in  UNSIGNED(BYTES-1 downto 0);
            d1      : in  UNSIGNED(BYTES*8-1 downto 0);
            q1      : out UNSIGNED(BYTES*8-1 downto 0));
    end component bbgemm_BUS_A_s_axi_ram;

    function log2 (x : INTEGER) return INTEGER is
        variable n, m : INTEGER;
    begin
        n := 1;
        m := 2;
        while m < x loop
            n := n + 1;
            m := m * 2;
        end loop;
        return n;
    end function log2;

begin
-- ----------------------- Instantiation------------------
-- int_m1
int_m1 : bbgemm_BUS_A_s_axi_ram
generic map (
     BYTES    => 8,
     DEPTH    => 4096,
     AWIDTH   => log2(4096))
port map (
     clk0     => ACLK,
     address0 => int_m1_address0,
     ce0      => int_m1_ce0,
     we0      => int_m1_we0,
     be0      => int_m1_be0,
     d0       => int_m1_d0,
     q0       => int_m1_q0,
     clk1     => ACLK,
     address1 => int_m1_address1,
     ce1      => int_m1_ce1,
     we1      => int_m1_we1,
     be1      => int_m1_be1,
     d1       => int_m1_d1,
     q1       => int_m1_q1);
-- int_m2
int_m2 : bbgemm_BUS_A_s_axi_ram
generic map (
     BYTES    => 8,
     DEPTH    => 4096,
     AWIDTH   => log2(4096))
port map (
     clk0     => ACLK,
     address0 => int_m2_address0,
     ce0      => int_m2_ce0,
     we0      => int_m2_we0,
     be0      => int_m2_be0,
     d0       => int_m2_d0,
     q0       => int_m2_q0,
     clk1     => ACLK,
     address1 => int_m2_address1,
     ce1      => int_m2_ce1,
     we1      => int_m2_we1,
     be1      => int_m2_be1,
     d1       => int_m2_d1,
     q1       => int_m2_q1);
-- int_prod
int_prod : bbgemm_BUS_A_s_axi_ram
generic map (
     BYTES    => 8,
     DEPTH    => 4096,
     AWIDTH   => log2(4096))
port map (
     clk0     => ACLK,
     address0 => int_prod_address0,
     ce0      => int_prod_ce0,
     we0      => int_prod_we0,
     be0      => int_prod_be0,
     d0       => int_prod_d0,
     q0       => int_prod_q0,
     clk1     => ACLK,
     address1 => int_prod_address1,
     ce1      => int_prod_ce1,
     we1      => int_prod_we1,
     be1      => int_prod_be1,
     d1       => int_prod_d1,
     q1       => int_prod_q1);


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata and ar_hs = '0' else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, w_hs, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (w_hs = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) and (int_m1_read = '0') and (int_m2_read = '0') and (int_prod_read = '0') else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data(7) <= int_auto_restart;
                        rdata_data(3) <= int_ap_ready;
                        rdata_data(2) <= int_ap_idle;
                        rdata_data(1) <= int_ap_done;
                        rdata_data(0) <= int_ap_start;
                    when ADDR_GIE =>
                        rdata_data(0) <= int_gie;
                    when ADDR_IER =>
                        rdata_data(1 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(1 downto 0) <= int_isr;
                    when others =>
                        NULL;
                    end case;
                elsif (int_m1_read = '1') then
                    rdata_data <= RESIZE(SHIFT_RIGHT(int_m1_q1, TO_INTEGER(int_m1_shift)*32), 32);
                elsif (int_m2_read = '1') then
                    rdata_data <= RESIZE(SHIFT_RIGHT(int_m2_q1, TO_INTEGER(int_m2_shift)*32), 32);
                elsif (int_prod_read = '1') then
                    rdata_data <= RESIZE(SHIFT_RIGHT(int_prod_q1, TO_INTEGER(int_prod_shift)*32), 32);
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_gie and (int_isr(0) or int_isr(1));
    ap_start             <= int_ap_start;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (ap_done = '1') then
                    int_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_ready <= ap_ready;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= "00";
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------
    -- m1
    int_m1_address0      <= UNSIGNED(m1_address0);
    int_m1_ce0           <= m1_ce0;
    int_m1_we0           <= '0';
    int_m1_be0           <= (others => '0');
    int_m1_d0            <= (others => '0');
    m1_q0                <= STD_LOGIC_VECTOR(RESIZE(int_m1_q0, 64));
    int_m1_address1      <= raddr(14 downto 3) when ar_hs = '1' else waddr(14 downto 3);
    int_m1_ce1           <= '1' when ar_hs = '1' or (int_m1_write = '1' and WVALID  = '1') else '0';
    int_m1_we1           <= '1' when int_m1_write = '1' and w_hs = '1' else '0';
    int_m1_be1           <= SHIFT_LEFT(RESIZE(UNSIGNED(WSTRB), 8), TO_INTEGER(waddr(2 downto 2)) * 4);
    int_m1_d1            <= RESIZE(UNSIGNED(WDATA) & UNSIGNED(WDATA), 64);
    -- m2
    int_m2_address0      <= UNSIGNED(m2_address0);
    int_m2_ce0           <= m2_ce0;
    int_m2_we0           <= '0';
    int_m2_be0           <= (others => '0');
    int_m2_d0            <= (others => '0');
    m2_q0                <= STD_LOGIC_VECTOR(RESIZE(int_m2_q0, 64));
    int_m2_address1      <= raddr(14 downto 3) when ar_hs = '1' else waddr(14 downto 3);
    int_m2_ce1           <= '1' when ar_hs = '1' or (int_m2_write = '1' and WVALID  = '1') else '0';
    int_m2_we1           <= '1' when int_m2_write = '1' and w_hs = '1' else '0';
    int_m2_be1           <= SHIFT_LEFT(RESIZE(UNSIGNED(WSTRB), 8), TO_INTEGER(waddr(2 downto 2)) * 4);
    int_m2_d1            <= RESIZE(UNSIGNED(WDATA) & UNSIGNED(WDATA), 64);
    -- prod
    int_prod_address0    <= UNSIGNED(prod_address0);
    int_prod_ce0         <= prod_ce0;
    int_prod_we0         <= prod_we0;
    int_prod_be0         <= (others => prod_we0);
    int_prod_d0          <= RESIZE(UNSIGNED(prod_d0), 64);
    prod_q0              <= STD_LOGIC_VECTOR(RESIZE(int_prod_q0, 64));
    int_prod_address1    <= raddr(14 downto 3) when ar_hs = '1' else waddr(14 downto 3);
    int_prod_ce1         <= '1' when ar_hs = '1' or (int_prod_write = '1' and WVALID  = '1') else '0';
    int_prod_we1         <= '1' when int_prod_write = '1' and w_hs = '1' else '0';
    int_prod_be1         <= SHIFT_LEFT(RESIZE(UNSIGNED(WSTRB), 8), TO_INTEGER(waddr(2 downto 2)) * 4);
    int_prod_d1          <= RESIZE(UNSIGNED(WDATA) & UNSIGNED(WDATA), 64);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_m1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_M1_BASE and raddr <= ADDR_M1_HIGH) then
                    int_m1_read <= '1';
                else
                    int_m1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_m1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_M1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_M1_HIGH) then
                    int_m1_write <= '1';
                elsif (w_hs = '1') then
                    int_m1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    int_m1_shift <= raddr(2 downto 2);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_m2_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_M2_BASE and raddr <= ADDR_M2_HIGH) then
                    int_m2_read <= '1';
                else
                    int_m2_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_m2_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_M2_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_M2_HIGH) then
                    int_m2_write <= '1';
                elsif (w_hs = '1') then
                    int_m2_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    int_m2_shift <= raddr(2 downto 2);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_prod_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_PROD_BASE and raddr <= ADDR_PROD_HIGH) then
                    int_prod_read <= '1';
                else
                    int_prod_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_prod_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_PROD_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_PROD_HIGH) then
                    int_prod_write <= '1';
                elsif (w_hs = '1') then
                    int_prod_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    int_prod_shift <= raddr(2 downto 2);
                end if;
            end if;
        end if;
    end process;


end architecture behave;

library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity bbgemm_BUS_A_s_axi_ram is
    generic (
        BYTES   : INTEGER :=4;
        DEPTH   : INTEGER :=256;
        AWIDTH  : INTEGER :=8);
    port (
        clk0    : in  STD_LOGIC;
        address0: in  UNSIGNED(AWIDTH-1 downto 0);
        ce0     : in  STD_LOGIC;
        we0     : in  STD_LOGIC;
        be0     : in  UNSIGNED(BYTES-1 downto 0);
        d0      : in  UNSIGNED(BYTES*8-1 downto 0);
        q0      : out UNSIGNED(BYTES*8-1 downto 0);
        clk1    : in  STD_LOGIC;
        address1: in  UNSIGNED(AWIDTH-1 downto 0);
        ce1     : in  STD_LOGIC;
        we1     : in  STD_LOGIC;
        be1     : in  UNSIGNED(BYTES-1 downto 0);
        d1      : in  UNSIGNED(BYTES*8-1 downto 0);
        q1      : out UNSIGNED(BYTES*8-1 downto 0));

end entity bbgemm_BUS_A_s_axi_ram;

architecture behave of bbgemm_BUS_A_s_axi_ram is
    signal address0_tmp : UNSIGNED(AWIDTH-1 downto 0);
    signal address1_tmp : UNSIGNED(AWIDTH-1 downto 0);
    type RAM_T is array (0 to DEPTH - 1) of UNSIGNED(BYTES*8 - 1 downto 0);
    shared variable mem : RAM_T := (others => (others => '0'));
begin

    process (address0)
    begin
    address0_tmp <= address0;
    --synthesis translate_off
          if (address0 > DEPTH-1) then
              address0_tmp <= (others => '0');
          else
              address0_tmp <= address0;
          end if;
    --synthesis translate_on
    end process;

    process (address1)
    begin
    address1_tmp <= address1;
    --synthesis translate_off
          if (address1 > DEPTH-1) then
              address1_tmp <= (others => '0');
          else
              address1_tmp <= address1;
          end if;
    --synthesis translate_on
    end process;

    --read port 0
    process (clk0) begin
        if (clk0'event and clk0 = '1') then
            if (ce0 = '1') then
                q0 <= mem(to_integer(address0_tmp));
            end if;
        end if;
    end process;

    --read port 1
    process (clk1) begin
        if (clk1'event and clk1 = '1') then
            if (ce1 = '1') then
                q1 <= mem(to_integer(address1_tmp));
            end if;
        end if;
    end process;

    gen_write : for i in 0 to BYTES - 1 generate
    begin
        --write port 0
        process (clk0)
        begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1' and we0 = '1' and be0(i) = '1') then
                    mem(to_integer(address0_tmp))(8*i+7 downto 8*i) := d0(8*i+7 downto 8*i);
                end if;
            end if;
        end process;

        --write port 1
        process (clk1)
        begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1' and we1 = '1' and be1(i) = '1') then
                    mem(to_integer(address1_tmp))(8*i+7 downto 8*i) := d1(8*i+7 downto 8*i);
                end if;
            end if;
        end process;

    end generate;

end architecture behave;


