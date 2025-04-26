// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module viterbi_BUS_A_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 17,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle,
    input  wire [31:0]                   ap_return,
    input  wire [7:0]                    obs_address0,
    input  wire                          obs_ce0,
    output wire [7:0]                    obs_q0,
    input  wire [5:0]                    init_address0,
    input  wire                          init_ce0,
    output wire [63:0]                   init_q0,
    input  wire [7:0]                    path_address0,
    input  wire                          path_ce0,
    input  wire                          path_we0,
    input  wire [7:0]                    path_d0,
    input  wire [11:0]                   transition_address0,
    input  wire                          transition_ce0,
    output wire [63:0]                   transition_q0,
    input  wire [11:0]                   emission_address0,
    input  wire                          emission_ce0,
    output wire [63:0]                   emission_q0
);
//------------------------Address Info-------------------
// 0x00000 : Control signals
//           bit 0  - ap_start (Read/Write/COH)
//           bit 1  - ap_done (Read/COR)
//           bit 2  - ap_idle (Read)
//           bit 3  - ap_ready (Read)
//           bit 7  - auto_restart (Read/Write)
//           others - reserved
// 0x00004 : Global Interrupt Enable Register
//           bit 0  - Global Interrupt Enable (Read/Write)
//           others - reserved
// 0x00008 : IP Interrupt Enable Register (Read/Write)
//           bit 0  - enable ap_done interrupt (Read/Write)
//           bit 1  - enable ap_ready interrupt (Read/Write)
//           others - reserved
// 0x0000c : IP Interrupt Status Register (Read/TOW)
//           bit 0  - ap_done (COR/TOW)
//           bit 1  - ap_ready (COR/TOW)
//           others - reserved
// 0x00010 : Data signal of ap_return
//           bit 31~0 - ap_return[31:0] (Read)
// 0x00100 ~
// 0x001ff : Memory 'obs' (140 * 8b)
//           Word n : bit [ 7: 0] - obs[4n]
//                    bit [15: 8] - obs[4n+1]
//                    bit [23:16] - obs[4n+2]
//                    bit [31:24] - obs[4n+3]
// 0x00200 ~
// 0x003ff : Memory 'init' (64 * 64b)
//           Word 2n   : bit [31:0] - init[n][31: 0]
//           Word 2n+1 : bit [31:0] - init[n][63:32]
// 0x00400 ~
// 0x004ff : Memory 'path' (140 * 8b)
//           Word n : bit [ 7: 0] - path[4n]
//                    bit [15: 8] - path[4n+1]
//                    bit [23:16] - path[4n+2]
//                    bit [31:24] - path[4n+3]
// 0x08000 ~
// 0x0ffff : Memory 'transition' (4096 * 64b)
//           Word 2n   : bit [31:0] - transition[n][31: 0]
//           Word 2n+1 : bit [31:0] - transition[n][63:32]
// 0x10000 ~
// 0x17fff : Memory 'emission' (4096 * 64b)
//           Word 2n   : bit [31:0] - emission[n][31: 0]
//           Word 2n+1 : bit [31:0] - emission[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL         = 17'h00000,
    ADDR_GIE             = 17'h00004,
    ADDR_IER             = 17'h00008,
    ADDR_ISR             = 17'h0000c,
    ADDR_AP_RETURN_0     = 17'h00010,
    ADDR_OBS_BASE        = 17'h00100,
    ADDR_OBS_HIGH        = 17'h001ff,
    ADDR_INIT_BASE       = 17'h00200,
    ADDR_INIT_HIGH       = 17'h003ff,
    ADDR_PATH_BASE       = 17'h00400,
    ADDR_PATH_HIGH       = 17'h004ff,
    ADDR_TRANSITION_BASE = 17'h08000,
    ADDR_TRANSITION_HIGH = 17'h0ffff,
    ADDR_EMISSION_BASE   = 17'h10000,
    ADDR_EMISSION_HIGH   = 17'h17fff,
    WRIDLE               = 2'd0,
    WRDATA               = 2'd1,
    WRRESP               = 2'd2,
    WRRESET              = 2'd3,
    RDIDLE               = 2'd0,
    RDDATA               = 2'd1,
    RDRESET              = 2'd2,
    ADDR_BITS                = 17;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready;
    reg                           int_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [31:0]                   int_ap_return;
    // memory signals
    wire [5:0]                    int_obs_address0;
    wire                          int_obs_ce0;
    wire                          int_obs_we0;
    wire [3:0]                    int_obs_be0;
    wire [31:0]                   int_obs_d0;
    wire [31:0]                   int_obs_q0;
    wire [5:0]                    int_obs_address1;
    wire                          int_obs_ce1;
    wire                          int_obs_we1;
    wire [3:0]                    int_obs_be1;
    wire [31:0]                   int_obs_d1;
    wire [31:0]                   int_obs_q1;
    reg                           int_obs_read;
    reg                           int_obs_write;
    reg  [1:0]                    int_obs_shift;
    wire [5:0]                    int_init_address0;
    wire                          int_init_ce0;
    wire                          int_init_we0;
    wire [7:0]                    int_init_be0;
    wire [63:0]                   int_init_d0;
    wire [63:0]                   int_init_q0;
    wire [5:0]                    int_init_address1;
    wire                          int_init_ce1;
    wire                          int_init_we1;
    wire [7:0]                    int_init_be1;
    wire [63:0]                   int_init_d1;
    wire [63:0]                   int_init_q1;
    reg                           int_init_read;
    reg                           int_init_write;
    reg  [0:0]                    int_init_shift;
    wire [5:0]                    int_path_address0;
    wire                          int_path_ce0;
    wire                          int_path_we0;
    wire [3:0]                    int_path_be0;
    wire [31:0]                   int_path_d0;
    wire [31:0]                   int_path_q0;
    wire [5:0]                    int_path_address1;
    wire                          int_path_ce1;
    wire                          int_path_we1;
    wire [3:0]                    int_path_be1;
    wire [31:0]                   int_path_d1;
    wire [31:0]                   int_path_q1;
    reg                           int_path_read;
    reg                           int_path_write;
    reg  [1:0]                    int_path_shift;
    wire [11:0]                   int_transition_address0;
    wire                          int_transition_ce0;
    wire                          int_transition_we0;
    wire [7:0]                    int_transition_be0;
    wire [63:0]                   int_transition_d0;
    wire [63:0]                   int_transition_q0;
    wire [11:0]                   int_transition_address1;
    wire                          int_transition_ce1;
    wire                          int_transition_we1;
    wire [7:0]                    int_transition_be1;
    wire [63:0]                   int_transition_d1;
    wire [63:0]                   int_transition_q1;
    reg                           int_transition_read;
    reg                           int_transition_write;
    reg  [0:0]                    int_transition_shift;
    wire [11:0]                   int_emission_address0;
    wire                          int_emission_ce0;
    wire                          int_emission_we0;
    wire [7:0]                    int_emission_be0;
    wire [63:0]                   int_emission_d0;
    wire [63:0]                   int_emission_q0;
    wire [11:0]                   int_emission_address1;
    wire                          int_emission_ce1;
    wire                          int_emission_we1;
    wire [7:0]                    int_emission_be1;
    wire [63:0]                   int_emission_d1;
    wire [63:0]                   int_emission_q1;
    reg                           int_emission_read;
    reg                           int_emission_write;
    reg  [0:0]                    int_emission_shift;

