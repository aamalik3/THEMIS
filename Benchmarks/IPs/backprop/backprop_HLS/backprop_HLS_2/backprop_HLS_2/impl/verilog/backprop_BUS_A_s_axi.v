// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module backprop_BUS_A_s_axi
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
    input  wire [1:0]                    biases3_address0,
    input  wire                          biases3_ce0,
    input  wire                          biases3_we0,
    input  wire [63:0]                   biases3_d0,
    output wire [63:0]                   biases3_q0,
    input  wire [5:0]                    biases1_address0,
    input  wire                          biases1_ce0,
    input  wire                          biases1_we0,
    input  wire [63:0]                   biases1_d0,
    output wire [63:0]                   biases1_q0,
    input  wire [5:0]                    biases2_address0,
    input  wire                          biases2_ce0,
    input  wire                          biases2_we0,
    input  wire [63:0]                   biases2_d0,
    output wire [63:0]                   biases2_q0,
    input  wire [7:0]                    weights3_address0,
    input  wire                          weights3_ce0,
    input  wire                          weights3_we0,
    input  wire [63:0]                   weights3_d0,
    output wire [63:0]                   weights3_q0,
    input  wire [8:0]                    training_targets_address0,
    input  wire                          training_targets_ce0,
    output wire [63:0]                   training_targets_q0,
    input  wire [9:0]                    weights1_address0,
    input  wire                          weights1_ce0,
    input  wire                          weights1_we0,
    input  wire [63:0]                   weights1_d0,
    output wire [63:0]                   weights1_q0,
    input  wire [11:0]                   weights2_address0,
    input  wire                          weights2_ce0,
    input  wire                          weights2_we0,
    input  wire [63:0]                   weights2_d0,
    output wire [63:0]                   weights2_q0,
    input  wire [11:0]                   training_data_address0,
    input  wire                          training_data_ce0,
    output wire [63:0]                   training_data_q0,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
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
// 0x00020 ~
// 0x0003f : Memory 'biases3' (3 * 64b)
//           Word 2n   : bit [31:0] - biases3[n][31: 0]
//           Word 2n+1 : bit [31:0] - biases3[n][63:32]
// 0x00200 ~
// 0x003ff : Memory 'biases1' (64 * 64b)
//           Word 2n   : bit [31:0] - biases1[n][31: 0]
//           Word 2n+1 : bit [31:0] - biases1[n][63:32]
// 0x00400 ~
// 0x005ff : Memory 'biases2' (64 * 64b)
//           Word 2n   : bit [31:0] - biases2[n][31: 0]
//           Word 2n+1 : bit [31:0] - biases2[n][63:32]
// 0x00800 ~
// 0x00fff : Memory 'weights3' (192 * 64b)
//           Word 2n   : bit [31:0] - weights3[n][31: 0]
//           Word 2n+1 : bit [31:0] - weights3[n][63:32]
// 0x01000 ~
// 0x01fff : Memory 'training_targets' (489 * 64b)
//           Word 2n   : bit [31:0] - training_targets[n][31: 0]
//           Word 2n+1 : bit [31:0] - training_targets[n][63:32]
// 0x02000 ~
// 0x03fff : Memory 'weights1' (832 * 64b)
//           Word 2n   : bit [31:0] - weights1[n][31: 0]
//           Word 2n+1 : bit [31:0] - weights1[n][63:32]
// 0x08000 ~
// 0x0ffff : Memory 'weights2' (4096 * 64b)
//           Word 2n   : bit [31:0] - weights2[n][31: 0]
//           Word 2n+1 : bit [31:0] - weights2[n][63:32]
// 0x10000 ~
// 0x17fff : Memory 'training_data' (2119 * 64b)
//           Word 2n   : bit [31:0] - training_data[n][31: 0]
//           Word 2n+1 : bit [31:0] - training_data[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL               = 17'h00000,
    ADDR_GIE                   = 17'h00004,
    ADDR_IER                   = 17'h00008,
    ADDR_ISR                   = 17'h0000c,
    ADDR_BIASES3_BASE          = 17'h00020,
    ADDR_BIASES3_HIGH          = 17'h0003f,
    ADDR_BIASES1_BASE          = 17'h00200,
    ADDR_BIASES1_HIGH          = 17'h003ff,
    ADDR_BIASES2_BASE          = 17'h00400,
    ADDR_BIASES2_HIGH          = 17'h005ff,
    ADDR_WEIGHTS3_BASE         = 17'h00800,
    ADDR_WEIGHTS3_HIGH         = 17'h00fff,
    ADDR_TRAINING_TARGETS_BASE = 17'h01000,
    ADDR_TRAINING_TARGETS_HIGH = 17'h01fff,
    ADDR_WEIGHTS1_BASE         = 17'h02000,
    ADDR_WEIGHTS1_HIGH         = 17'h03fff,
    ADDR_WEIGHTS2_BASE         = 17'h08000,
    ADDR_WEIGHTS2_HIGH         = 17'h0ffff,
    ADDR_TRAINING_DATA_BASE    = 17'h10000,
    ADDR_TRAINING_DATA_HIGH    = 17'h17fff,
    WRIDLE                     = 2'd0,
    WRDATA                     = 2'd1,
    WRRESP                     = 2'd2,
    WRRESET                    = 2'd3,
    RDIDLE                     = 2'd0,
    RDDATA                     = 2'd1,
    RDRESET                    = 2'd2,
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
    // memory signals
    wire [1:0]                    int_biases3_address0;
    wire                          int_biases3_ce0;
    wire                          int_biases3_we0;
    wire [7:0]                    int_biases3_be0;
    wire [63:0]                   int_biases3_d0;
    wire [63:0]                   int_biases3_q0;
    wire [1:0]                    int_biases3_address1;
    wire                          int_biases3_ce1;
    wire                          int_biases3_we1;
    wire [7:0]                    int_biases3_be1;
    wire [63:0]                   int_biases3_d1;
    wire [63:0]                   int_biases3_q1;
    reg                           int_biases3_read;
    reg                           int_biases3_write;
    reg  [0:0]                    int_biases3_shift;
    wire [5:0]                    int_biases1_address0;
    wire                          int_biases1_ce0;
    wire                          int_biases1_we0;
    wire [7:0]                    int_biases1_be0;
    wire [63:0]                   int_biases1_d0;
    wire [63:0]                   int_biases1_q0;
    wire [5:0]                    int_biases1_address1;
    wire                          int_biases1_ce1;
    wire                          int_biases1_we1;
    wire [7:0]                    int_biases1_be1;
    wire [63:0]                   int_biases1_d1;
    wire [63:0]                   int_biases1_q1;
    reg                           int_biases1_read;
    reg                           int_biases1_write;
    reg  [0:0]                    int_biases1_shift;
    wire [5:0]                    int_biases2_address0;
    wire                          int_biases2_ce0;
    wire                          int_biases2_we0;
    wire [7:0]                    int_biases2_be0;
    wire [63:0]                   int_biases2_d0;
    wire [63:0]                   int_biases2_q0;
    wire [5:0]                    int_biases2_address1;
    wire                          int_biases2_ce1;
    wire                          int_biases2_we1;
    wire [7:0]                    int_biases2_be1;
    wire [63:0]                   int_biases2_d1;
    wire [63:0]                   int_biases2_q1;
    reg                           int_biases2_read;
    reg                           int_biases2_write;
    reg  [0:0]                    int_biases2_shift;
    wire [7:0]                    int_weights3_address0;
    wire                          int_weights3_ce0;
    wire                          int_weights3_we0;
    wire [7:0]                    int_weights3_be0;
    wire [63:0]                   int_weights3_d0;
    wire [63:0]                   int_weights3_q0;
    wire [7:0]                    int_weights3_address1;
    wire                          int_weights3_ce1;
    wire                          int_weights3_we1;
    wire [7:0]                    int_weights3_be1;
    wire [63:0]                   int_weights3_d1;
    wire [63:0]                   int_weights3_q1;
    reg                           int_weights3_read;
    reg                           int_weights3_write;
    reg  [0:0]                    int_weights3_shift;
    wire [8:0]                    int_training_targets_address0;
    wire                          int_training_targets_ce0;
    wire                          int_training_targets_we0;
    wire [7:0]                    int_training_targets_be0;
    wire [63:0]                   int_training_targets_d0;
    wire [63:0]                   int_training_targets_q0;
    wire [8:0]                    int_training_targets_address1;
    wire                          int_training_targets_ce1;
    wire                          int_training_targets_we1;
    wire [7:0]                    int_training_targets_be1;
    wire [63:0]                   int_training_targets_d1;
    wire [63:0]                   int_training_targets_q1;
    reg                           int_training_targets_read;
    reg                           int_training_targets_write;
    reg  [0:0]                    int_training_targets_shift;
    wire [9:0]                    int_weights1_address0;
    wire                          int_weights1_ce0;
    wire                          int_weights1_we0;
    wire [7:0]                    int_weights1_be0;
    wire [63:0]                   int_weights1_d0;
    wire [63:0]                   int_weights1_q0;
    wire [9:0]                    int_weights1_address1;
    wire                          int_weights1_ce1;
    wire                          int_weights1_we1;
    wire [7:0]                    int_weights1_be1;
    wire [63:0]                   int_weights1_d1;
    wire [63:0]                   int_weights1_q1;
    reg                           int_weights1_read;
    reg                           int_weights1_write;
    reg  [0:0]                    int_weights1_shift;
    wire [11:0]                   int_weights2_address0;
    wire                          int_weights2_ce0;
    wire                          int_weights2_we0;
    wire [7:0]                    int_weights2_be0;
    wire [63:0]                   int_weights2_d0;
    wire [63:0]                   int_weights2_q0;
    wire [11:0]                   int_weights2_address1;
    wire                          int_weights2_ce1;
    wire                          int_weights2_we1;
    wire [7:0]                    int_weights2_be1;
    wire [63:0]                   int_weights2_d1;
    wire [63:0]                   int_weights2_q1;
    reg                           int_weights2_read;
    reg                           int_weights2_write;
    reg  [0:0]                    int_weights2_shift;
    wire [11:0]                   int_training_data_address0;
    wire                          int_training_data_ce0;
    wire                          int_training_data_we0;
    wire [7:0]                    int_training_data_be0;
    wire [63:0]                   int_training_data_d0;
    wire [63:0]                   int_training_data_q0;
    wire [11:0]                   int_training_data_address1;
    wire                          int_training_data_ce1;
    wire                          int_training_data_we1;
    wire [7:0]                    int_training_data_be1;
    wire [63:0]                   int_training_data_d1;
    wire [63:0]                   int_training_data_q1;
    reg                           int_training_data_read;
    reg                           int_training_data_write;
    reg  [0:0]                    int_training_data_shift;

