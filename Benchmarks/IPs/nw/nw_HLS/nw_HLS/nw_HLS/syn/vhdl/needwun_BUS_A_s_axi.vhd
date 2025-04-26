-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity needwun_BUS_A_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 18;
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
    SEQA_address0         :in   STD_LOGIC_VECTOR(6 downto 0);
    SEQA_ce0              :in   STD_LOGIC;
    SEQA_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    SEQB_address0         :in   STD_LOGIC_VECTOR(6 downto 0);
    SEQB_ce0              :in   STD_LOGIC;
    SEQB_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    alignedA_address0     :in   STD_LOGIC_VECTOR(7 downto 0);
    alignedA_ce0          :in   STD_LOGIC;
    alignedA_we0          :in   STD_LOGIC;
    alignedA_d0           :in   STD_LOGIC_VECTOR(7 downto 0);
    alignedB_address0     :in   STD_LOGIC_VECTOR(7 downto 0);
    alignedB_ce0          :in   STD_LOGIC;
    alignedB_we0          :in   STD_LOGIC;
    alignedB_d0           :in   STD_LOGIC_VECTOR(7 downto 0);
    ptr_address0          :in   STD_LOGIC_VECTOR(14 downto 0);
    ptr_ce0               :in   STD_LOGIC;
    ptr_we0               :in   STD_LOGIC;
    ptr_d0                :in   STD_LOGIC_VECTOR(7 downto 0);
    ptr_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    M_address0            :in   STD_LOGIC_VECTOR(14 downto 0);
    M_ce0                 :in   STD_LOGIC;
    M_we0                 :in   STD_LOGIC;
    M_d0                  :in   STD_LOGIC_VECTOR(31 downto 0);
    M_q0                  :out  STD_LOGIC_VECTOR(31 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC
);
end entity needwun_BUS_A_s_axi;

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
-- 0x00080 ~
-- 0x000ff : Memory 'SEQA' (128 * 8b)
--           Word n : bit [ 7: 0] - SEQA[4n]
--                    bit [15: 8] - SEQA[4n+1]
--                    bit [23:16] - SEQA[4n+2]
--                    bit [31:24] - SEQA[4n+3]
-- 0x00100 ~
-- 0x0017f : Memory 'SEQB' (128 * 8b)
--           Word n : bit [ 7: 0] - SEQB[4n]
--                    bit [15: 8] - SEQB[4n+1]
--                    bit [23:16] - SEQB[4n+2]
--                    bit [31:24] - SEQB[4n+3]
-- 0x00200 ~
-- 0x002ff : Memory 'alignedA' (256 * 8b)
--           Word n : bit [ 7: 0] - alignedA[4n]
--                    bit [15: 8] - alignedA[4n+1]
--                    bit [23:16] - alignedA[4n+2]
--                    bit [31:24] - alignedA[4n+3]
-- 0x00300 ~
-- 0x003ff : Memory 'alignedB' (256 * 8b)
--           Word n : bit [ 7: 0] - alignedB[4n]
--                    bit [15: 8] - alignedB[4n+1]
--                    bit [23:16] - alignedB[4n+2]
--                    bit [31:24] - alignedB[4n+3]
-- 0x08000 ~
-- 0x0ffff : Memory 'ptr' (16641 * 8b)
--           Word n : bit [ 7: 0] - ptr[4n]
--                    bit [15: 8] - ptr[4n+1]
--                    bit [23:16] - ptr[4n+2]
--                    bit [31:24] - ptr[4n+3]
-- 0x20000 ~
-- 0x3ffff : Memory 'M' (16641 * 32b)
--           Word n : bit [31:0] - M[n]
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of needwun_BUS_A_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL       : INTEGER := 16#00000#;
    constant ADDR_GIE           : INTEGER := 16#00004#;
    constant ADDR_IER           : INTEGER := 16#00008#;
    constant ADDR_ISR           : INTEGER := 16#0000c#;
    constant ADDR_SEQA_BASE     : INTEGER := 16#00080#;
    constant ADDR_SEQA_HIGH     : INTEGER := 16#000ff#;
    constant ADDR_SEQB_BASE     : INTEGER := 16#00100#;
    constant ADDR_SEQB_HIGH     : INTEGER := 16#0017f#;
    constant ADDR_ALIGNEDA_BASE : INTEGER := 16#00200#;
    constant ADDR_ALIGNEDA_HIGH : INTEGER := 16#002ff#;
    constant ADDR_ALIGNEDB_BASE : INTEGER := 16#00300#;
    constant ADDR_ALIGNEDB_HIGH : INTEGER := 16#003ff#;
    constant ADDR_PTR_BASE      : INTEGER := 16#08000#;
    constant ADDR_PTR_HIGH      : INTEGER := 16#0ffff#;
    constant ADDR_M_BASE        : INTEGER := 16#20000#;
    constant ADDR_M_HIGH        : INTEGER := 16#3ffff#;
    constant ADDR_BITS         : INTEGER := 18;

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
    signal int_SEQA_address0   : UNSIGNED(4 downto 0);
    signal int_SEQA_ce0        : STD_LOGIC;
    signal int_SEQA_we0        : STD_LOGIC;
    signal int_SEQA_be0        : UNSIGNED(3 downto 0);
    signal int_SEQA_d0         : UNSIGNED(31 downto 0);
    signal int_SEQA_q0         : UNSIGNED(31 downto 0);
    signal int_SEQA_address1   : UNSIGNED(4 downto 0);
    signal int_SEQA_ce1        : STD_LOGIC;
    signal int_SEQA_we1        : STD_LOGIC;
    signal int_SEQA_be1        : UNSIGNED(3 downto 0);
    signal int_SEQA_d1         : UNSIGNED(31 downto 0);
    signal int_SEQA_q1         : UNSIGNED(31 downto 0);
    signal int_SEQA_read       : STD_LOGIC;
    signal int_SEQA_write      : STD_LOGIC;
    signal int_SEQA_shift      : UNSIGNED(1 downto 0);
    signal int_SEQB_address0   : UNSIGNED(4 downto 0);
    signal int_SEQB_ce0        : STD_LOGIC;
    signal int_SEQB_we0        : STD_LOGIC;
    signal int_SEQB_be0        : UNSIGNED(3 downto 0);
    signal int_SEQB_d0         : UNSIGNED(31 downto 0);
    signal int_SEQB_q0         : UNSIGNED(31 downto 0);
    signal int_SEQB_address1   : UNSIGNED(4 downto 0);
    signal int_SEQB_ce1        : STD_LOGIC;
    signal int_SEQB_we1        : STD_LOGIC;
    signal int_SEQB_be1        : UNSIGNED(3 downto 0);
    signal int_SEQB_d1         : UNSIGNED(31 downto 0);
    signal int_SEQB_q1         : UNSIGNED(31 downto 0);
    signal int_SEQB_read       : STD_LOGIC;
    signal int_SEQB_write      : STD_LOGIC;
    signal int_SEQB_shift      : UNSIGNED(1 downto 0);
    signal int_alignedA_address0 : UNSIGNED(5 downto 0);
    signal int_alignedA_ce0    : STD_LOGIC;
    signal int_alignedA_we0    : STD_LOGIC;
    signal int_alignedA_be0    : UNSIGNED(3 downto 0);
    signal int_alignedA_d0     : UNSIGNED(31 downto 0);
    signal int_alignedA_q0     : UNSIGNED(31 downto 0);
    signal int_alignedA_address1 : UNSIGNED(5 downto 0);
    signal int_alignedA_ce1    : STD_LOGIC;
    signal int_alignedA_we1    : STD_LOGIC;
    signal int_alignedA_be1    : UNSIGNED(3 downto 0);
    signal int_alignedA_d1     : UNSIGNED(31 downto 0);
    signal int_alignedA_q1     : UNSIGNED(31 downto 0);
    signal int_alignedA_read   : STD_LOGIC;
    signal int_alignedA_write  : STD_LOGIC;
    signal int_alignedA_shift  : UNSIGNED(1 downto 0);
    signal int_alignedB_address0 : UNSIGNED(5 downto 0);
    signal int_alignedB_ce0    : STD_LOGIC;
    signal int_alignedB_we0    : STD_LOGIC;
    signal int_alignedB_be0    : UNSIGNED(3 downto 0);
    signal int_alignedB_d0     : UNSIGNED(31 downto 0);
    signal int_alignedB_q0     : UNSIGNED(31 downto 0);
    signal int_alignedB_address1 : UNSIGNED(5 downto 0);
    signal int_alignedB_ce1    : STD_LOGIC;
    signal int_alignedB_we1    : STD_LOGIC;
    signal int_alignedB_be1    : UNSIGNED(3 downto 0);
    signal int_alignedB_d1     : UNSIGNED(31 downto 0);
    signal int_alignedB_q1     : UNSIGNED(31 downto 0);
    signal int_alignedB_read   : STD_LOGIC;
    signal int_alignedB_write  : STD_LOGIC;
    signal int_alignedB_shift  : UNSIGNED(1 downto 0);
    signal int_ptr_address0    : UNSIGNED(12 downto 0);
    signal int_ptr_ce0         : STD_LOGIC;
    signal int_ptr_we0         : STD_LOGIC;
    signal int_ptr_be0         : UNSIGNED(3 downto 0);
    signal int_ptr_d0          : UNSIGNED(31 downto 0);
    signal int_ptr_q0          : UNSIGNED(31 downto 0);
    signal int_ptr_address1    : UNSIGNED(12 downto 0);
    signal int_ptr_ce1         : STD_LOGIC;
    signal int_ptr_we1         : STD_LOGIC;
    signal int_ptr_be1         : UNSIGNED(3 downto 0);
    signal int_ptr_d1          : UNSIGNED(31 downto 0);
    signal int_ptr_q1          : UNSIGNED(31 downto 0);
    signal int_ptr_read        : STD_LOGIC;
    signal int_ptr_write       : STD_LOGIC;
    signal int_ptr_shift       : UNSIGNED(1 downto 0);
    signal int_M_address0      : UNSIGNED(14 downto 0);
    signal int_M_ce0           : STD_LOGIC;
    signal int_M_we0           : STD_LOGIC;
    signal int_M_be0           : UNSIGNED(3 downto 0);
    signal int_M_d0            : UNSIGNED(31 downto 0);
    signal int_M_q0            : UNSIGNED(31 downto 0);
    signal int_M_address1      : UNSIGNED(14 downto 0);
    signal int_M_ce1           : STD_LOGIC;
    signal int_M_we1           : STD_LOGIC;
    signal int_M_be1           : UNSIGNED(3 downto 0);
    signal int_M_d1            : UNSIGNED(31 downto 0);
    signal int_M_q1            : UNSIGNED(31 downto 0);
    signal int_M_read          : STD_LOGIC;
    signal int_M_write         : STD_LOGIC;

    component needwun_BUS_A_s_axi_ram is
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
    end component needwun_BUS_A_s_axi_ram;

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
-- int_SEQA
int_SEQA : needwun_BUS_A_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 32,
     AWIDTH   => log2(32))