//------------------------Instantiation------------------
// int_obs
viterbi_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 35 )
) int_obs (
    .clk0     ( ACLK ),
    .address0 ( int_obs_address0 ),
    .ce0      ( int_obs_ce0 ),
    .we0      ( int_obs_we0 ),
    .be0      ( int_obs_be0 ),
    .d0       ( int_obs_d0 ),
    .q0       ( int_obs_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_obs_address1 ),
    .ce1      ( int_obs_ce1 ),
    .we1      ( int_obs_we1 ),
    .be1      ( int_obs_be1 ),
    .d1       ( int_obs_d1 ),
    .q1       ( int_obs_q1 )
);
// int_init
viterbi_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 64 )
) int_init (
    .clk0     ( ACLK ),
    .address0 ( int_init_address0 ),
    .ce0      ( int_init_ce0 ),
    .we0      ( int_init_we0 ),
    .be0      ( int_init_be0 ),
    .d0       ( int_init_d0 ),
    .q0       ( int_init_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_init_address1 ),
    .ce1      ( int_init_ce1 ),
    .we1      ( int_init_we1 ),
    .be1      ( int_init_be1 ),
    .d1       ( int_init_d1 ),
    .q1       ( int_init_q1 )
);
// int_path
viterbi_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 35 )
) int_path (
    .clk0     ( ACLK ),
    .address0 ( int_path_address0 ),
    .ce0      ( int_path_ce0 ),
    .we0      ( int_path_we0 ),
    .be0      ( int_path_be0 ),
    .d0       ( int_path_d0 ),
    .q0       ( int_path_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_path_address1 ),
    .ce1      ( int_path_ce1 ),
    .we1      ( int_path_we1 ),
    .be1      ( int_path_be1 ),
    .d1       ( int_path_d1 ),
    .q1       ( int_path_q1 )
);
// int_transition
viterbi_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 4096 )
) int_transition (
    .clk0     ( ACLK ),
    .address0 ( int_transition_address0 ),
    .ce0      ( int_transition_ce0 ),
    .we0      ( int_transition_we0 ),
    .be0      ( int_transition_be0 ),
    .d0       ( int_transition_d0 ),
    .q0       ( int_transition_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_transition_address1 ),
    .ce1      ( int_transition_ce1 ),
    .we1      ( int_transition_we1 ),
    .be1      ( int_transition_be1 ),
    .d1       ( int_transition_d1 ),
    .q1       ( int_transition_q1 )
);
// int_emission
viterbi_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 4096 )
) int_emission (
    .clk0     ( ACLK ),
    .address0 ( int_emission_address0 ),
    .ce0      ( int_emission_ce0 ),
    .we0      ( int_emission_we0 ),
    .be0      ( int_emission_be0 ),
    .d0       ( int_emission_d0 ),
    .q0       ( int_emission_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_emission_address1 ),
    .ce1      ( int_emission_ce1 ),
    .we1      ( int_emission_we1 ),
    .be1      ( int_emission_be1 ),
    .d1       ( int_emission_d1 ),
    .q1       ( int_emission_q1 )
);


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA) && (!ar_hs);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (w_hs)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA) & !int_obs_read & !int_init_read & !int_path_read & !int_transition_read & !int_emission_read;
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_AP_RETURN_0: begin
                    rdata <= int_ap_return[31:0];
                end
            endcase
        end
        else if (int_obs_read) begin
            rdata <= int_obs_q1;
        end
        else if (int_init_read) begin
            rdata <= int_init_q1 >> (int_init_shift * 32);
        end
        else if (int_path_read) begin
            rdata <= int_path_q1;
        end
        else if (int_transition_read) begin
            rdata <= int_transition_q1 >> (int_transition_shift * 32);
        end
        else if (int_emission_read) begin
            rdata <= int_emission_q1 >> (int_emission_shift * 32);
        end
    end
