// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module stencil_BUS_A_s_axi
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
    input  wire [3:0]                    filter_address0,
    input  wire                          filter_ce0,
    output wire [31:0]                   filter_q0,
    input  wire [12:0]                   orig_address0,
    input  wire                          orig_ce0,
    output wire [31:0]                   orig_q0,
    input  wire [12:0]                   sol_address0,
    input  wire                          sol_ce0,
    input  wire                          sol_we0,
    input  wire [31:0]                   sol_d0,
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
// 0x00040 ~
// 0x0007f : Memory 'filter' (9 * 32b)
//           Word n : bit [31:0] - filter[n]
// 0x08000 ~
// 0x0ffff : Memory 'orig' (8192 * 32b)
//           Word n : bit [31:0] - orig[n]
// 0x10000 ~
// 0x17fff : Memory 'sol' (8192 * 32b)
//           Word n : bit [31:0] - sol[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL     = 17'h00000,
    ADDR_GIE         = 17'h00004,
    ADDR_IER         = 17'h00008,
    ADDR_ISR         = 17'h0000c,
    ADDR_FILTER_BASE = 17'h00040,
    ADDR_FILTER_HIGH = 17'h0007f,
    ADDR_ORIG_BASE   = 17'h08000,
    ADDR_ORIG_HIGH   = 17'h0ffff,
    ADDR_SOL_BASE    = 17'h10000,
    ADDR_SOL_HIGH    = 17'h17fff,
    WRIDLE           = 2'd0,
    WRDATA           = 2'd1,
    WRRESP           = 2'd2,
    WRRESET          = 2'd3,
    RDIDLE           = 2'd0,
    RDDATA           = 2'd1,
    RDRESET          = 2'd2,
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
    wire [3:0]                    int_filter_address0;
    wire                          int_filter_ce0;
    wire                          int_filter_we0;
    wire [3:0]                    int_filter_be0;
    wire [31:0]                   int_filter_d0;
    wire [31:0]                   int_filter_q0;
    wire [3:0]                    int_filter_address1;
    wire                          int_filter_ce1;
    wire                          int_filter_we1;
    wire [3:0]                    int_filter_be1;
    wire [31:0]                   int_filter_d1;
    wire [31:0]                   int_filter_q1;
    reg                           int_filter_read;
    reg                           int_filter_write;
    wire [12:0]                   int_orig_address0;
    wire                          int_orig_ce0;
    wire                          int_orig_we0;
    wire [3:0]                    int_orig_be0;
    wire [31:0]                   int_orig_d0;
    wire [31:0]                   int_orig_q0;
    wire [12:0]                   int_orig_address1;
    wire                          int_orig_ce1;
    wire                          int_orig_we1;
    wire [3:0]                    int_orig_be1;
    wire [31:0]                   int_orig_d1;
    wire [31:0]                   int_orig_q1;
    reg                           int_orig_read;
    reg                           int_orig_write;
    wire [12:0]                   int_sol_address0;
    wire                          int_sol_ce0;
    wire                          int_sol_we0;
    wire [3:0]                    int_sol_be0;
    wire [31:0]                   int_sol_d0;
    wire [31:0]                   int_sol_q0;
    wire [12:0]                   int_sol_address1;
    wire                          int_sol_ce1;
    wire                          int_sol_we1;
    wire [3:0]                    int_sol_be1;
    wire [31:0]                   int_sol_d1;
    wire [31:0]                   int_sol_q1;
    reg                           int_sol_read;
    reg                           int_sol_write;

