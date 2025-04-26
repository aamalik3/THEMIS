// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module needwun_BUS_A_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 18,
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
    input  wire [6:0]                    SEQA_address0,
    input  wire                          SEQA_ce0,
    output wire [7:0]                    SEQA_q0,
    input  wire [6:0]                    SEQB_address0,
    input  wire                          SEQB_ce0,
    output wire [7:0]                    SEQB_q0,
    input  wire [7:0]                    alignedA_address0,
    input  wire                          alignedA_ce0,
    input  wire                          alignedA_we0,
    input  wire [7:0]                    alignedA_d0,
    input  wire [7:0]                    alignedB_address0,
    input  wire                          alignedB_ce0,
    input  wire                          alignedB_we0,
    input  wire [7:0]                    alignedB_d0,
    input  wire [14:0]                   ptr_address0,
    input  wire                          ptr_ce0,
    input  wire                          ptr_we0,
    input  wire [7:0]                    ptr_d0,
    output wire [7:0]                    ptr_q0,
    input  wire [14:0]                   M_address0,
    input  wire                          M_ce0,
    input  wire                          M_we0,
    input  wire [31:0]                   M_d0,
    output wire [31:0]                   M_q0,
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
// 0x00080 ~
// 0x000ff : Memory 'SEQA' (128 * 8b)
//           Word n : bit [ 7: 0] - SEQA[4n]
//                    bit [15: 8] - SEQA[4n+1]
//                    bit [23:16] - SEQA[4n+2]
//                    bit [31:24] - SEQA[4n+3]
// 0x00100 ~
// 0x0017f : Memory 'SEQB' (128 * 8b)
//           Word n : bit [ 7: 0] - SEQB[4n]
//                    bit [15: 8] - SEQB[4n+1]
//                    bit [23:16] - SEQB[4n+2]
//                    bit [31:24] - SEQB[4n+3]
// 0x00200 ~
// 0x002ff : Memory 'alignedA' (256 * 8b)
//           Word n : bit [ 7: 0] - alignedA[4n]
//                    bit [15: 8] - alignedA[4n+1]
//                    bit [23:16] - alignedA[4n+2]
//                    bit [31:24] - alignedA[4n+3]
// 0x00300 ~
// 0x003ff : Memory 'alignedB' (256 * 8b)
//           Word n : bit [ 7: 0] - alignedB[4n]
//                    bit [15: 8] - alignedB[4n+1]
//                    bit [23:16] - alignedB[4n+2]
//                    bit [31:24] - alignedB[4n+3]
// 0x08000 ~
// 0x0ffff : Memory 'ptr' (16641 * 8b)
//           Word n : bit [ 7: 0] - ptr[4n]
//                    bit [15: 8] - ptr[4n+1]
//                    bit [23:16] - ptr[4n+2]
//                    bit [31:24] - ptr[4n+3]
// 0x20000 ~
// 0x3ffff : Memory 'M' (16641 * 32b)
//           Word n : bit [31:0] - M[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL       = 18'h00000,
    ADDR_GIE           = 18'h00004,
    ADDR_IER           = 18'h00008,
    ADDR_ISR           = 18'h0000c,
    ADDR_SEQA_BASE     = 18'h00080,
    ADDR_SEQA_HIGH     = 18'h000ff,
    ADDR_SEQB_BASE     = 18'h00100,
    ADDR_SEQB_HIGH     = 18'h0017f,
    ADDR_ALIGNEDA_BASE = 18'h00200,
    ADDR_ALIGNEDA_HIGH = 18'h002ff,
    ADDR_ALIGNEDB_BASE = 18'h00300,
    ADDR_ALIGNEDB_HIGH = 18'h003ff,
    ADDR_PTR_BASE      = 18'h08000,
    ADDR_PTR_HIGH      = 18'h0ffff,
    ADDR_M_BASE        = 18'h20000,
    ADDR_M_HIGH        = 18'h3ffff,
    WRIDLE             = 2'd0,
    WRDATA             = 2'd1,
    WRRESP             = 2'd2,
    WRRESET            = 2'd3,
    RDIDLE             = 2'd0,
    RDDATA             = 2'd1,
    RDRESET            = 2'd2,
    ADDR_BITS                = 18;

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
    wire [4:0]                    int_SEQA_address0;
    wire                          int_SEQA_ce0;
    wire                          int_SEQA_we0;
    wire [3:0]                    int_SEQA_be0;
    wire [31:0]                   int_SEQA_d0;
    wire [31:0]                   int_SEQA_q0;
    wire [4:0]                    int_SEQA_address1;
    wire                          int_SEQA_ce1;
    wire                          int_SEQA_we1;
    wire [3:0]                    int_SEQA_be1;
    wire [31:0]                   int_SEQA_d1;
    wire [31:0]                   int_SEQA_q1;
    reg                           int_SEQA_read;
    reg                           int_SEQA_write;
    reg  [1:0]                    int_SEQA_shift;
    wire [4:0]                    int_SEQB_address0;
    wire                          int_SEQB_ce0;
    wire                          int_SEQB_we0;
    wire [3:0]                    int_SEQB_be0;
    wire [31:0]                   int_SEQB_d0;
    wire [31:0]                   int_SEQB_q0;
    wire [4:0]                    int_SEQB_address1;
    wire                          int_SEQB_ce1;
    wire                          int_SEQB_we1;
    wire [3:0]                    int_SEQB_be1;
    wire [31:0]                   int_SEQB_d1;
    wire [31:0]                   int_SEQB_q1;
    reg                           int_SEQB_read;
    reg                           int_SEQB_write;
    reg  [1:0]                    int_SEQB_shift;
    wire [5:0]                    int_alignedA_address0;
    wire                          int_alignedA_ce0;
    wire                          int_alignedA_we0;
    wire [3:0]                    int_alignedA_be0;
    wire [31:0]                   int_alignedA_d0;
    wire [31:0]                   int_alignedA_q0;
    wire [5:0]                    int_alignedA_address1;
    wire                          int_alignedA_ce1;
    wire                          int_alignedA_we1;
    wire [3:0]                    int_alignedA_be1;
    wire [31:0]                   int_alignedA_d1;
    wire [31:0]                   int_alignedA_q1;
    reg                           int_alignedA_read;
    reg                           int_alignedA_write;
    reg  [1:0]                    int_alignedA_shift;
    wire [5:0]                    int_alignedB_address0;
    wire                          int_alignedB_ce0;
    wire                          int_alignedB_we0;
    wire [3:0]                    int_alignedB_be0;
    wire [31:0]                   int_alignedB_d0;
    wire [31:0]                   int_alignedB_q0;
    wire [5:0]                    int_alignedB_address1;
    wire                          int_alignedB_ce1;
    wire                          int_alignedB_we1;
    wire [3:0]                    int_alignedB_be1;
    wire [31:0]                   int_alignedB_d1;
    wire [31:0]                   int_alignedB_q1;
    reg                           int_alignedB_read;
    reg                           int_alignedB_write;
    reg  [1:0]                    int_alignedB_shift;
    wire [12:0]                   int_ptr_address0;
    wire                          int_ptr_ce0;
    wire                          int_ptr_we0;
    wire [3:0]                    int_ptr_be0;
    wire [31:0]                   int_ptr_d0;
    wire [31:0]                   int_ptr_q0;
    wire [12:0]                   int_ptr_address1;
    wire                          int_ptr_ce1;
    wire                          int_ptr_we1;
    wire [3:0]                    int_ptr_be1;
    wire [31:0]                   int_ptr_d1;
    wire [31:0]                   int_ptr_q1;
    reg                           int_ptr_read;
    reg                           int_ptr_write;
    reg  [1:0]                    int_ptr_shift;
    wire [14:0]                   int_M_address0;
    wire                          int_M_ce0;
    wire                          int_M_we0;
    wire [3:0]                    int_M_be0;
    wire [31:0]                   int_M_d0;
    wire [31:0]                   int_M_q0;
    wire [14:0]                   int_M_address1;
    wire                          int_M_ce1;
    wire                          int_M_we1;
    wire [3:0]                    int_M_be1;
    wire [31:0]                   int_M_d1;
    wire [31:0]                   int_M_q1;
    reg                           int_M_read;
    reg                           int_M_write;