end


//------------------------Register logic-----------------
assign interrupt = int_gie & (|int_isr);
assign ap_start  = int_ap_start;
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (ap_done)
            int_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_ready <= ap_ready;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_ap_return
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_return <= 0;
    else if (ACLK_EN) begin
        if (ap_done)
            int_ap_return <= ap_return;
    end
end


//------------------------Memory logic-------------------
// obs
assign int_obs_address0        = obs_address0 >> 2;
assign int_obs_ce0             = obs_ce0;
assign int_obs_we0             = 1'b0;
assign int_obs_be0             = 1'b0;
assign int_obs_d0              = 1'b0;
assign obs_q0                  = int_obs_q0 >> (int_obs_shift * 8);
assign int_obs_address1        = ar_hs? raddr[7:2] : waddr[7:2];
assign int_obs_ce1             = ar_hs | (int_obs_write & WVALID);
assign int_obs_we1             = int_obs_write & w_hs;
assign int_obs_be1             = WSTRB;
assign int_obs_d1              = WDATA;
// init
assign int_init_address0       = init_address0;
assign int_init_ce0            = init_ce0;
assign int_init_we0            = 1'b0;
assign int_init_be0            = 1'b0;
assign int_init_d0             = 1'b0;
assign init_q0                 = int_init_q0;
assign int_init_address1       = ar_hs? raddr[8:3] : waddr[8:3];
assign int_init_ce1            = ar_hs | (int_init_write & WVALID);
assign int_init_we1            = int_init_write & w_hs;
assign int_init_be1            = WSTRB << (waddr[2:2] * 4);
assign int_init_d1             = {2{WDATA}};
// path
assign int_path_address0       = path_address0 >> 2;
assign int_path_ce0            = path_ce0;
assign int_path_we0            = path_we0;
assign int_path_be0            = 1 << path_address0[1:0];
assign int_path_d0             = {4{path_d0}};
assign int_path_address1       = ar_hs? raddr[7:2] : waddr[7:2];
assign int_path_ce1            = ar_hs | (int_path_write & WVALID);
assign int_path_we1            = int_path_write & w_hs;
assign int_path_be1            = WSTRB;
assign int_path_d1             = WDATA;
// transition
assign int_transition_address0 = transition_address0;
assign int_transition_ce0      = transition_ce0;
assign int_transition_we0      = 1'b0;
assign int_transition_be0      = 1'b0;
assign int_transition_d0       = 1'b0;
assign transition_q0           = int_transition_q0;
assign int_transition_address1 = ar_hs? raddr[14:3] : waddr[14:3];
assign int_transition_ce1      = ar_hs | (int_transition_write & WVALID);
assign int_transition_we1      = int_transition_write & w_hs;
assign int_transition_be1      = WSTRB << (waddr[2:2] * 4);
assign int_transition_d1       = {2{WDATA}};
// emission
assign int_emission_address0   = emission_address0;
assign int_emission_ce0        = emission_ce0;
assign int_emission_we0        = 1'b0;
assign int_emission_be0        = 1'b0;
assign int_emission_d0         = 1'b0;
assign emission_q0             = int_emission_q0;
assign int_emission_address1   = ar_hs? raddr[14:3] : waddr[14:3];
assign int_emission_ce1        = ar_hs | (int_emission_write & WVALID);
assign int_emission_we1        = int_emission_write & w_hs;
assign int_emission_be1        = WSTRB << (waddr[2:2] * 4);
assign int_emission_d1         = {2{WDATA}};
// int_obs_read
always @(posedge ACLK) begin
    if (ARESET)
        int_obs_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_OBS_BASE && raddr <= ADDR_OBS_HIGH)
            int_obs_read <= 1'b1;
        else
            int_obs_read <= 1'b0;
    end