port map (
     clk0     => ACLK,
     address0 => int_SEQA_address0,
     ce0      => int_SEQA_ce0,
     we0      => int_SEQA_we0,
     be0      => int_SEQA_be0,
     d0       => int_SEQA_d0,
     q0       => int_SEQA_q0,
     clk1     => ACLK,
     address1 => int_SEQA_address1,
     ce1      => int_SEQA_ce1,
     we1      => int_SEQA_we1,
     be1      => int_SEQA_be1,
     d1       => int_SEQA_d1,
     q1       => int_SEQA_q1);
-- int_SEQB
int_SEQB : needwun_BUS_A_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 32,
     AWIDTH   => log2(32))
port map (
     clk0     => ACLK,
     address0 => int_SEQB_address0,
     ce0      => int_SEQB_ce0,
     we0      => int_SEQB_we0,
     be0      => int_SEQB_be0,
     d0       => int_SEQB_d0,
     q0       => int_SEQB_q0,
     clk1     => ACLK,
     address1 => int_SEQB_address1,
     ce1      => int_SEQB_ce1,
     we1      => int_SEQB_we1,
     be1      => int_SEQB_be1,
     d1       => int_SEQB_d1,
     q1       => int_SEQB_q1);
-- int_alignedA
int_alignedA : needwun_BUS_A_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 64,
     AWIDTH   => log2(64))