//------------------------Instantiation------------------
// int_filter
stencil_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 9 )
) int_filter (
    .clk0     ( ACLK ),
    .address0 ( int_filter_address0 ),
    .ce0      ( int_filter_ce0 ),
    .we0      ( int_filter_we0 ),
    .be0      ( int_filter_be0 ),
    .d0       ( int_filter_d0 ),
    .q0       ( int_filter_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_filter_address1 ),
    .ce1      ( int_filter_ce1 ),
    .we1      ( int_filter_we1 ),
    .be1      ( int_filter_be1 ),
    .d1       ( int_filter_d1 ),
    .q1       ( int_filter_q1 )
);
// int_orig
stencil_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 8192 )
) int_orig (
    .clk0     ( ACLK ),
    .address0 ( int_orig_address0 ),
    .ce0      ( int_orig_ce0 ),
    .we0      ( int_orig_we0 ),
    .be0      ( int_orig_be0 ),
    .d0       ( int_orig_d0 ),
    .q0       ( int_orig_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_orig_address1 ),
    .ce1      ( int_orig_ce1 ),
    .we1      ( int_orig_we1 ),
    .be1      ( int_orig_be1 ),
    .d1       ( int_orig_d1 ),
    .q1       ( int_orig_q1 )
);
// int_sol
stencil_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 8192 )
) int_sol (
    .clk0     ( ACLK ),
    .address0 ( int_sol_address0 ),
    .ce0      ( int_sol_ce0 ),
    .we0      ( int_sol_we0 ),
    .be0      ( int_sol_be0 ),
    .d0       ( int_sol_d0 ),
    .q0       ( int_sol_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_sol_address1 ),
    .ce1      ( int_sol_ce1 ),
    .we1      ( int_sol_we1 ),
    .be1      ( int_sol_be1 ),
    .d1       ( int_sol_d1 ),
    .q1       ( int_sol_q1 )
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
assign RVALID  = (rstate == RDDATA) & !int_filter_read & !int_orig_read & !int_sol_read;
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
        else if (int_filter_read) begin
            rdata <= int_filter_q1;
        end
        else if (int_orig_read) begin
            rdata <= int_orig_q1;
        end
        else if (int_sol_read) begin
            rdata <= int_sol_q1;
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
// filter
assign int_filter_address0 = filter_address0;
assign int_filter_ce0      = filter_ce0;
assign int_filter_we0      = 1'b0;
assign int_filter_be0      = 1'b0;
assign int_filter_d0       = 1'b0;
assign filter_q0           = int_filter_q0;
assign int_filter_address1 = ar_hs? raddr[5:2] : waddr[5:2];
assign int_filter_ce1      = ar_hs | (int_filter_write & WVALID);
assign int_filter_we1      = int_filter_write & w_hs;
assign int_filter_be1      = WSTRB;
assign int_filter_d1       = WDATA;
// orig
assign int_orig_address0   = orig_address0;
assign int_orig_ce0        = orig_ce0;
assign int_orig_we0        = 1'b0;
assign int_orig_be0        = 1'b0;
assign int_orig_d0         = 1'b0;
assign orig_q0             = int_orig_q0;
assign int_orig_address1   = ar_hs? raddr[14:2] : waddr[14:2];
assign int_orig_ce1        = ar_hs | (int_orig_write & WVALID);
assign int_orig_we1        = int_orig_write & w_hs;
assign int_orig_be1        = WSTRB;
assign int_orig_d1         = WDATA;
// sol
assign int_sol_address0    = sol_address0;
assign int_sol_ce0         = sol_ce0;
assign int_sol_we0         = sol_we0;
assign int_sol_be0         = {4{sol_we0}};
assign int_sol_d0          = sol_d0;
assign int_sol_address1    = ar_hs? raddr[14:2] : waddr[14:2];
assign int_sol_ce1         = ar_hs | (int_sol_write & WVALID);
assign int_sol_we1         = int_sol_write & w_hs;
assign int_sol_be1         = WSTRB;
assign int_sol_d1          = WDATA;
// int_filter_read
always @(posedge ACLK) begin
    if (ARESET)
        int_filter_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_FILTER_BASE && raddr <= ADDR_FILTER_HIGH)
            int_filter_read <= 1'b1;
        else
            int_filter_read <= 1'b0;
    end
end

// int_filter_write
always @(posedge ACLK) begin
    if (ARESET)
        int_filter_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_FILTER_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_FILTER_HIGH)
            int_filter_write <= 1'b1;
        else if (w_hs)
            int_filter_write <= 1'b0;
    end
end

// int_orig_read
always @(posedge ACLK) begin
    if (ARESET)
        int_orig_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_ORIG_BASE && raddr <= ADDR_ORIG_HIGH)
            int_orig_read <= 1'b1;
        else
            int_orig_read <= 1'b0;
    end
end

// int_orig_write
always @(posedge ACLK) begin
    if (ARESET)
        int_orig_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_ORIG_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_ORIG_HIGH)
            int_orig_write <= 1'b1;
        else if (w_hs)
            int_orig_write <= 1'b0;
    end
end

// int_sol_read
always @(posedge ACLK) begin
    if (ARESET)
        int_sol_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_SOL_BASE && raddr <= ADDR_SOL_HIGH)
            int_sol_read <= 1'b1;
        else
            int_sol_read <= 1'b0;
    end
end

// int_sol_write
always @(posedge ACLK) begin
    if (ARESET)
        int_sol_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_SOL_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_SOL_HIGH)
            int_sol_write <= 1'b1;
        else if (w_hs)
            int_sol_write <= 1'b0;
    end
end


endmodule


`timescale 1ns/1ps

module stencil_BUS_A_s_axi_ram
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