end

// int_obs_write
always @(posedge ACLK) begin
    if (ARESET)
        int_obs_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_OBS_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_OBS_HIGH)
            int_obs_write <= 1'b1;
        else if (w_hs)
            int_obs_write <= 1'b0;
    end
end

// int_obs_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (obs_ce0)
            int_obs_shift <= obs_address0[1:0];
    end
end

// int_init_read
always @(posedge ACLK) begin
    if (ARESET)
        int_init_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_INIT_BASE && raddr <= ADDR_INIT_HIGH)
            int_init_read <= 1'b1;
        else
            int_init_read <= 1'b0;
    end
end

// int_init_write
always @(posedge ACLK) begin
    if (ARESET)
        int_init_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_INIT_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_INIT_HIGH)
            int_init_write <= 1'b1;
        else if (w_hs)
            int_init_write <= 1'b0;
    end
end

// int_init_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_init_shift <= raddr[2:2];
    end
end

// int_path_read
always @(posedge ACLK) begin
    if (ARESET)
        int_path_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_PATH_BASE && raddr <= ADDR_PATH_HIGH)
            int_path_read <= 1'b1;
        else
            int_path_read <= 1'b0;
    end
end

// int_path_write
always @(posedge ACLK) begin
    if (ARESET)
        int_path_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_PATH_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_PATH_HIGH)
            int_path_write <= 1'b1;
        else if (w_hs)
            int_path_write <= 1'b0;
    end