//------------------------Instantiation------------------
// int_biases3
backprop_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 3 )
) int_biases3 (
    .clk0     ( ACLK ),
    .address0 ( int_biases3_address0 ),
    .ce0      ( int_biases3_ce0 ),
    .we0      ( int_biases3_we0 ),
    .be0      ( int_biases3_be0 ),
    .d0       ( int_biases3_d0 ),
    .q0       ( int_biases3_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_biases3_address1 ),
    .ce1      ( int_biases3_ce1 ),
    .we1      ( int_biases3_we1 ),
    .be1      ( int_biases3_be1 ),
    .d1       ( int_biases3_d1 ),
    .q1       ( int_biases3_q1 )
);
// int_biases1
backprop_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 64 )
) int_biases1 (
    .clk0     ( ACLK ),
    .address0 ( int_biases1_address0 ),
    .ce0      ( int_biases1_ce0 ),
    .we0      ( int_biases1_we0 ),
    .be0      ( int_biases1_be0 ),
    .d0       ( int_biases1_d0 ),
    .q0       ( int_biases1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_biases1_address1 ),
    .ce1      ( int_biases1_ce1 ),
    .we1      ( int_biases1_we1 ),
    .be1      ( int_biases1_be1 ),
    .d1       ( int_biases1_d1 ),
    .q1       ( int_biases1_q1 )
);
// int_biases2
backprop_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 64 )
) int_biases2 (
    .clk0     ( ACLK ),
    .address0 ( int_biases2_address0 ),
    .ce0      ( int_biases2_ce0 ),
    .we0      ( int_biases2_we0 ),
    .be0      ( int_biases2_be0 ),
    .d0       ( int_biases2_d0 ),
    .q0       ( int_biases2_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_biases2_address1 ),
    .ce1      ( int_biases2_ce1 ),
    .we1      ( int_biases2_we1 ),
    .be1      ( int_biases2_be1 ),
    .d1       ( int_biases2_d1 ),
    .q1       ( int_biases2_q1 )
);
// int_weights3
backprop_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 192 )
) int_weights3 (
    .clk0     ( ACLK ),
    .address0 ( int_weights3_address0 ),
    .ce0      ( int_weights3_ce0 ),
    .we0      ( int_weights3_we0 ),
    .be0      ( int_weights3_be0 ),
    .d0       ( int_weights3_d0 ),
    .q0       ( int_weights3_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_weights3_address1 ),
    .ce1      ( int_weights3_ce1 ),
    .we1      ( int_weights3_we1 ),
    .be1      ( int_weights3_be1 ),
    .d1       ( int_weights3_d1 ),
    .q1       ( int_weights3_q1 )
);
// int_training_targets
backprop_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 489 )
) int_training_targets (
    .clk0     ( ACLK ),
    .address0 ( int_training_targets_address0 ),
    .ce0      ( int_training_targets_ce0 ),
    .we0      ( int_training_targets_we0 ),
    .be0      ( int_training_targets_be0 ),
    .d0       ( int_training_targets_d0 ),
    .q0       ( int_training_targets_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_training_targets_address1 ),
    .ce1      ( int_training_targets_ce1 ),
    .we1      ( int_training_targets_we1 ),
    .be1      ( int_training_targets_be1 ),
    .d1       ( int_training_targets_d1 ),
    .q1       ( int_training_targets_q1 )
);
// int_weights1
backprop_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 832 )
) int_weights1 (
    .clk0     ( ACLK ),
    .address0 ( int_weights1_address0 ),
    .ce0      ( int_weights1_ce0 ),
    .we0      ( int_weights1_we0 ),
    .be0      ( int_weights1_be0 ),
    .d0       ( int_weights1_d0 ),
    .q0       ( int_weights1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_weights1_address1 ),
    .ce1      ( int_weights1_ce1 ),
    .we1      ( int_weights1_we1 ),
    .be1      ( int_weights1_be1 ),
    .d1       ( int_weights1_d1 ),
    .q1       ( int_weights1_q1 )
);
// int_weights2
backprop_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 4096 )
) int_weights2 (
    .clk0     ( ACLK ),
    .address0 ( int_weights2_address0 ),
    .ce0      ( int_weights2_ce0 ),
    .we0      ( int_weights2_we0 ),
    .be0      ( int_weights2_be0 ),
    .d0       ( int_weights2_d0 ),
    .q0       ( int_weights2_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_weights2_address1 ),
    .ce1      ( int_weights2_ce1 ),
    .we1      ( int_weights2_we1 ),
    .be1      ( int_weights2_be1 ),
    .d1       ( int_weights2_d1 ),
    .q1       ( int_weights2_q1 )
);
// int_training_data
backprop_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 2119 )
) int_training_data (
    .clk0     ( ACLK ),
    .address0 ( int_training_data_address0 ),
    .ce0      ( int_training_data_ce0 ),
    .we0      ( int_training_data_we0 ),
    .be0      ( int_training_data_be0 ),
    .d0       ( int_training_data_d0 ),
    .q0       ( int_training_data_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_training_data_address1 ),
    .ce1      ( int_training_data_ce1 ),
    .we1      ( int_training_data_we1 ),
    .be1      ( int_training_data_be1 ),
    .d1       ( int_training_data_d1 ),
    .q1       ( int_training_data_q1 )
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
assign RVALID  = (rstate == RDDATA) & !int_biases3_read & !int_biases1_read & !int_biases2_read & !int_weights3_read & !int_training_targets_read & !int_weights1_read & !int_weights2_read & !int_training_data_read;
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
            endcase
        end
        else if (int_biases3_read) begin
            rdata <= int_biases3_q1 >> (int_biases3_shift * 32);
        end
        else if (int_biases1_read) begin
            rdata <= int_biases1_q1 >> (int_biases1_shift * 32);
        end
        else if (int_biases2_read) begin
            rdata <= int_biases2_q1 >> (int_biases2_shift * 32);
        end
        else if (int_weights3_read) begin
            rdata <= int_weights3_q1 >> (int_weights3_shift * 32);
        end
        else if (int_training_targets_read) begin
            rdata <= int_training_targets_q1 >> (int_training_targets_shift * 32);
        end
        else if (int_weights1_read) begin
            rdata <= int_weights1_q1 >> (int_weights1_shift * 32);
        end
        else if (int_weights2_read) begin
            rdata <= int_weights2_q1 >> (int_weights2_shift * 32);
        end
        else if (int_training_data_read) begin
            rdata <= int_training_data_q1 >> (int_training_data_shift * 32);
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


//------------------------Memory logic-------------------
// biases3
assign int_biases3_address0          = biases3_address0;
assign int_biases3_ce0               = biases3_ce0;
assign int_biases3_we0               = biases3_we0;
assign int_biases3_be0               = {8{biases3_we0}};
assign int_biases3_d0                = biases3_d0;
assign biases3_q0                    = int_biases3_q0;
assign int_biases3_address1          = ar_hs? raddr[4:3] : waddr[4:3];
assign int_biases3_ce1               = ar_hs | (int_biases3_write & WVALID);
assign int_biases3_we1               = int_biases3_write & w_hs;
assign int_biases3_be1               = WSTRB << (waddr[2:2] * 4);
assign int_biases3_d1                = {2{WDATA}};
// biases1
assign int_biases1_address0          = biases1_address0;
assign int_biases1_ce0               = biases1_ce0;
assign int_biases1_we0               = biases1_we0;
assign int_biases1_be0               = {8{biases1_we0}};
assign int_biases1_d0                = biases1_d0;
assign biases1_q0                    = int_biases1_q0;
assign int_biases1_address1          = ar_hs? raddr[8:3] : waddr[8:3];
assign int_biases1_ce1               = ar_hs | (int_biases1_write & WVALID);
assign int_biases1_we1               = int_biases1_write & w_hs;
assign int_biases1_be1               = WSTRB << (waddr[2:2] * 4);
assign int_biases1_d1                = {2{WDATA}};
// biases2
assign int_biases2_address0          = biases2_address0;
assign int_biases2_ce0               = biases2_ce0;
assign int_biases2_we0               = biases2_we0;
assign int_biases2_be0               = {8{biases2_we0}};
assign int_biases2_d0                = biases2_d0;
assign biases2_q0                    = int_biases2_q0;
assign int_biases2_address1          = ar_hs? raddr[8:3] : waddr[8:3];
assign int_biases2_ce1               = ar_hs | (int_biases2_write & WVALID);
assign int_biases2_we1               = int_biases2_write & w_hs;
assign int_biases2_be1               = WSTRB << (waddr[2:2] * 4);
assign int_biases2_d1                = {2{WDATA}};
// weights3
assign int_weights3_address0         = weights3_address0;
assign int_weights3_ce0              = weights3_ce0;
assign int_weights3_we0              = weights3_we0;
assign int_weights3_be0              = {8{weights3_we0}};
assign int_weights3_d0               = weights3_d0;
assign weights3_q0                   = int_weights3_q0;
assign int_weights3_address1         = ar_hs? raddr[10:3] : waddr[10:3];
assign int_weights3_ce1              = ar_hs | (int_weights3_write & WVALID);
assign int_weights3_we1              = int_weights3_write & w_hs;
assign int_weights3_be1              = WSTRB << (waddr[2:2] * 4);
assign int_weights3_d1               = {2{WDATA}};
// training_targets
assign int_training_targets_address0 = training_targets_address0;
assign int_training_targets_ce0      = training_targets_ce0;
assign int_training_targets_we0      = 1'b0;
assign int_training_targets_be0      = 1'b0;
assign int_training_targets_d0       = 1'b0;
assign training_targets_q0           = int_training_targets_q0;
assign int_training_targets_address1 = ar_hs? raddr[11:3] : waddr[11:3];
assign int_training_targets_ce1      = ar_hs | (int_training_targets_write & WVALID);
assign int_training_targets_we1      = int_training_targets_write & w_hs;
assign int_training_targets_be1      = WSTRB << (waddr[2:2] * 4);
assign int_training_targets_d1       = {2{WDATA}};
// weights1
assign int_weights1_address0         = weights1_address0;
assign int_weights1_ce0              = weights1_ce0;
assign int_weights1_we0              = weights1_we0;
assign int_weights1_be0              = {8{weights1_we0}};
assign int_weights1_d0               = weights1_d0;
assign weights1_q0                   = int_weights1_q0;
assign int_weights1_address1         = ar_hs? raddr[12:3] : waddr[12:3];
assign int_weights1_ce1              = ar_hs | (int_weights1_write & WVALID);
assign int_weights1_we1              = int_weights1_write & w_hs;
assign int_weights1_be1              = WSTRB << (waddr[2:2] * 4);
assign int_weights1_d1               = {2{WDATA}};
// weights2
assign int_weights2_address0         = weights2_address0;
assign int_weights2_ce0              = weights2_ce0;
assign int_weights2_we0              = weights2_we0;
assign int_weights2_be0              = {8{weights2_we0}};
assign int_weights2_d0               = weights2_d0;
assign weights2_q0                   = int_weights2_q0;
assign int_weights2_address1         = ar_hs? raddr[14:3] : waddr[14:3];
assign int_weights2_ce1              = ar_hs | (int_weights2_write & WVALID);
assign int_weights2_we1              = int_weights2_write & w_hs;
assign int_weights2_be1              = WSTRB << (waddr[2:2] * 4);
assign int_weights2_d1               = {2{WDATA}};
// training_data
assign int_training_data_address0    = training_data_address0;
assign int_training_data_ce0         = training_data_ce0;
assign int_training_data_we0         = 1'b0;
assign int_training_data_be0         = 1'b0;
assign int_training_data_d0          = 1'b0;
assign training_data_q0              = int_training_data_q0;
assign int_training_data_address1    = ar_hs? raddr[14:3] : waddr[14:3];
assign int_training_data_ce1         = ar_hs | (int_training_data_write & WVALID);
assign int_training_data_we1         = int_training_data_write & w_hs;
assign int_training_data_be1         = WSTRB << (waddr[2:2] * 4);
assign int_training_data_d1          = {2{WDATA}};
// int_biases3_read
always @(posedge ACLK) begin
    if (ARESET)
        int_biases3_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_BIASES3_BASE && raddr <= ADDR_BIASES3_HIGH)
            int_biases3_read <= 1'b1;
        else
            int_biases3_read <= 1'b0;
    end