port map (
     clk0     => ACLK,
     address0 => int_alignedA_address0,
     ce0      => int_alignedA_ce0,
     we0      => int_alignedA_we0,
     be0      => int_alignedA_be0,
     d0       => int_alignedA_d0,
     q0       => int_alignedA_q0,
     clk1     => ACLK,
     address1 => int_alignedA_address1,
     ce1      => int_alignedA_ce1,
     we1      => int_alignedA_we1,
     be1      => int_alignedA_be1,
     d1       => int_alignedA_d1,
     q1       => int_alignedA_q1);
-- int_alignedB
int_alignedB : needwun_BUS_A_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 64,
     AWIDTH   => log2(64))
port map (
     clk0     => ACLK,
     address0 => int_alignedB_address0,
     ce0      => int_alignedB_ce0,
     we0      => int_alignedB_we0,
     be0      => int_alignedB_be0,
     d0       => int_alignedB_d0,
     q0       => int_alignedB_q0,
     clk1     => ACLK,
     address1 => int_alignedB_address1,
     ce1      => int_alignedB_ce1,
     we1      => int_alignedB_we1,
     be1      => int_alignedB_be1,
     d1       => int_alignedB_d1,
     q1       => int_alignedB_q1);
-- int_ptr
int_ptr : needwun_BUS_A_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 4161,
     AWIDTH   => log2(4161))
