// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module fft_BUS_A_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 15,
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
    input  wire [8:0]                    real_twid_address0,
    input  wire                          real_twid_ce0,
    output wire [63:0]                   real_twid_q0,
    input  wire [9:0]                    real_r_address0,
    input  wire                          real_r_ce0,
    input  wire                          real_r_we0,
    input  wire [63:0]                   real_r_d0,
    output wire [63:0]                   real_r_q0,
    input  wire [9:0]                    img_address0,
    input  wire                          img_ce0,
    input  wire                          img_we0,
    input  wire [63:0]                   img_d0,
    output wire [63:0]                   img_q0,
    input  wire [8:0]                    img_twid_address0,
    input  wire                          img_twid_ce0,
    output wire [63:0]                   img_twid_q0,
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
// 0x1000 ~
// 0x1fff : Memory 'real_twid' (512 * 64b)
//          Word 2n   : bit [31:0] - real_twid[n][31: 0]
//          Word 2n+1 : bit [31:0] - real_twid[n][63:32]
// 0x2000 ~
// 0x3fff : Memory 'real_r' (1024 * 64b)
//          Word 2n   : bit [31:0] - real_r[n][31: 0]
//          Word 2n+1 : bit [31:0] - real_r[n][63:32]
// 0x4000 ~
// 0x5fff : Memory 'img' (1024 * 64b)
//          Word 2n   : bit [31:0] - img[n][31: 0]
//          Word 2n+1 : bit [31:0] - img[n][63:32]
// 0x6000 ~
// 0x6fff : Memory 'img_twid' (512 * 64b)
//          Word 2n   : bit [31:0] - img_twid[n][31: 0]
//          Word 2n+1 : bit [31:0] - img_twid[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL        = 15'h0000,
    ADDR_GIE            = 15'h0004,
    ADDR_IER            = 15'h0008,
    ADDR_ISR            = 15'h000c,
    ADDR_REAL_TWID_BASE = 15'h1000,
    ADDR_REAL_TWID_HIGH = 15'h1fff,
    ADDR_REAL_R_BASE    = 15'h2000,
    ADDR_REAL_R_HIGH    = 15'h3fff,
    ADDR_IMG_BASE       = 15'h4000,
    ADDR_IMG_HIGH       = 15'h5fff,
    ADDR_IMG_TWID_BASE  = 15'h6000,
    ADDR_IMG_TWID_HIGH  = 15'h6fff,
    WRIDLE              = 2'd0,
    WRDATA              = 2'd1,
    WRRESP              = 2'd2,
    WRRESET             = 2'd3,
    RDIDLE              = 2'd0,
    RDDATA              = 2'd1,
    RDRESET             = 2'd2,
    ADDR_BITS                = 15;

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
    wire [8:0]                    int_real_twid_address0;
    wire                          int_real_twid_ce0;
    wire                          int_real_twid_we0;
    wire [7:0]                    int_real_twid_be0;
    wire [63:0]                   int_real_twid_d0;
    wire [63:0]                   int_real_twid_q0;
    wire [8:0]                    int_real_twid_address1;
    wire                          int_real_twid_ce1;
    wire                          int_real_twid_we1;
    wire [7:0]                    int_real_twid_be1;
    wire [63:0]                   int_real_twid_d1;
    wire [63:0]                   int_real_twid_q1;
    reg                           int_real_twid_read;
    reg                           int_real_twid_write;
    reg  [0:0]                    int_real_twid_shift;
    wire [9:0]                    int_real_r_address0;
    wire                          int_real_r_ce0;
    wire                          int_real_r_we0;
    wire [7:0]                    int_real_r_be0;
    wire [63:0]                   int_real_r_d0;
    wire [63:0]                   int_real_r_q0;
    wire [9:0]                    int_real_r_address1;
    wire                          int_real_r_ce1;
    wire                          int_real_r_we1;
    wire [7:0]                    int_real_r_be1;
    wire [63:0]                   int_real_r_d1;
    wire [63:0]                   int_real_r_q1;
    reg                           int_real_r_read;
    reg                           int_real_r_write;
    reg  [0:0]                    int_real_r_shift;
    wire [9:0]                    int_img_address0;
    wire                          int_img_ce0;
    wire                          int_img_we0;
    wire [7:0]                    int_img_be0;
    wire [63:0]                   int_img_d0;
    wire [63:0]                   int_img_q0;
    wire [9:0]                    int_img_address1;
    wire                          int_img_ce1;
    wire                          int_img_we1;
    wire [7:0]                    int_img_be1;
    wire [63:0]                   int_img_d1;
    wire [63:0]                   int_img_q1;
    reg                           int_img_read;
    reg                           int_img_write;
    reg  [0:0]                    int_img_shift;
    wire [8:0]                    int_img_twid_address0;
    wire                          int_img_twid_ce0;
    wire                          int_img_twid_we0;
    wire [7:0]                    int_img_twid_be0;
    wire [63:0]                   int_img_twid_d0;
    wire [63:0]                   int_img_twid_q0;
    wire [8:0]                    int_img_twid_address1;
    wire                          int_img_twid_ce1;
    wire                          int_img_twid_we1;
    wire [7:0]                    int_img_twid_be1;
    wire [63:0]                   int_img_twid_d1;
    wire [63:0]                   int_img_twid_q1;
    reg                           int_img_twid_read;
    reg                           int_img_twid_write;
    reg  [0:0]                    int_img_twid_shift;