end

// int_biases3_write
always @(posedge ACLK) begin
    if (ARESET)
        int_biases3_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_BIASES3_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_BIASES3_HIGH)
            int_biases3_write <= 1'b1;
        else if (w_hs)
            int_biases3_write <= 1'b0;
    end
end

// int_biases3_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_biases3_shift <= raddr[2:2];
    end
end

// int_biases1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_biases1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_BIASES1_BASE && raddr <= ADDR_BIASES1_HIGH)
            int_biases1_read <= 1'b1;
        else
            int_biases1_read <= 1'b0;
    end
end

// int_biases1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_biases1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_BIASES1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_BIASES1_HIGH)
            int_biases1_write <= 1'b1;
        else if (w_hs)
            int_biases1_write <= 1'b0;
    end
end

// int_biases1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_biases1_shift <= raddr[2:2];
    end
end

// int_biases2_read
always @(posedge ACLK) begin
    if (ARESET)
        int_biases2_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_BIASES2_BASE && raddr <= ADDR_BIASES2_HIGH)
            int_biases2_read <= 1'b1;
        else
            int_biases2_read <= 1'b0;
    end
end

// int_biases2_write
always @(posedge ACLK) begin
    if (ARESET)
        int_biases2_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_BIASES2_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_BIASES2_HIGH)
            int_biases2_write <= 1'b1;
        else if (w_hs)
            int_biases2_write <= 1'b0;
    end