//------------------------Instantiation------------------
// int_SEQA
needwun_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 32 )
) int_SEQA (
    .clk0     ( ACLK ),
    .address0 ( int_SEQA_address0 ),
    .ce0      ( int_SEQA_ce0 ),
    .we0      ( int_SEQA_we0 ),
    .be0      ( int_SEQA_be0 ),
    .d0       ( int_SEQA_d0 ),
    .q0       ( int_SEQA_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_SEQA_address1 ),
    .ce1      ( int_SEQA_ce1 ),
    .we1      ( int_SEQA_we1 ),
    .be1      ( int_SEQA_be1 ),
    .d1       ( int_SEQA_d1 ),
    .q1       ( int_SEQA_q1 )
);
// int_SEQB
needwun_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 32 )
) int_SEQB (
    .clk0     ( ACLK ),
    .address0 ( int_SEQB_address0 ),
    .ce0      ( int_SEQB_ce0 ),
    .we0      ( int_SEQB_we0 ),
    .be0      ( int_SEQB_be0 ),
    .d0       ( int_SEQB_d0 ),
    .q0       ( int_SEQB_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_SEQB_address1 ),
    .ce1      ( int_SEQB_ce1 ),
    .we1      ( int_SEQB_we1 ),
    .be1      ( int_SEQB_be1 ),
    .d1       ( int_SEQB_d1 ),
    .q1       ( int_SEQB_q1 )
);
// int_alignedA
needwun_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 64 )
) int_alignedA (
    .clk0     ( ACLK ),
    .address0 ( int_alignedA_address0 ),
    .ce0      ( int_alignedA_ce0 ),
    .we0      ( int_alignedA_we0 ),
    .be0      ( int_alignedA_be0 ),
    .d0       ( int_alignedA_d0 ),
    .q0       ( int_alignedA_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_alignedA_address1 ),
    .ce1      ( int_alignedA_ce1 ),
    .we1      ( int_alignedA_we1 ),
    .be1      ( int_alignedA_be1 ),
    .d1       ( int_alignedA_d1 ),
    .q1       ( int_alignedA_q1 )
);
// int_alignedB
needwun_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 64 )
) int_alignedB (
    .clk0     ( ACLK ),
    .address0 ( int_alignedB_address0 ),
    .ce0      ( int_alignedB_ce0 ),
    .we0      ( int_alignedB_we0 ),
    .be0      ( int_alignedB_be0 ),
    .d0       ( int_alignedB_d0 ),
    .q0       ( int_alignedB_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_alignedB_address1 ),
    .ce1      ( int_alignedB_ce1 ),
    .we1      ( int_alignedB_we1 ),
    .be1      ( int_alignedB_be1 ),
    .d1       ( int_alignedB_d1 ),
    .q1       ( int_alignedB_q1 )
);
// int_ptr
needwun_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 4161 )
) int_ptr (
    .clk0     ( ACLK ),
    .address0 ( int_ptr_address0 ),
    .ce0      ( int_ptr_ce0 ),
    .we0      ( int_ptr_we0 ),
    .be0      ( int_ptr_be0 ),
    .d0       ( int_ptr_d0 ),
    .q0       ( int_ptr_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_ptr_address1 ),
    .ce1      ( int_ptr_ce1 ),
    .we1      ( int_ptr_we1 ),
    .be1      ( int_ptr_be1 ),
    .d1       ( int_ptr_d1 ),
    .q1       ( int_ptr_q1 )
);
// int_M
needwun_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16641 )
) int_M (
    .clk0     ( ACLK ),
    .address0 ( int_M_address0 ),
    .ce0      ( int_M_ce0 ),
    .we0      ( int_M_we0 ),
    .be0      ( int_M_be0 ),
    .d0       ( int_M_d0 ),
    .q0       ( int_M_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_M_address1 ),
    .ce1      ( int_M_ce1 ),
    .we1      ( int_M_we1 ),
    .be1      ( int_M_be1 ),
    .d1       ( int_M_d1 ),
    .q1       ( int_M_q1 )
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
assign RVALID  = (rstate == RDDATA) & !int_SEQA_read & !int_SEQB_read & !int_alignedA_read & !int_alignedB_read & !int_ptr_read & !int_M_read;
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
        else if (int_SEQA_read) begin
            rdata <= int_SEQA_q1;
        end
        else if (int_SEQB_read) begin
            rdata <= int_SEQB_q1;
        end
        else if (int_alignedA_read) begin
            rdata <= int_alignedA_q1;
        end
        else if (int_alignedB_read) begin
            rdata <= int_alignedB_q1;
        end
        else if (int_ptr_read) begin
            rdata <= int_ptr_q1;
        end
        else if (int_M_read) begin
            rdata <= int_M_q1;
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
// SEQA
assign int_SEQA_address0     = SEQA_address0 >> 2;
assign int_SEQA_ce0          = SEQA_ce0;
assign int_SEQA_we0          = 1'b0;
assign int_SEQA_be0          = 1'b0;
assign int_SEQA_d0           = 1'b0;
assign SEQA_q0               = int_SEQA_q0 >> (int_SEQA_shift * 8);
assign int_SEQA_address1     = ar_hs? raddr[6:2] : waddr[6:2];
assign int_SEQA_ce1          = ar_hs | (int_SEQA_write & WVALID);
assign int_SEQA_we1          = int_SEQA_write & w_hs;
assign int_SEQA_be1          = WSTRB;
assign int_SEQA_d1           = WDATA;
// SEQB
assign int_SEQB_address0     = SEQB_address0 >> 2;
assign int_SEQB_ce0          = SEQB_ce0;
assign int_SEQB_we0          = 1'b0;
assign int_SEQB_be0          = 1'b0;
assign int_SEQB_d0           = 1'b0;
assign SEQB_q0               = int_SEQB_q0 >> (int_SEQB_shift * 8);
assign int_SEQB_address1     = ar_hs? raddr[6:2] : waddr[6:2];
assign int_SEQB_ce1          = ar_hs | (int_SEQB_write & WVALID);
assign int_SEQB_we1          = int_SEQB_write & w_hs;
assign int_SEQB_be1          = WSTRB;
assign int_SEQB_d1           = WDATA;
// alignedA
assign int_alignedA_address0 = alignedA_address0 >> 2;
assign int_alignedA_ce0      = alignedA_ce0;
assign int_alignedA_we0      = alignedA_we0;
assign int_alignedA_be0      = 1 << alignedA_address0[1:0];
assign int_alignedA_d0       = {4{alignedA_d0}};
assign int_alignedA_address1 = ar_hs? raddr[7:2] : waddr[7:2];
assign int_alignedA_ce1      = ar_hs | (int_alignedA_write & WVALID);
assign int_alignedA_we1      = int_alignedA_write & w_hs;
assign int_alignedA_be1      = WSTRB;
assign int_alignedA_d1       = WDATA;
// alignedB
assign int_alignedB_address0 = alignedB_address0 >> 2;
assign int_alignedB_ce0      = alignedB_ce0;
assign int_alignedB_we0      = alignedB_we0;
assign int_alignedB_be0      = 1 << alignedB_address0[1:0];
assign int_alignedB_d0       = {4{alignedB_d0}};
assign int_alignedB_address1 = ar_hs? raddr[7:2] : waddr[7:2];
assign int_alignedB_ce1      = ar_hs | (int_alignedB_write & WVALID);
assign int_alignedB_we1      = int_alignedB_write & w_hs;
assign int_alignedB_be1      = WSTRB;
assign int_alignedB_d1       = WDATA;
// ptr
assign int_ptr_address0      = ptr_address0 >> 2;
assign int_ptr_ce0           = ptr_ce0;
assign int_ptr_we0           = ptr_we0;
assign int_ptr_be0           = 1 << ptr_address0[1:0];
assign int_ptr_d0            = {4{ptr_d0}};
assign ptr_q0                = int_ptr_q0 >> (int_ptr_shift * 8);
assign int_ptr_address1      = ar_hs? raddr[14:2] : waddr[14:2];
assign int_ptr_ce1           = ar_hs | (int_ptr_write & WVALID);
assign int_ptr_we1           = int_ptr_write & w_hs;
assign int_ptr_be1           = WSTRB;
assign int_ptr_d1            = WDATA;
// M
assign int_M_address0        = M_address0;
assign int_M_ce0             = M_ce0;
assign int_M_we0             = M_we0;
assign int_M_be0             = {4{M_we0}};
assign int_M_d0              = M_d0;
assign M_q0                  = int_M_q0;
assign int_M_address1        = ar_hs? raddr[16:2] : waddr[16:2];
assign int_M_ce1             = ar_hs | (int_M_write & WVALID);
assign int_M_we1             = int_M_write & w_hs;
assign int_M_be1             = WSTRB;
assign int_M_d1              = WDATA;
// int_SEQA_read
always @(posedge ACLK) begin
    if (ARESET)
        int_SEQA_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_SEQA_BASE && raddr <= ADDR_SEQA_HIGH)
            int_SEQA_read <= 1'b1;
        else
            int_SEQA_read <= 1'b0;
    end