port map (
     clk0     => ACLK,
     address0 => int_ptr_address0,
     ce0      => int_ptr_ce0,
     we0      => int_ptr_we0,
     be0      => int_ptr_be0,
     d0       => int_ptr_d0,
     q0       => int_ptr_q0,
     clk1     => ACLK,
     address1 => int_ptr_address1,
     ce1      => int_ptr_ce1,
     we1      => int_ptr_we1,
     be1      => int_ptr_be1,
     d1       => int_ptr_d1,
     q1       => int_ptr_q1);
-- int_M
int_M : needwun_BUS_A_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16641,
     AWIDTH   => log2(16641))
port map (
     clk0     => ACLK,
     address0 => int_M_address0,
     ce0      => int_M_ce0,
     we0      => int_M_we0,
     be0      => int_M_be0,
     d0       => int_M_d0,
     q0       => int_M_q0,
     clk1     => ACLK,
     address1 => int_M_address1,
     ce1      => int_M_ce1,
     we1      => int_M_we1,
     be1      => int_M_be1,
     d1       => int_M_d1,
     q1       => int_M_q1);


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
    RVALID_t  <= '1' when (rstate = rddata) and (int_SEQA_read = '0') and (int_SEQB_read = '0') and (int_alignedA_read = '0') and (int_alignedB_read = '0') and (int_ptr_read = '0') and (int_M_read = '0') else '0';
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
                elsif (int_SEQA_read = '1') then
                    rdata_data <= int_SEQA_q1;
                elsif (int_SEQB_read = '1') then
                    rdata_data <= int_SEQB_q1;
                elsif (int_alignedA_read = '1') then
                    rdata_data <= int_alignedA_q1;
                elsif (int_alignedB_read = '1') then
                    rdata_data <= int_alignedB_q1;
                elsif (int_ptr_read = '1') then
                    rdata_data <= int_ptr_q1;
                elsif (int_M_read = '1') then
                    rdata_data <= int_M_q1;
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
    -- SEQA
    int_SEQA_address0    <= SHIFT_RIGHT(UNSIGNED(SEQA_address0), 2)(4 downto 0);
    int_SEQA_ce0         <= SEQA_ce0;
    int_SEQA_we0         <= '0';
    int_SEQA_be0         <= (others => '0');
    int_SEQA_d0          <= (others => '0');
    SEQA_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_SEQA_q0, TO_INTEGER(int_SEQA_shift) * 8)(7 downto 0));
    int_SEQA_address1    <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_SEQA_ce1         <= '1' when ar_hs = '1' or (int_SEQA_write = '1' and WVALID  = '1') else '0';
    int_SEQA_we1         <= '1' when int_SEQA_write = '1' and w_hs = '1' else '0';
    int_SEQA_be1         <= UNSIGNED(WSTRB);
    int_SEQA_d1          <= UNSIGNED(WDATA);
    -- SEQB
    int_SEQB_address0    <= SHIFT_RIGHT(UNSIGNED(SEQB_address0), 2)(4 downto 0);
    int_SEQB_ce0         <= SEQB_ce0;
    int_SEQB_we0         <= '0';
    int_SEQB_be0         <= (others => '0');
    int_SEQB_d0          <= (others => '0');
    SEQB_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_SEQB_q0, TO_INTEGER(int_SEQB_shift) * 8)(7 downto 0));
    int_SEQB_address1    <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_SEQB_ce1         <= '1' when ar_hs = '1' or (int_SEQB_write = '1' and WVALID  = '1') else '0';
    int_SEQB_we1         <= '1' when int_SEQB_write = '1' and w_hs = '1' else '0';
    int_SEQB_be1         <= UNSIGNED(WSTRB);
    int_SEQB_d1          <= UNSIGNED(WDATA);
    -- alignedA
    int_alignedA_address0 <= SHIFT_RIGHT(UNSIGNED(alignedA_address0), 2)(5 downto 0);
    int_alignedA_ce0     <= alignedA_ce0;
    int_alignedA_we0     <= alignedA_we0;
    int_alignedA_be0     <= SHIFT_LEFT(TO_UNSIGNED(1, 4), TO_INTEGER(UNSIGNED(alignedA_address0(1 downto 0))));
    int_alignedA_d0      <= UNSIGNED(alignedA_d0) & UNSIGNED(alignedA_d0) & UNSIGNED(alignedA_d0) & UNSIGNED(alignedA_d0);
    int_alignedA_address1 <= raddr(7 downto 2) when ar_hs = '1' else waddr(7 downto 2);
    int_alignedA_ce1     <= '1' when ar_hs = '1' or (int_alignedA_write = '1' and WVALID  = '1') else '0';
    int_alignedA_we1     <= '1' when int_alignedA_write = '1' and w_hs = '1' else '0';
    int_alignedA_be1     <= UNSIGNED(WSTRB);
    int_alignedA_d1      <= UNSIGNED(WDATA);
    -- alignedB
    int_alignedB_address0 <= SHIFT_RIGHT(UNSIGNED(alignedB_address0), 2)(5 downto 0);
    int_alignedB_ce0     <= alignedB_ce0;
    int_alignedB_we0     <= alignedB_we0;
    int_alignedB_be0     <= SHIFT_LEFT(TO_UNSIGNED(1, 4), TO_INTEGER(UNSIGNED(alignedB_address0(1 downto 0))));
    int_alignedB_d0      <= UNSIGNED(alignedB_d0) & UNSIGNED(alignedB_d0) & UNSIGNED(alignedB_d0) & UNSIGNED(alignedB_d0);
    int_alignedB_address1 <= raddr(7 downto 2) when ar_hs = '1' else waddr(7 downto 2);
    int_alignedB_ce1     <= '1' when ar_hs = '1' or (int_alignedB_write = '1' and WVALID  = '1') else '0';
    int_alignedB_we1     <= '1' when int_alignedB_write = '1' and w_hs = '1' else '0';
    int_alignedB_be1     <= UNSIGNED(WSTRB);
    int_alignedB_d1      <= UNSIGNED(WDATA);
    -- ptr
    int_ptr_address0     <= SHIFT_RIGHT(UNSIGNED(ptr_address0), 2)(12 downto 0);
    int_ptr_ce0          <= ptr_ce0;
    int_ptr_we0          <= ptr_we0;
    int_ptr_be0          <= SHIFT_LEFT(TO_UNSIGNED(1, 4), TO_INTEGER(UNSIGNED(ptr_address0(1 downto 0))));
    int_ptr_d0           <= UNSIGNED(ptr_d0) & UNSIGNED(ptr_d0) & UNSIGNED(ptr_d0) & UNSIGNED(ptr_d0);
    ptr_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_ptr_q0, TO_INTEGER(int_ptr_shift) * 8)(7 downto 0));
    int_ptr_address1     <= raddr(14 downto 2) when ar_hs = '1' else waddr(14 downto 2);
    int_ptr_ce1          <= '1' when ar_hs = '1' or (int_ptr_write = '1' and WVALID  = '1') else '0';
    int_ptr_we1          <= '1' when int_ptr_write = '1' and w_hs = '1' else '0';
    int_ptr_be1          <= UNSIGNED(WSTRB);
    int_ptr_d1           <= UNSIGNED(WDATA);
    -- M
    int_M_address0       <= UNSIGNED(M_address0);
    int_M_ce0            <= M_ce0;
    int_M_we0            <= M_we0;
    int_M_be0            <= (others => M_we0);
    int_M_d0             <= RESIZE(UNSIGNED(M_d0), 32);
    M_q0                 <= STD_LOGIC_VECTOR(RESIZE(int_M_q0, 32));
    int_M_address1       <= raddr(16 downto 2) when ar_hs = '1' else waddr(16 downto 2);
    int_M_ce1            <= '1' when ar_hs = '1' or (int_M_write = '1' and WVALID  = '1') else '0';
    int_M_we1            <= '1' when int_M_write = '1' and w_hs = '1' else '0';
    int_M_be1            <= UNSIGNED(WSTRB);
    int_M_d1             <= UNSIGNED(WDATA);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_SEQA_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_SEQA_BASE and raddr <= ADDR_SEQA_HIGH) then
                    int_SEQA_read <= '1';
                else
                    int_SEQA_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_SEQA_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_SEQA_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_SEQA_HIGH) then
                    int_SEQA_write <= '1';
                elsif (w_hs = '1') then
                    int_SEQA_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (SEQA_ce0 = '1') then
                    int_SEQA_shift <= UNSIGNED(SEQA_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_SEQB_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_SEQB_BASE and raddr <= ADDR_SEQB_HIGH) then
                    int_SEQB_read <= '1';
                else
                    int_SEQB_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_SEQB_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_SEQB_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_SEQB_HIGH) then
                    int_SEQB_write <= '1';
                elsif (w_hs = '1') then
                    int_SEQB_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (SEQB_ce0 = '1') then
                    int_SEQB_shift <= UNSIGNED(SEQB_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_alignedA_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_ALIGNEDA_BASE and raddr <= ADDR_ALIGNEDA_HIGH) then
                    int_alignedA_read <= '1';
                else
                    int_alignedA_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_alignedA_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_ALIGNEDA_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_ALIGNEDA_HIGH) then
                    int_alignedA_write <= '1';
                elsif (w_hs = '1') then
                    int_alignedA_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (alignedA_ce0 = '1') then
                    int_alignedA_shift <= UNSIGNED(alignedA_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_alignedB_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_ALIGNEDB_BASE and raddr <= ADDR_ALIGNEDB_HIGH) then
                    int_alignedB_read <= '1';
                else
                    int_alignedB_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_alignedB_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_ALIGNEDB_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_ALIGNEDB_HIGH) then
                    int_alignedB_write <= '1';
                elsif (w_hs = '1') then
                    int_alignedB_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (alignedB_ce0 = '1') then
                    int_alignedB_shift <= UNSIGNED(alignedB_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ptr_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_PTR_BASE and raddr <= ADDR_PTR_HIGH) then
                    int_ptr_read <= '1';
                else
                    int_ptr_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ptr_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_PTR_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_PTR_HIGH) then
                    int_ptr_write <= '1';
                elsif (w_hs = '1') then
                    int_ptr_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ptr_ce0 = '1') then
                    int_ptr_shift <= UNSIGNED(ptr_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_M_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_M_BASE and raddr <= ADDR_M_HIGH) then
                    int_M_read <= '1';
                else
                    int_M_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_M_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_M_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_M_HIGH) then
                    int_M_write <= '1';
                elsif (w_hs = '1') then
                    int_M_write <= '0';
                end if;
            end if;
        end if;
    end process;


end architecture behave;

library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity needwun_BUS_A_s_axi_ram is
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

end entity needwun_BUS_A_s_axi_ram;

architecture behave of needwun_BUS_A_s_axi_ram is
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