end

// int_biases2_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_biases2_shift <= raddr[2:2];
    end
end

// int_weights3_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights3_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS3_BASE && raddr <= ADDR_WEIGHTS3_HIGH)
            int_weights3_read <= 1'b1;
        else
            int_weights3_read <= 1'b0;
    end
end

// int_weights3_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights3_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS3_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS3_HIGH)
            int_weights3_write <= 1'b1;
        else if (w_hs)
            int_weights3_write <= 1'b0;
    end
end

// int_weights3_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_weights3_shift <= raddr[2:2];
    end
end

// int_training_targets_read
always @(posedge ACLK) begin
    if (ARESET)
        int_training_targets_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_TRAINING_TARGETS_BASE && raddr <= ADDR_TRAINING_TARGETS_HIGH)
            int_training_targets_read <= 1'b1;
        else
            int_training_targets_read <= 1'b0;
    end
end

// int_training_targets_write
always @(posedge ACLK) begin
    if (ARESET)
        int_training_targets_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_TRAINING_TARGETS_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_TRAINING_TARGETS_HIGH)
            int_training_targets_write <= 1'b1;
        else if (w_hs)
            int_training_targets_write <= 1'b0;
    end
end

// int_training_targets_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_training_targets_shift <= raddr[2:2];
    end