end

// int_path_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (path_ce0)
            int_path_shift <= path_address0[1:0];
    end
end

// int_transition_read
always @(posedge ACLK) begin
    if (ARESET)
        int_transition_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_TRANSITION_BASE && raddr <= ADDR_TRANSITION_HIGH)
            int_transition_read <= 1'b1;
        else
            int_transition_read <= 1'b0;
    end
end

// int_transition_write
always @(posedge ACLK) begin
    if (ARESET)
        int_transition_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_TRANSITION_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_TRANSITION_HIGH)
            int_transition_write <= 1'b1;
        else if (w_hs)
            int_transition_write <= 1'b0;
    end
end

// int_transition_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_transition_shift <= raddr[2:2];
    end
end

// int_emission_read
always @(posedge ACLK) begin
    if (ARESET)
        int_emission_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_EMISSION_BASE && raddr <= ADDR_EMISSION_HIGH)
            int_emission_read <= 1'b1;
        else
            int_emission_read <= 1'b0;
    end
end

// int_emission_write
always @(posedge ACLK) begin
    if (ARESET)
        int_emission_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_EMISSION_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_EMISSION_HIGH)
            int_emission_write <= 1'b1;
        else if (w_hs)
            int_emission_write <= 1'b0;
    end
end

// int_emission_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_emission_shift <= raddr[2:2];
    end
end


endmodule


`timescale 1ns/1ps

module viterbi_BUS_A_s_axi_ram
#(parameter
    BYTES  = 4,
    DEPTH  = 256,
    AWIDTH = log2(DEPTH)
) (
    input  wire               clk0,
    input  wire [AWIDTH-1:0]  address0,
    input  wire               ce0,
    input  wire               we0,
    input  wire [BYTES-1:0]   be0,
    input  wire [BYTES*8-1:0] d0,
    output reg  [BYTES*8-1:0] q0,
    input  wire               clk1,
    input  wire [AWIDTH-1:0]  address1,
    input  wire               ce1,
    input  wire               we1,
    input  wire [BYTES-1:0]   be1,
    input  wire [BYTES*8-1:0] d1,
    output reg  [BYTES*8-1:0] q1
);
//------------------------Local signal-------------------
reg  [BYTES*8-1:0] mem[0:DEPTH-1];
//------------------------Task and function--------------
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 1;
    m = 2;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
//------------------------Body---------------------------
// read port 0
always @(posedge clk0) begin
    if (ce0) q0 <= mem[address0];
end

// read port 1
always @(posedge clk1) begin
    if (ce1) q1 <= mem[address1];
end

genvar i;
generate
    for (i = 0; i < BYTES; i = i + 1) begin : gen_write
        // write port 0
        always @(posedge clk0) begin
            if (ce0 & we0 & be0[i]) begin
                mem[address0][8*i+7:8*i] <= d0[8*i+7:8*i];
            end
        end
        // write port 1
        always @(posedge clk1) begin
            if (ce1 & we1 & be1[i]) begin
                mem[address1][8*i+7:8*i] <= d1[8*i+7:8*i];
            end
        end
    end
endgenerate

endmodule