//------------------------Instantiation------------------
// int_real_twid
fft_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 512 )
) int_real_twid (
    .clk0     ( ACLK ),
    .address0 ( int_real_twid_address0 ),
    .ce0      ( int_real_twid_ce0 ),
    .we0      ( int_real_twid_we0 ),
    .be0      ( int_real_twid_be0 ),
    .d0       ( int_real_twid_d0 ),
    .q0       ( int_real_twid_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_real_twid_address1 ),
    .ce1      ( int_real_twid_ce1 ),
    .we1      ( int_real_twid_we1 ),
    .be1      ( int_real_twid_be1 ),
    .d1       ( int_real_twid_d1 ),
    .q1       ( int_real_twid_q1 )
);
// int_real_r
fft_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 1024 )
) int_real_r (
    .clk0     ( ACLK ),
    .address0 ( int_real_r_address0 ),
    .ce0      ( int_real_r_ce0 ),
    .we0      ( int_real_r_we0 ),
    .be0      ( int_real_r_be0 ),
    .d0       ( int_real_r_d0 ),
    .q0       ( int_real_r_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_real_r_address1 ),
    .ce1      ( int_real_r_ce1 ),
    .we1      ( int_real_r_we1 ),
    .be1      ( int_real_r_be1 ),
    .d1       ( int_real_r_d1 ),
    .q1       ( int_real_r_q1 )
);
// int_img
fft_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 1024 )
) int_img (
    .clk0     ( ACLK ),
    .address0 ( int_img_address0 ),
    .ce0      ( int_img_ce0 ),
    .we0      ( int_img_we0 ),
    .be0      ( int_img_be0 ),
    .d0       ( int_img_d0 ),
    .q0       ( int_img_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_img_address1 ),
    .ce1      ( int_img_ce1 ),
    .we1      ( int_img_we1 ),
    .be1      ( int_img_be1 ),
    .d1       ( int_img_d1 ),
    .q1       ( int_img_q1 )
);
// int_img_twid
fft_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 512 )
) int_img_twid (
    .clk0     ( ACLK ),
    .address0 ( int_img_twid_address0 ),
    .ce0      ( int_img_twid_ce0 ),
    .we0      ( int_img_twid_we0 ),
    .be0      ( int_img_twid_be0 ),
    .d0       ( int_img_twid_d0 ),
    .q0       ( int_img_twid_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_img_twid_address1 ),
    .ce1      ( int_img_twid_ce1 ),
    .we1      ( int_img_twid_we1 ),
    .be1      ( int_img_twid_be1 ),
    .d1       ( int_img_twid_d1 ),
    .q1       ( int_img_twid_q1 )
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
assign RVALID  = (rstate == RDDATA) & !int_real_twid_read & !int_real_r_read & !int_img_read & !int_img_twid_read;
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
        else if (int_real_twid_read) begin
            rdata <= int_real_twid_q1 >> (int_real_twid_shift * 32);
        end
        else if (int_real_r_read) begin
            rdata <= int_real_r_q1 >> (int_real_r_shift * 32);
        end
        else if (int_img_read) begin
            rdata <= int_img_q1 >> (int_img_shift * 32);
        end
        else if (int_img_twid_read) begin
            rdata <= int_img_twid_q1 >> (int_img_twid_shift * 32);
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
// real_twid
assign int_real_twid_address0 = real_twid_address0;
assign int_real_twid_ce0      = real_twid_ce0;
assign int_real_twid_we0      = 1'b0;
assign int_real_twid_be0      = 1'b0;
assign int_real_twid_d0       = 1'b0;
assign real_twid_q0           = int_real_twid_q0;
assign int_real_twid_address1 = ar_hs? raddr[11:3] : waddr[11:3];
assign int_real_twid_ce1      = ar_hs | (int_real_twid_write & WVALID);
assign int_real_twid_we1      = int_real_twid_write & w_hs;
assign int_real_twid_be1      = WSTRB << (waddr[2:2] * 4);
assign int_real_twid_d1       = {2{WDATA}};
// real_r
assign int_real_r_address0    = real_r_address0;
assign int_real_r_ce0         = real_r_ce0;
assign int_real_r_we0         = real_r_we0;
assign int_real_r_be0         = {8{real_r_we0}};
assign int_real_r_d0          = real_r_d0;
assign real_r_q0              = int_real_r_q0;
assign int_real_r_address1    = ar_hs? raddr[12:3] : waddr[12:3];
assign int_real_r_ce1         = ar_hs | (int_real_r_write & WVALID);
assign int_real_r_we1         = int_real_r_write & w_hs;
assign int_real_r_be1         = WSTRB << (waddr[2:2] * 4);
assign int_real_r_d1          = {2{WDATA}};
// img
assign int_img_address0       = img_address0;
assign int_img_ce0            = img_ce0;
assign int_img_we0            = img_we0;
assign int_img_be0            = {8{img_we0}};
assign int_img_d0             = img_d0;
assign img_q0                 = int_img_q0;
assign int_img_address1       = ar_hs? raddr[12:3] : waddr[12:3];
assign int_img_ce1            = ar_hs | (int_img_write & WVALID);
assign int_img_we1            = int_img_write & w_hs;
assign int_img_be1            = WSTRB << (waddr[2:2] * 4);
assign int_img_d1             = {2{WDATA}};
// img_twid
assign int_img_twid_address0  = img_twid_address0;
assign int_img_twid_ce0       = img_twid_ce0;
assign int_img_twid_we0       = 1'b0;
assign int_img_twid_be0       = 1'b0;
assign int_img_twid_d0        = 1'b0;
assign img_twid_q0            = int_img_twid_q0;
assign int_img_twid_address1  = ar_hs? raddr[11:3] : waddr[11:3];
assign int_img_twid_ce1       = ar_hs | (int_img_twid_write & WVALID);
assign int_img_twid_we1       = int_img_twid_write & w_hs;
assign int_img_twid_be1       = WSTRB << (waddr[2:2] * 4);
assign int_img_twid_d1        = {2{WDATA}};
// int_real_twid_read
always @(posedge ACLK) begin
    if (ARESET)
        int_real_twid_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_REAL_TWID_BASE && raddr <= ADDR_REAL_TWID_HIGH)
            int_real_twid_read <= 1'b1;
        else
            int_real_twid_read <= 1'b0;
    end