end

// int_weights1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS1_BASE && raddr <= ADDR_WEIGHTS1_HIGH)
            int_weights1_read <= 1'b1;
        else
            int_weights1_read <= 1'b0;
    end
end

// int_weights1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS1_HIGH)
            int_weights1_write <= 1'b1;
        else if (w_hs)
            int_weights1_write <= 1'b0;
    end
end

// int_weights1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_weights1_shift <= raddr[2:2];
    end
end

// int_weights2_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights2_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS2_BASE && raddr <= ADDR_WEIGHTS2_HIGH)
            int_weights2_read <= 1'b1;
        else
            int_weights2_read <= 1'b0;
    end
end

// int_weights2_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights2_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS2_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS2_HIGH)
            int_weights2_write <= 1'b1;
        else if (w_hs)
            int_weights2_write <= 1'b0;
    end
end

// int_weights2_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_weights2_shift <= raddr[2:2];
    end
end

// int_training_data_read
always @(posedge ACLK) begin
    if (ARESET)
        int_training_data_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_TRAINING_DATA_BASE && raddr <= ADDR_TRAINING_DATA_HIGH)
            int_training_data_read <= 1'b1;
        else
            int_training_data_read <= 1'b0;
    end
end

// int_training_data_write
always @(posedge ACLK) begin
    if (ARESET)
        int_training_data_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_TRAINING_DATA_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_TRAINING_DATA_HIGH)
            int_training_data_write <= 1'b1;
        else if (w_hs)
            int_training_data_write <= 1'b0;
    end
end

// int_training_data_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_training_data_shift <= raddr[2:2];
    end
end


endmodule


`timescale 1ns/1ps

module backprop_BUS_A_s_axi_ram
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