end

// int_SEQA_write
always @(posedge ACLK) begin
    if (ARESET)
        int_SEQA_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_SEQA_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_SEQA_HIGH)
            int_SEQA_write <= 1'b1;
        else if (w_hs)
            int_SEQA_write <= 1'b0;
    end
end

// int_SEQA_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (SEQA_ce0)
            int_SEQA_shift <= SEQA_address0[1:0];
    end
end

// int_SEQB_read
always @(posedge ACLK) begin
    if (ARESET)
        int_SEQB_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_SEQB_BASE && raddr <= ADDR_SEQB_HIGH)
            int_SEQB_read <= 1'b1;
        else
            int_SEQB_read <= 1'b0;
    end
end

// int_SEQB_write
always @(posedge ACLK) begin
    if (ARESET)
        int_SEQB_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_SEQB_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_SEQB_HIGH)
            int_SEQB_write <= 1'b1;
        else if (w_hs)
            int_SEQB_write <= 1'b0;
    end
end

// int_SEQB_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (SEQB_ce0)
            int_SEQB_shift <= SEQB_address0[1:0];
    end
end

// int_alignedA_read
always @(posedge ACLK) begin
    if (ARESET)
        int_alignedA_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_ALIGNEDA_BASE && raddr <= ADDR_ALIGNEDA_HIGH)
            int_alignedA_read <= 1'b1;
        else
            int_alignedA_read <= 1'b0;
    end
