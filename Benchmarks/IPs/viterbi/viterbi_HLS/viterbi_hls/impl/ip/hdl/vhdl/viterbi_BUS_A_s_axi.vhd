-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity viterbi_BUS_A_s_axi is
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
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC;
    ap_return             :in   STD_LOGIC_VECTOR(31 downto 0);
    obs_address0          :in   STD_LOGIC_VECTOR(7 downto 0);
    obs_ce0               :in   STD_LOGIC;
    obs_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    init_address0         :in   STD_LOGIC_VECTOR(5 downto 0);
    init_ce0              :in   STD_LOGIC;
    init_q0               :out  STD_LOGIC_VECTOR(63 downto 0);
    path_address0         :in   STD_LOGIC_VECTOR(7 downto 0);
    path_ce0              :in   STD_LOGIC;
    path_we0              :in   STD_LOGIC;
    path_d0               :in   STD_LOGIC_VECTOR(7 downto 0);
    transition_address0   :in   STD_LOGIC_VECTOR(11 downto 0);
    transition_ce0        :in   STD_LOGIC;
    transition_q0         :out  STD_LOGIC_VECTOR(63 downto 0);
    emission_address0     :in   STD_LOGIC_VECTOR(11 downto 0);
    emission_ce0          :in   STD_LOGIC;
    emission_q0           :out  STD_LOGIC_VECTOR(63 downto 0)
);
end entity viterbi_BUS_A_s_axi;

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
-- 0x00010 : Data signal of ap_return
--           bit 31~0 - ap_return[31:0] (Read)
-- 0x00100 ~
-- 0x001ff : Memory 'obs' (140 * 8b)
--           Word n : bit [ 7: 0] - obs[4n]
--                    bit [15: 8] - obs[4n+1]
--                    bit [23:16] - obs[4n+2]
--                    bit [31:24] - obs[4n+3]
-- 0x00200 ~
-- 0x003ff : Memory 'init' (64 * 64b)
--           Word 2n   : bit [31:0] - init[n][31: 0]
--           Word 2n+1 : bit [31:0] - init[n][63:32]
-- 0x00400 ~
-- 0x004ff : Memory 'path' (140 * 8b)
--           Word n : bit [ 7: 0] - path[4n]
--                    bit [15: 8] - path[4n+1]
--                    bit [23:16] - path[4n+2]
--                    bit [31:24] - path[4n+3]
-- 0x08000 ~
-- 0x0ffff : Memory 'transition' (4096 * 64b)
--           Word 2n   : bit [31:0] - transition[n][31: 0]
--           Word 2n+1 : bit [31:0] - transition[n][63:32]
-- 0x10000 ~
-- 0x17fff : Memory 'emission' (4096 * 64b)
--           Word 2n   : bit [31:0] - emission[n][31: 0]
--           Word 2n+1 : bit [31:0] - emission[n][63:32]
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of viterbi_BUS_A_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL         : INTEGER := 16#00000#;
    constant ADDR_GIE             : INTEGER := 16#00004#;
    constant ADDR_IER             : INTEGER := 16#00008#;
    constant ADDR_ISR             : INTEGER := 16#0000c#;
    constant ADDR_AP_RETURN_0     : INTEGER := 16#00010#;
    constant ADDR_OBS_BASE        : INTEGER := 16#00100#;
    constant ADDR_OBS_HIGH        : INTEGER := 16#001ff#;
    constant ADDR_INIT_BASE       : INTEGER := 16#00200#;
    constant ADDR_INIT_HIGH       : INTEGER := 16#003ff#;
    constant ADDR_PATH_BASE       : INTEGER := 16#00400#;
    constant ADDR_PATH_HIGH       : INTEGER := 16#004ff#;
    constant ADDR_TRANSITION_BASE : INTEGER := 16#08000#;
    constant ADDR_TRANSITION_HIGH : INTEGER := 16#0ffff#;
    constant ADDR_EMISSION_BASE   : INTEGER := 16#10000#;
    constant ADDR_EMISSION_HIGH   : INTEGER := 16#17fff#;
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
    signal int_ap_return       : UNSIGNED(31 downto 0);
    -- memory signals
    signal int_obs_address0    : UNSIGNED(5 downto 0);
    signal int_obs_ce0         : STD_LOGIC;
    signal int_obs_we0         : STD_LOGIC;
    signal int_obs_be0         : UNSIGNED(3 downto 0);
    signal int_obs_d0          : UNSIGNED(31 downto 0);
    signal int_obs_q0          : UNSIGNED(31 downto 0);
    signal int_obs_address1    : UNSIGNED(5 downto 0);
    signal int_obs_ce1         : STD_LOGIC;
    signal int_obs_we1         : STD_LOGIC;
    signal int_obs_be1         : UNSIGNED(3 downto 0);
    signal int_obs_d1          : UNSIGNED(31 downto 0);
    signal int_obs_q1          : UNSIGNED(31 downto 0);
    signal int_obs_read        : STD_LOGIC;
    signal int_obs_write       : STD_LOGIC;
    signal int_obs_shift       : UNSIGNED(1 downto 0);
    signal int_init_address0   : UNSIGNED(5 downto 0);
    signal int_init_ce0        : STD_LOGIC;
    signal int_init_we0        : STD_LOGIC;
    signal int_init_be0        : UNSIGNED(7 downto 0);
    signal int_init_d0         : UNSIGNED(63 downto 0);
    signal int_init_q0         : UNSIGNED(63 downto 0);
    signal int_init_address1   : UNSIGNED(5 downto 0);
    signal int_init_ce1        : STD_LOGIC;
    signal int_init_we1        : STD_LOGIC;
    signal int_init_be1        : UNSIGNED(7 downto 0);
    signal int_init_d1         : UNSIGNED(63 downto 0);
    signal int_init_q1         : UNSIGNED(63 downto 0);
    signal int_init_read       : STD_LOGIC;
    signal int_init_write      : STD_LOGIC;
    signal int_init_shift      : UNSIGNED(0 downto 0);
    signal int_path_address0   : UNSIGNED(5 downto 0);
    signal int_path_ce0        : STD_LOGIC;
    signal int_path_we0        : STD_LOGIC;
    signal int_path_be0        : UNSIGNED(3 downto 0);
    signal int_path_d0         : UNSIGNED(31 downto 0);
    signal int_path_q0         : UNSIGNED(31 downto 0);
    signal int_path_address1   : UNSIGNED(5 downto 0);
    signal int_path_ce1        : STD_LOGIC;
    signal int_path_we1        : STD_LOGIC;
    signal int_path_be1        : UNSIGNED(3 downto 0);
    signal int_path_d1         : UNSIGNED(31 downto 0);
    signal int_path_q1         : UNSIGNED(31 downto 0);
    signal int_path_read       : STD_LOGIC;
    signal int_path_write      : STD_LOGIC;
    signal int_path_shift      : UNSIGNED(1 downto 0);
    signal int_transition_address0 : UNSIGNED(11 downto 0);
    signal int_transition_ce0  : STD_LOGIC;
    signal int_transition_we0  : STD_LOGIC;
    signal int_transition_be0  : UNSIGNED(7 downto 0);
    signal int_transition_d0   : UNSIGNED(63 downto 0);
    signal int_transition_q0   : UNSIGNED(63 downto 0);
    signal int_transition_address1 : UNSIGNED(11 downto 0);
    signal int_transition_ce1  : STD_LOGIC;
    signal int_transition_we1  : STD_LOGIC;
    signal int_transition_be1  : UNSIGNED(7 downto 0);
    signal int_transition_d1   : UNSIGNED(63 downto 0);
    signal int_transition_q1   : UNSIGNED(63 downto 0);
    signal int_transition_read : STD_LOGIC;
    signal int_transition_write : STD_LOGIC;
    signal int_transition_shift : UNSIGNED(0 downto 0);
    signal int_emission_address0 : UNSIGNED(11 downto 0);
    signal int_emission_ce0    : STD_LOGIC;
    signal int_emission_we0    : STD_LOGIC;
    signal int_emission_be0    : UNSIGNED(7 downto 0);
    signal int_emission_d0     : UNSIGNED(63 downto 0);
    signal int_emission_q0     : UNSIGNED(63 downto 0);
    signal int_emission_address1 : UNSIGNED(11 downto 0);
    signal int_emission_ce1    : STD_LOGIC;
    signal int_emission_we1    : STD_LOGIC;
    signal int_emission_be1    : UNSIGNED(7 downto 0);
    signal int_emission_d1     : UNSIGNED(63 downto 0);
    signal int_emission_q1     : UNSIGNED(63 downto 0);
    signal int_emission_read   : STD_LOGIC;
    signal int_emission_write  : STD_LOGIC;
    signal int_emission_shift  : UNSIGNED(0 downto 0);

    component viterbi_BUS_A_s_axi_ram is
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
    end component viterbi_BUS_A_s_axi_ram;

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
-- int_obs
int_obs : viterbi_BUS_A_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 35,
     AWIDTH   => log2(35))
