// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module spmv_BUS_A_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 16,
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
    input  wire [8:0]                    rowDelimiters_address0,
    input  wire                          rowDelimiters_ce0,
    output wire [31:0]                   rowDelimiters_q0,
    input  wire [8:0]                    vec_address0,
    input  wire                          vec_ce0,
    output wire [63:0]                   vec_q0,
    input  wire [10:0]                   cols_address0,
    input  wire                          cols_ce0,
    output wire [31:0]                   cols_q0,
    input  wire [10:0]                   val_r_address0,
    input  wire                          val_r_ce0,
    output wire [63:0]                   val_r_q0,
    input  wire [8:0]                    out_r_address0,
    input  wire                          out_r_ce0,
    input  wire                          out_r_we0,
    input  wire [63:0]                   out_r_d0,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// 0x0000 : Control signals
//          bit 0  - ap_start (Read/Write/COH)
//          bit 1  - ap_done (Read/COR)
//          bit 2  - ap_idle (Read)
//          bit 3  - ap_ready (Read)
//          bit 7  - auto_restart (Read/Write)
//          others - reserved
// 0x0004 : Global Interrupt Enable Register
//          bit 0  - Global Interrupt Enable (Read/Write)
//          others - reserved
// 0x0008 : IP Interrupt Enable Register (Read/Write)
//          bit 0  - enable ap_done interrupt (Read/Write)
//          bit 1  - enable ap_ready interrupt (Read/Write)
//          others - reserved
// 0x000c : IP Interrupt Status Register (Read/TOW)
//          bit 0  - ap_done (COR/TOW)
//          bit 1  - ap_ready (COR/TOW)
//          others - reserved
// 0x0800 ~
// 0x0fff : Memory 'rowDelimiters' (495 * 32b)
//          Word n : bit [31:0] - rowDelimiters[n]
// 0x1000 ~
// 0x1fff : Memory 'vec' (494 * 64b)
//          Word 2n   : bit [31:0] - vec[n][31: 0]
//          Word 2n+1 : bit [31:0] - vec[n][63:32]
// 0x2000 ~
// 0x3fff : Memory 'cols' (1666 * 32b)
//          Word n : bit [31:0] - cols[n]
// 0x4000 ~
// 0x7fff : Memory 'val_r' (1666 * 64b)
//          Word 2n   : bit [31:0] - val_r[n][31: 0]
//          Word 2n+1 : bit [31:0] - val_r[n][63:32]
// 0x8000 ~
// 0x8fff : Memory 'out_r' (494 * 64b)
//          Word 2n   : bit [31:0] - out_r[n][31: 0]
//          Word 2n+1 : bit [31:0] - out_r[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL            = 16'h0000,
    ADDR_GIE                = 16'h0004,
    ADDR_IER                = 16'h0008,
    ADDR_ISR                = 16'h000c,
    ADDR_ROWDELIMITERS_BASE = 16'h0800,
    ADDR_ROWDELIMITERS_HIGH = 16'h0fff,
    ADDR_VEC_BASE           = 16'h1000,
    ADDR_VEC_HIGH           = 16'h1fff,
    ADDR_COLS_BASE          = 16'h2000,
    ADDR_COLS_HIGH          = 16'h3fff,
    ADDR_VAL_R_BASE         = 16'h4000,
    ADDR_VAL_R_HIGH         = 16'h7fff,
    ADDR_OUT_R_BASE         = 16'h8000,
    ADDR_OUT_R_HIGH         = 16'h8fff,
    WRIDLE                  = 2'd0,
    WRDATA                  = 2'd1,
    WRRESP                  = 2'd2,
    WRRESET                 = 2'd3,
    RDIDLE                  = 2'd0,
    RDDATA                  = 2'd1,
    RDRESET                 = 2'd2,
    ADDR_BITS                = 16;

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
    wire [8:0]                    int_rowDelimiters_address0;
    wire                          int_rowDelimiters_ce0;
    wire                          int_rowDelimiters_we0;
    wire [3:0]                    int_rowDelimiters_be0;
    wire [31:0]                   int_rowDelimiters_d0;
    wire [31:0]                   int_rowDelimiters_q0;
    wire [8:0]                    int_rowDelimiters_address1;
    wire                          int_rowDelimiters_ce1;
    wire                          int_rowDelimiters_we1;
    wire [3:0]                    int_rowDelimiters_be1;
    wire [31:0]                   int_rowDelimiters_d1;
    wire [31:0]                   int_rowDelimiters_q1;
    reg                           int_rowDelimiters_read;
    reg                           int_rowDelimiters_write;
    wire [8:0]                    int_vec_address0;
    wire                          int_vec_ce0;
    wire                          int_vec_we0;
    wire [7:0]                    int_vec_be0;
    wire [63:0]                   int_vec_d0;
    wire [63:0]                   int_vec_q0;
    wire [8:0]                    int_vec_address1;
    wire                          int_vec_ce1;
    wire                          int_vec_we1;
    wire [7:0]                    int_vec_be1;
    wire [63:0]                   int_vec_d1;
    wire [63:0]                   int_vec_q1;
    reg                           int_vec_read;
    reg                           int_vec_write;
    reg  [0:0]                    int_vec_shift;
    wire [10:0]                   int_cols_address0;
    wire                          int_cols_ce0;
    wire                          int_cols_we0;
    wire [3:0]                    int_cols_be0;
    wire [31:0]                   int_cols_d0;
    wire [31:0]                   int_cols_q0;
    wire [10:0]                   int_cols_address1;
    wire                          int_cols_ce1;
    wire                          int_cols_we1;
    wire [3:0]                    int_cols_be1;
    wire [31:0]                   int_cols_d1;
    wire [31:0]                   int_cols_q1;
    reg                           int_cols_read;
    reg                           int_cols_write;
    wire [10:0]                   int_val_r_address0;
    wire                          int_val_r_ce0;
    wire                          int_val_r_we0;
    wire [7:0]                    int_val_r_be0;
    wire [63:0]                   int_val_r_d0;
    wire [63:0]                   int_val_r_q0;
    wire [10:0]                   int_val_r_address1;
    wire                          int_val_r_ce1;
    wire                          int_val_r_we1;
    wire [7:0]                    int_val_r_be1;
    wire [63:0]                   int_val_r_d1;
    wire [63:0]                   int_val_r_q1;
    reg                           int_val_r_read;
    reg                           int_val_r_write;
    reg  [0:0]                    int_val_r_shift;
    wire [8:0]                    int_out_r_address0;
    wire                          int_out_r_ce0;
    wire                          int_out_r_we0;
    wire [7:0]                    int_out_r_be0;
    wire [63:0]                   int_out_r_d0;
    wire [63:0]                   int_out_r_q0;
    wire [8:0]                    int_out_r_address1;
    wire                          int_out_r_ce1;
    wire                          int_out_r_we1;
    wire [7:0]                    int_out_r_be1;
    wire [63:0]                   int_out_r_d1;
    wire [63:0]                   int_out_r_q1;
    reg                           int_out_r_read;
    reg                           int_out_r_write;
    reg  [0:0]                    int_out_r_shift;