end

// int_real_twid_write
always @(posedge ACLK) begin
    if (ARESET)
        int_real_twid_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_REAL_TWID_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_REAL_TWID_HIGH)
            int_real_twid_write <= 1'b1;
        else if (w_hs)
            int_real_twid_write <= 1'b0;
    end
end

// int_real_twid_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_real_twid_shift <= raddr[2:2];
    end
end

// int_real_r_read
always @(posedge ACLK) begin
    if (ARESET)
        int_real_r_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_REAL_R_BASE && raddr <= ADDR_REAL_R_HIGH)
            int_real_r_read <= 1'b1;
        else
            int_real_r_read <= 1'b0;
    end
end

// int_real_r_write
always @(posedge ACLK) begin
    if (ARESET)
        int_real_r_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_REAL_R_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_REAL_R_HIGH)
            int_real_r_write <= 1'b1;
        else if (w_hs)
            int_real_r_write <= 1'b0;
    end
end

// int_real_r_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_real_r_shift <= raddr[2:2];
    end
end

// int_img_read
always @(posedge ACLK) begin
    if (ARESET)
        int_img_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_IMG_BASE && raddr <= ADDR_IMG_HIGH)
            int_img_read <= 1'b1;
        else
            int_img_read <= 1'b0;
    end
end

// int_img_write
always @(posedge ACLK) begin
    if (ARESET)
        int_img_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_IMG_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_IMG_HIGH)
            int_img_write <= 1'b1;
        else if (w_hs)
            int_img_write <= 1'b0;
    end
end

// int_img_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_img_shift <= raddr[2:2];
    end
end

// int_img_twid_read
always @(posedge ACLK) begin
    if (ARESET)
        int_img_twid_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_IMG_TWID_BASE && raddr <= ADDR_IMG_TWID_HIGH)
            int_img_twid_read <= 1'b1;
        else
            int_img_twid_read <= 1'b0;
    end
end

// int_img_twid_write
always @(posedge ACLK) begin
    if (ARESET)
        int_img_twid_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_IMG_TWID_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_IMG_TWID_HIGH)
            int_img_twid_write <= 1'b1;
        else if (w_hs)
            int_img_twid_write <= 1'b0;
    end
end

// int_img_twid_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_img_twid_shift <= raddr[2:2];
    end
end


endmodule


`timescale 1ns/1ps

module fft_BUS_A_s_axi_ram
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