port map (
     clk0     => ACLK,
     address0 => int_obs_address0,
     ce0      => int_obs_ce0,
     we0      => int_obs_we0,
     be0      => int_obs_be0,
     d0       => int_obs_d0,
     q0       => int_obs_q0,
     clk1     => ACLK,
     address1 => int_obs_address1,
     ce1      => int_obs_ce1,
     we1      => int_obs_we1,
     be1      => int_obs_be1,
     d1       => int_obs_d1,
     q1       => int_obs_q1);
-- int_init
int_init : viterbi_BUS_A_s_axi_ram
generic map (
     BYTES    => 8,
     DEPTH    => 64,
     AWIDTH   => log2(64))
port map (
     clk0     => ACLK,
     address0 => int_init_address0,
     ce0      => int_init_ce0,
     we0      => int_init_we0,
     be0      => int_init_be0,
     d0       => int_init_d0,
     q0       => int_init_q0,
     clk1     => ACLK,
     address1 => int_init_address1,
     ce1      => int_init_ce1,
     we1      => int_init_we1,
     be1      => int_init_be1,
     d1       => int_init_d1,
     q1       => int_init_q1);
-- int_path
int_path : viterbi_BUS_A_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 35,
     AWIDTH   => log2(35))
port map (
     clk0     => ACLK,
     address0 => int_path_address0,
     ce0      => int_path_ce0,
     we0      => int_path_we0,
     be0      => int_path_be0,
     d0       => int_path_d0,
     q0       => int_path_q0,
     clk1     => ACLK,
     address1 => int_path_address1,
     ce1      => int_path_ce1,
     we1      => int_path_we1,
     be1      => int_path_be1,
     d1       => int_path_d1,
     q1       => int_path_q1);