//------------------------Instantiation------------------
// int_rowDelimiters
spmv_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 495 )
) int_rowDelimiters (
    .clk0     ( ACLK ),
    .address0 ( int_rowDelimiters_address0 ),
    .ce0      ( int_rowDelimiters_ce0 ),
    .we0      ( int_rowDelimiters_we0 ),
    .be0      ( int_rowDelimiters_be0 ),
    .d0       ( int_rowDelimiters_d0 ),
    .q0       ( int_rowDelimiters_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_rowDelimiters_address1 ),
    .ce1      ( int_rowDelimiters_ce1 ),
    .we1      ( int_rowDelimiters_we1 ),
    .be1      ( int_rowDelimiters_be1 ),
    .d1       ( int_rowDelimiters_d1 ),
    .q1       ( int_rowDelimiters_q1 )
);
// int_vec
spmv_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 494 )
) int_vec (
    .clk0     ( ACLK ),
    .address0 ( int_vec_address0 ),
    .ce0      ( int_vec_ce0 ),
    .we0      ( int_vec_we0 ),
    .be0      ( int_vec_be0 ),
    .d0       ( int_vec_d0 ),
    .q0       ( int_vec_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_vec_address1 ),
    .ce1      ( int_vec_ce1 ),
    .we1      ( int_vec_we1 ),
    .be1      ( int_vec_be1 ),
    .d1       ( int_vec_d1 ),
    .q1       ( int_vec_q1 )
);
// int_cols
spmv_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 1666 )
) int_cols (
    .clk0     ( ACLK ),
    .address0 ( int_cols_address0 ),
    .ce0      ( int_cols_ce0 ),
    .we0      ( int_cols_we0 ),
    .be0      ( int_cols_be0 ),
    .d0       ( int_cols_d0 ),
    .q0       ( int_cols_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_cols_address1 ),
    .ce1      ( int_cols_ce1 ),
    .we1      ( int_cols_we1 ),
    .be1      ( int_cols_be1 ),
    .d1       ( int_cols_d1 ),
    .q1       ( int_cols_q1 )
);
// int_val_r
spmv_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 1666 )
) int_val_r (
    .clk0     ( ACLK ),
    .address0 ( int_val_r_address0 ),
    .ce0      ( int_val_r_ce0 ),
    .we0      ( int_val_r_we0 ),
    .be0      ( int_val_r_be0 ),
    .d0       ( int_val_r_d0 ),
    .q0       ( int_val_r_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_val_r_address1 ),
    .ce1      ( int_val_r_ce1 ),
    .we1      ( int_val_r_we1 ),
    .be1      ( int_val_r_be1 ),
    .d1       ( int_val_r_d1 ),
    .q1       ( int_val_r_q1 )
);
// int_out_r
spmv_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 494 )
) int_out_r (
    .clk0     ( ACLK ),
    .address0 ( int_out_r_address0 ),
    .ce0      ( int_out_r_ce0 ),
    .we0      ( int_out_r_we0 ),
    .be0      ( int_out_r_be0 ),
    .d0       ( int_out_r_d0 ),
    .q0       ( int_out_r_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_out_r_address1 ),
    .ce1      ( int_out_r_ce1 ),
    .we1      ( int_out_r_we1 ),
    .be1      ( int_out_r_be1 ),
    .d1       ( int_out_r_d1 ),
    .q1       ( int_out_r_q1 )
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
assign RVALID  = (rstate == RDDATA) & !int_rowDelimiters_read & !int_vec_read & !int_cols_read & !int_val_r_read & !int_out_r_read;
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
        else if (int_rowDelimiters_read) begin
            rdata <= int_rowDelimiters_q1;
        end
        else if (int_vec_read) begin
            rdata <= int_vec_q1 >> (int_vec_shift * 32);
        end
        else if (int_cols_read) begin
            rdata <= int_cols_q1;
        end
        else if (int_val_r_read) begin
            rdata <= int_val_r_q1 >> (int_val_r_shift * 32);
        end
        else if (int_out_r_read) begin
            rdata <= int_out_r_q1 >> (int_out_r_shift * 32);
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
// rowDelimiters
assign int_rowDelimiters_address0 = rowDelimiters_address0;
assign int_rowDelimiters_ce0      = rowDelimiters_ce0;
assign int_rowDelimiters_we0      = 1'b0;
assign int_rowDelimiters_be0      = 1'b0;
assign int_rowDelimiters_d0       = 1'b0;
assign rowDelimiters_q0           = int_rowDelimiters_q0;
assign int_rowDelimiters_address1 = ar_hs? raddr[10:2] : waddr[10:2];
assign int_rowDelimiters_ce1      = ar_hs | (int_rowDelimiters_write & WVALID);
assign int_rowDelimiters_we1      = int_rowDelimiters_write & w_hs;
assign int_rowDelimiters_be1      = WSTRB;
assign int_rowDelimiters_d1       = WDATA;
// vec
assign int_vec_address0           = vec_address0;
assign int_vec_ce0                = vec_ce0;
assign int_vec_we0                = 1'b0;
assign int_vec_be0                = 1'b0;
assign int_vec_d0                 = 1'b0;
assign vec_q0                     = int_vec_q0;
assign int_vec_address1           = ar_hs? raddr[11:3] : waddr[11:3];
assign int_vec_ce1                = ar_hs | (int_vec_write & WVALID);
assign int_vec_we1                = int_vec_write & w_hs;
assign int_vec_be1                = WSTRB << (waddr[2:2] * 4);
assign int_vec_d1                 = {2{WDATA}};
// cols
assign int_cols_address0          = cols_address0;
assign int_cols_ce0               = cols_ce0;
assign int_cols_we0               = 1'b0;
assign int_cols_be0               = 1'b0;
assign int_cols_d0                = 1'b0;
assign cols_q0                    = int_cols_q0;
assign int_cols_address1          = ar_hs? raddr[12:2] : waddr[12:2];
assign int_cols_ce1               = ar_hs | (int_cols_write & WVALID);
assign int_cols_we1               = int_cols_write & w_hs;
assign int_cols_be1               = WSTRB;
assign int_cols_d1                = WDATA;
// val_r
assign int_val_r_address0         = val_r_address0;
assign int_val_r_ce0              = val_r_ce0;
assign int_val_r_we0              = 1'b0;
assign int_val_r_be0              = 1'b0;
assign int_val_r_d0               = 1'b0;
assign val_r_q0                   = int_val_r_q0;
assign int_val_r_address1         = ar_hs? raddr[13:3] : waddr[13:3];
assign int_val_r_ce1              = ar_hs | (int_val_r_write & WVALID);
assign int_val_r_we1              = int_val_r_write & w_hs;
assign int_val_r_be1              = WSTRB << (waddr[2:2] * 4);
assign int_val_r_d1               = {2{WDATA}};
// out_r
assign int_out_r_address0         = out_r_address0;
assign int_out_r_ce0              = out_r_ce0;
assign int_out_r_we0              = out_r_we0;
assign int_out_r_be0              = {8{out_r_we0}};
assign int_out_r_d0               = out_r_d0;
assign int_out_r_address1         = ar_hs? raddr[11:3] : waddr[11:3];
assign int_out_r_ce1              = ar_hs | (int_out_r_write & WVALID);
assign int_out_r_we1              = int_out_r_write & w_hs;
assign int_out_r_be1              = WSTRB << (waddr[2:2] * 4);
assign int_out_r_d1               = {2{WDATA}};
// int_rowDelimiters_read
always @(posedge ACLK) begin
    if (ARESET)
        int_rowDelimiters_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_ROWDELIMITERS_BASE && raddr <= ADDR_ROWDELIMITERS_HIGH)
            int_rowDelimiters_read <= 1'b1;
        else
            int_rowDelimiters_read <= 1'b0;
    end