end

// int_alignedA_write
always @(posedge ACLK) begin
    if (ARESET)
        int_alignedA_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_ALIGNEDA_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_ALIGNEDA_HIGH)
            int_alignedA_write <= 1'b1;
        else if (w_hs)
            int_alignedA_write <= 1'b0;
    end
end

// int_alignedA_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (alignedA_ce0)
            int_alignedA_shift <= alignedA_address0[1:0];
    end
end

// int_alignedB_read
always @(posedge ACLK) begin
    if (ARESET)
        int_alignedB_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_ALIGNEDB_BASE && raddr <= ADDR_ALIGNEDB_HIGH)
            int_alignedB_read <= 1'b1;
        else
            int_alignedB_read <= 1'b0;
    end
end

// int_alignedB_write
always @(posedge ACLK) begin
    if (ARESET)
        int_alignedB_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_ALIGNEDB_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_ALIGNEDB_HIGH)
            int_alignedB_write <= 1'b1;
        else if (w_hs)
            int_alignedB_write <= 1'b0;
    end
end

// int_alignedB_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (alignedB_ce0)
            int_alignedB_shift <= alignedB_address0[1:0];
    end
end

// int_ptr_read
always @(posedge ACLK) begin
    if (ARESET)
        int_ptr_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_PTR_BASE && raddr <= ADDR_PTR_HIGH)
            int_ptr_read <= 1'b1;
        else
            int_ptr_read <= 1'b0;
    end
end

// int_ptr_write
always @(posedge ACLK) begin
    if (ARESET)
        int_ptr_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_PTR_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_PTR_HIGH)
            int_ptr_write <= 1'b1;
        else if (w_hs)
            int_ptr_write <= 1'b0;
    end
end

// int_ptr_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ptr_ce0)
            int_ptr_shift <= ptr_address0[1:0];
    end
end

// int_M_read
always @(posedge ACLK) begin
    if (ARESET)
        int_M_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_M_BASE && raddr <= ADDR_M_HIGH)
            int_M_read <= 1'b1;
        else
            int_M_read <= 1'b0;
    end
end

// int_M_write
always @(posedge ACLK) begin
    if (ARESET)
        int_M_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_M_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_M_HIGH)
            int_M_write <= 1'b1;
        else if (w_hs)
            int_M_write <= 1'b0;
    end
end


endmodule


`timescale 1ns/1ps

module needwun_BUS_A_s_axi_ram
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