-- int_transition
int_transition : viterbi_BUS_A_s_axi_ram
generic map (
     BYTES    => 8,
     DEPTH    => 4096,
     AWIDTH   => log2(4096))
port map (
     clk0     => ACLK,
     address0 => int_transition_address0,
     ce0      => int_transition_ce0,
     we0      => int_transition_we0,
     be0      => int_transition_be0,
     d0       => int_transition_d0,
     q0       => int_transition_q0,
     clk1     => ACLK,
     address1 => int_transition_address1,
     ce1      => int_transition_ce1,
     we1      => int_transition_we1,
     be1      => int_transition_be1,
     d1       => int_transition_d1,
     q1       => int_transition_q1);
-- int_emission
int_emission : viterbi_BUS_A_s_axi_ram
generic map (
     BYTES    => 8,
     DEPTH    => 4096,
     AWIDTH   => log2(4096))
port map (
     clk0     => ACLK,
     address0 => int_emission_address0,
     ce0      => int_emission_ce0,
     we0      => int_emission_we0,
     be0      => int_emission_be0,
     d0       => int_emission_d0,
     q0       => int_emission_q0,
     clk1     => ACLK,
     address1 => int_emission_address1,
     ce1      => int_emission_ce1,
     we1      => int_emission_we1,
     be1      => int_emission_be1,
     d1       => int_emission_d1,
     q1       => int_emission_q1);


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
    RVALID_t  <= '1' when (rstate = rddata) and (int_obs_read = '0') and (int_init_read = '0') and (int_path_read = '0') and (int_transition_read = '0') and (int_emission_read = '0') else '0';
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
                    when ADDR_AP_RETURN_0 =>
                        rdata_data <= RESIZE(int_ap_return(31 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                elsif (int_obs_read = '1') then
                    rdata_data <= int_obs_q1;
                elsif (int_init_read = '1') then
                    rdata_data <= RESIZE(SHIFT_RIGHT(int_init_q1, TO_INTEGER(int_init_shift)*32), 32);
                elsif (int_path_read = '1') then
                    rdata_data <= int_path_q1;
                elsif (int_transition_read = '1') then
                    rdata_data <= RESIZE(SHIFT_RIGHT(int_transition_q1, TO_INTEGER(int_transition_shift)*32), 32);
                elsif (int_emission_read = '1') then
                    rdata_data <= RESIZE(SHIFT_RIGHT(int_emission_q1, TO_INTEGER(int_emission_shift)*32), 32);
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

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_return <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (ap_done = '1') then
                    int_ap_return <= UNSIGNED(ap_return);
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------
    -- obs
    int_obs_address0     <= SHIFT_RIGHT(UNSIGNED(obs_address0), 2)(5 downto 0);
    int_obs_ce0          <= obs_ce0;
    int_obs_we0          <= '0';
    int_obs_be0          <= (others => '0');
    int_obs_d0           <= (others => '0');
    obs_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_obs_q0, TO_INTEGER(int_obs_shift) * 8)(7 downto 0));
    int_obs_address1     <= raddr(7 downto 2) when ar_hs = '1' else waddr(7 downto 2);
    int_obs_ce1          <= '1' when ar_hs = '1' or (int_obs_write = '1' and WVALID  = '1') else '0';
    int_obs_we1          <= '1' when int_obs_write = '1' and w_hs = '1' else '0';
    int_obs_be1          <= UNSIGNED(WSTRB);
    int_obs_d1           <= UNSIGNED(WDATA);
    -- init
    int_init_address0    <= UNSIGNED(init_address0);
    int_init_ce0         <= init_ce0;
    int_init_we0         <= '0';
    int_init_be0         <= (others => '0');
    int_init_d0          <= (others => '0');
    init_q0              <= STD_LOGIC_VECTOR(RESIZE(int_init_q0, 64));
    int_init_address1    <= raddr(8 downto 3) when ar_hs = '1' else waddr(8 downto 3);
    int_init_ce1         <= '1' when ar_hs = '1' or (int_init_write = '1' and WVALID  = '1') else '0';
    int_init_we1         <= '1' when int_init_write = '1' and w_hs = '1' else '0';
    int_init_be1         <= SHIFT_LEFT(RESIZE(UNSIGNED(WSTRB), 8), TO_INTEGER(waddr(2 downto 2)) * 4);
    int_init_d1          <= RESIZE(UNSIGNED(WDATA) & UNSIGNED(WDATA), 64);
    -- path
    int_path_address0    <= SHIFT_RIGHT(UNSIGNED(path_address0), 2)(5 downto 0);
    int_path_ce0         <= path_ce0;
    int_path_we0         <= path_we0;
    int_path_be0         <= SHIFT_LEFT(TO_UNSIGNED(1, 4), TO_INTEGER(UNSIGNED(path_address0(1 downto 0))));
    int_path_d0          <= UNSIGNED(path_d0) & UNSIGNED(path_d0) & UNSIGNED(path_d0) & UNSIGNED(path_d0);
    int_path_address1    <= raddr(7 downto 2) when ar_hs = '1' else waddr(7 downto 2);
    int_path_ce1         <= '1' when ar_hs = '1' or (int_path_write = '1' and WVALID  = '1') else '0';
    int_path_we1         <= '1' when int_path_write = '1' and w_hs = '1' else '0';
    int_path_be1         <= UNSIGNED(WSTRB);
    int_path_d1          <= UNSIGNED(WDATA);
    -- transition
    int_transition_address0 <= UNSIGNED(transition_address0);
    int_transition_ce0   <= transition_ce0;
    int_transition_we0   <= '0';
    int_transition_be0   <= (others => '0');
    int_transition_d0    <= (others => '0');
    transition_q0        <= STD_LOGIC_VECTOR(RESIZE(int_transition_q0, 64));
    int_transition_address1 <= raddr(14 downto 3) when ar_hs = '1' else waddr(14 downto 3);
    int_transition_ce1   <= '1' when ar_hs = '1' or (int_transition_write = '1' and WVALID  = '1') else '0';
    int_transition_we1   <= '1' when int_transition_write = '1' and w_hs = '1' else '0';
    int_transition_be1   <= SHIFT_LEFT(RESIZE(UNSIGNED(WSTRB), 8), TO_INTEGER(waddr(2 downto 2)) * 4);
    int_transition_d1    <= RESIZE(UNSIGNED(WDATA) & UNSIGNED(WDATA), 64);
    -- emission
    int_emission_address0 <= UNSIGNED(emission_address0);
    int_emission_ce0     <= emission_ce0;
    int_emission_we0     <= '0';
    int_emission_be0     <= (others => '0');
    int_emission_d0      <= (others => '0');
    emission_q0          <= STD_LOGIC_VECTOR(RESIZE(int_emission_q0, 64));
    int_emission_address1 <= raddr(14 downto 3) when ar_hs = '1' else waddr(14 downto 3);
    int_emission_ce1     <= '1' when ar_hs = '1' or (int_emission_write = '1' and WVALID  = '1') else '0';
    int_emission_we1     <= '1' when int_emission_write = '1' and w_hs = '1' else '0';
    int_emission_be1     <= SHIFT_LEFT(RESIZE(UNSIGNED(WSTRB), 8), TO_INTEGER(waddr(2 downto 2)) * 4);
    int_emission_d1      <= RESIZE(UNSIGNED(WDATA) & UNSIGNED(WDATA), 64);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_obs_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_OBS_BASE and raddr <= ADDR_OBS_HIGH) then
                    int_obs_read <= '1';
                else
                    int_obs_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_obs_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_OBS_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_OBS_HIGH) then
                    int_obs_write <= '1';
                elsif (w_hs = '1') then
                    int_obs_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (obs_ce0 = '1') then
                    int_obs_shift <= UNSIGNED(obs_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_init_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_INIT_BASE and raddr <= ADDR_INIT_HIGH) then
                    int_init_read <= '1';
                else
                    int_init_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_init_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_INIT_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_INIT_HIGH) then
                    int_init_write <= '1';
                elsif (w_hs = '1') then
                    int_init_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    int_init_shift <= raddr(2 downto 2);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_path_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_PATH_BASE and raddr <= ADDR_PATH_HIGH) then
                    int_path_read <= '1';
                else
                    int_path_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_path_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_PATH_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_PATH_HIGH) then
                    int_path_write <= '1';
                elsif (w_hs = '1') then
                    int_path_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (path_ce0 = '1') then
                    int_path_shift <= UNSIGNED(path_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_transition_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_TRANSITION_BASE and raddr <= ADDR_TRANSITION_HIGH) then
                    int_transition_read <= '1';
                else
                    int_transition_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_transition_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_TRANSITION_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_TRANSITION_HIGH) then
                    int_transition_write <= '1';
                elsif (w_hs = '1') then
                    int_transition_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    int_transition_shift <= raddr(2 downto 2);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_emission_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_EMISSION_BASE and raddr <= ADDR_EMISSION_HIGH) then
                    int_emission_read <= '1';
                else
                    int_emission_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_emission_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_EMISSION_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_EMISSION_HIGH) then
                    int_emission_write <= '1';
                elsif (w_hs = '1') then
                    int_emission_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    int_emission_shift <= raddr(2 downto 2);
                end if;
            end if;
        end if;
    end process;


end architecture behave;

library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity viterbi_BUS_A_s_axi_ram is
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

end entity viterbi_BUS_A_s_axi_ram;

architecture behave of viterbi_BUS_A_s_axi_ram is
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