end

// int_rowDelimiters_write
always @(posedge ACLK) begin
    if (ARESET)
        int_rowDelimiters_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_ROWDELIMITERS_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_ROWDELIMITERS_HIGH)
            int_rowDelimiters_write <= 1'b1;
        else if (w_hs)
            int_rowDelimiters_write <= 1'b0;
    end
end

// int_vec_read
always @(posedge ACLK) begin
    if (ARESET)
        int_vec_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_VEC_BASE && raddr <= ADDR_VEC_HIGH)
            int_vec_read <= 1'b1;
        else
            int_vec_read <= 1'b0;
    end
end

// int_vec_write
always @(posedge ACLK) begin
    if (ARESET)
        int_vec_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_VEC_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_VEC_HIGH)
            int_vec_write <= 1'b1;
        else if (w_hs)
            int_vec_write <= 1'b0;
    end
end

// int_vec_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_vec_shift <= raddr[2:2];
    end
end

// int_cols_read
always @(posedge ACLK) begin
    if (ARESET)
        int_cols_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COLS_BASE && raddr <= ADDR_COLS_HIGH)
            int_cols_read <= 1'b1;
        else
            int_cols_read <= 1'b0;
    end
end

// int_cols_write
always @(posedge ACLK) begin
    if (ARESET)
        int_cols_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COLS_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COLS_HIGH)
            int_cols_write <= 1'b1;
        else if (w_hs)
            int_cols_write <= 1'b0;
    end
end

// int_val_r_read
always @(posedge ACLK) begin
    if (ARESET)
        int_val_r_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_VAL_R_BASE && raddr <= ADDR_VAL_R_HIGH)
            int_val_r_read <= 1'b1;
        else
            int_val_r_read <= 1'b0;
    end
end

// int_val_r_write
always @(posedge ACLK) begin
    if (ARESET)
        int_val_r_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_VAL_R_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_VAL_R_HIGH)
            int_val_r_write <= 1'b1;
        else if (w_hs)
            int_val_r_write <= 1'b0;
    end
end

// int_val_r_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_val_r_shift <= raddr[2:2];
    end
end

// int_out_r_read
always @(posedge ACLK) begin
    if (ARESET)
        int_out_r_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_OUT_R_BASE && raddr <= ADDR_OUT_R_HIGH)
            int_out_r_read <= 1'b1;
        else
            int_out_r_read <= 1'b0;
    end
end

// int_out_r_write
always @(posedge ACLK) begin
    if (ARESET)
        int_out_r_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_OUT_R_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_OUT_R_HIGH)
            int_out_r_write <= 1'b1;
        else if (w_hs)
            int_out_r_write <= 1'b0;
    end
end

// int_out_r_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_out_r_shift <= raddr[2:2];
    end
end


endmodule


`timescale 1ns/1ps

module spmv_BUS_A_s_axi_ram
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

