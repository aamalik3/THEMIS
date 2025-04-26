// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module bfs_BUS_A_s_axi
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
    output wire [63:0]                   starting_node,
    input  wire [3:0]                    level_counts_address0,
    input  wire                          level_counts_ce0,
    input  wire                          level_counts_we0,
    input  wire [63:0]                   level_counts_d0,
    input  wire [7:0]                    level_address0,
    input  wire                          level_ce0,
    input  wire                          level_we0,
    input  wire [7:0]                    level_d0,
    output wire [7:0]                    level_q0,
    input  wire [7:0]                    nodes_address0,
    input  wire                          nodes_ce0,
    output wire [127:0]                  nodes_q0,
    input  wire [11:0]                   edges_address0,
    input  wire                          edges_ce0,
    output wire [63:0]                   edges_q0,
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
// 0x0010 : Data signal of starting_node
//          bit 31~0 - starting_node[31:0] (Read/Write)
// 0x0014 : Data signal of starting_node
//          bit 31~0 - starting_node[63:32] (Read/Write)
// 0x0018 : reserved
// 0x0080 ~
// 0x00ff : Memory 'level_counts' (10 * 64b)
//          Word 2n   : bit [31:0] - level_counts[n][31: 0]
//          Word 2n+1 : bit [31:0] - level_counts[n][63:32]
// 0x0100 ~
// 0x01ff : Memory 'level' (256 * 8b)
//          Word n : bit [ 7: 0] - level[4n]
//                   bit [15: 8] - level[4n+1]
//                   bit [23:16] - level[4n+2]
//                   bit [31:24] - level[4n+3]
// 0x1000 ~
// 0x1fff : Memory 'nodes' (256 * 128b)
//          Word 4n   : bit [31:0] - nodes[n][31: 0]
//          Word 4n+1 : bit [31:0] - nodes[n][63:32]
//          Word 4n+2 : bit [31:0] - nodes[n][95:64]
//          Word 4n+3 : bit [31:0] - nodes[n][127:96]
// 0x8000 ~
// 0xffff : Memory 'edges' (4096 * 64b)
//          Word 2n   : bit [31:0] - edges[n][31: 0]
//          Word 2n+1 : bit [31:0] - edges[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL              = 16'h0000,
    ADDR_GIE                  = 16'h0004,
    ADDR_IER                  = 16'h0008,
    ADDR_ISR                  = 16'h000c,
    ADDR_STARTING_NODE_DATA_0 = 16'h0010,
    ADDR_STARTING_NODE_DATA_1 = 16'h0014,
    ADDR_STARTING_NODE_CTRL   = 16'h0018,
    ADDR_LEVEL_COUNTS_BASE    = 16'h0080,
    ADDR_LEVEL_COUNTS_HIGH    = 16'h00ff,
    ADDR_LEVEL_BASE           = 16'h0100,
    ADDR_LEVEL_HIGH           = 16'h01ff,
    ADDR_NODES_BASE           = 16'h1000,
    ADDR_NODES_HIGH           = 16'h1fff,
    ADDR_EDGES_BASE           = 16'h8000,
    ADDR_EDGES_HIGH           = 16'hffff,
    WRIDLE                    = 2'd0,
    WRDATA                    = 2'd1,
    WRRESP                    = 2'd2,
    WRRESET                   = 2'd3,
    RDIDLE                    = 2'd0,
    RDDATA                    = 2'd1,
    RDRESET                   = 2'd2,
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
    reg  [63:0]                   int_starting_node = 'b0;
    // memory signals
    wire [3:0]                    int_level_counts_address0;
    wire                          int_level_counts_ce0;
    wire                          int_level_counts_we0;
    wire [7:0]                    int_level_counts_be0;
    wire [63:0]                   int_level_counts_d0;
    wire [63:0]                   int_level_counts_q0;
    wire [3:0]                    int_level_counts_address1;
    wire                          int_level_counts_ce1;
    wire                          int_level_counts_we1;
    wire [7:0]                    int_level_counts_be1;
    wire [63:0]                   int_level_counts_d1;
    wire [63:0]                   int_level_counts_q1;
    reg                           int_level_counts_read;
    reg                           int_level_counts_write;
    reg  [0:0]                    int_level_counts_shift;
    wire [5:0]                    int_level_address0;
    wire                          int_level_ce0;
    wire                          int_level_we0;
    wire [3:0]                    int_level_be0;
    wire [31:0]                   int_level_d0;
    wire [31:0]                   int_level_q0;
    wire [5:0]                    int_level_address1;
    wire                          int_level_ce1;
    wire                          int_level_we1;
    wire [3:0]                    int_level_be1;
    wire [31:0]                   int_level_d1;
    wire [31:0]                   int_level_q1;
    reg                           int_level_read;
    reg                           int_level_write;
    reg  [1:0]                    int_level_shift;
    wire [7:0]                    int_nodes_address0;
    wire                          int_nodes_ce0;
    wire                          int_nodes_we0;
    wire [15:0]                   int_nodes_be0;
    wire [127:0]                  int_nodes_d0;
    wire [127:0]                  int_nodes_q0;
    wire [7:0]                    int_nodes_address1;
    wire                          int_nodes_ce1;
    wire                          int_nodes_we1;
    wire [15:0]                   int_nodes_be1;
    wire [127:0]                  int_nodes_d1;
    wire [127:0]                  int_nodes_q1;
    reg                           int_nodes_read;
    reg                           int_nodes_write;
    reg  [1:0]                    int_nodes_shift;
    wire [11:0]                   int_edges_address0;
    wire                          int_edges_ce0;
    wire                          int_edges_we0;
    wire [7:0]                    int_edges_be0;
    wire [63:0]                   int_edges_d0;
    wire [63:0]                   int_edges_q0;
    wire [11:0]                   int_edges_address1;
    wire                          int_edges_ce1;
    wire                          int_edges_we1;
    wire [7:0]                    int_edges_be1;
    wire [63:0]                   int_edges_d1;
    wire [63:0]                   int_edges_q1;
    reg                           int_edges_read;
    reg                           int_edges_write;
    reg  [0:0]                    int_edges_shift;

//------------------------Instantiation------------------
// int_level_counts
bfs_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 10 )
) int_level_counts (
    .clk0     ( ACLK ),
    .address0 ( int_level_counts_address0 ),
    .ce0      ( int_level_counts_ce0 ),
    .we0      ( int_level_counts_we0 ),
    .be0      ( int_level_counts_be0 ),
    .d0       ( int_level_counts_d0 ),
    .q0       ( int_level_counts_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_level_counts_address1 ),
    .ce1      ( int_level_counts_ce1 ),
    .we1      ( int_level_counts_we1 ),
    .be1      ( int_level_counts_be1 ),
    .d1       ( int_level_counts_d1 ),
    .q1       ( int_level_counts_q1 )
);
// int_level
bfs_BUS_A_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 64 )
) int_level (
    .clk0     ( ACLK ),
    .address0 ( int_level_address0 ),
    .ce0      ( int_level_ce0 ),
    .we0      ( int_level_we0 ),
    .be0      ( int_level_be0 ),
    .d0       ( int_level_d0 ),
    .q0       ( int_level_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_level_address1 ),
    .ce1      ( int_level_ce1 ),
    .we1      ( int_level_we1 ),
    .be1      ( int_level_be1 ),
    .d1       ( int_level_d1 ),
    .q1       ( int_level_q1 )
);
// int_nodes
bfs_BUS_A_s_axi_ram #(
    .BYTES    ( 16 ),
    .DEPTH    ( 256 )
) int_nodes (
    .clk0     ( ACLK ),
    .address0 ( int_nodes_address0 ),
    .ce0      ( int_nodes_ce0 ),
    .we0      ( int_nodes_we0 ),
    .be0      ( int_nodes_be0 ),
    .d0       ( int_nodes_d0 ),
    .q0       ( int_nodes_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_nodes_address1 ),
    .ce1      ( int_nodes_ce1 ),
    .we1      ( int_nodes_we1 ),
    .be1      ( int_nodes_be1 ),
    .d1       ( int_nodes_d1 ),
    .q1       ( int_nodes_q1 )
);
// int_edges
bfs_BUS_A_s_axi_ram #(
    .BYTES    ( 8 ),
    .DEPTH    ( 4096 )
) int_edges (
    .clk0     ( ACLK ),
    .address0 ( int_edges_address0 ),
    .ce0      ( int_edges_ce0 ),
    .we0      ( int_edges_we0 ),
    .be0      ( int_edges_be0 ),
    .d0       ( int_edges_d0 ),
    .q0       ( int_edges_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_edges_address1 ),
    .ce1      ( int_edges_ce1 ),
    .we1      ( int_edges_we1 ),
    .be1      ( int_edges_be1 ),
    .d1       ( int_edges_d1 ),
    .q1       ( int_edges_q1 )
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
assign RVALID  = (rstate == RDDATA) & !int_level_counts_read & !int_level_read & !int_nodes_read & !int_edges_read;
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
                ADDR_STARTING_NODE_DATA_0: begin
                    rdata <= int_starting_node[31:0];
                end
                ADDR_STARTING_NODE_DATA_1: begin
                    rdata <= int_starting_node[63:32];
                end
            endcase
        end
        else if (int_level_counts_read) begin
            rdata <= int_level_counts_q1 >> (int_level_counts_shift * 32);
        end
        else if (int_level_read) begin
            rdata <= int_level_q1;
        end
        else if (int_nodes_read) begin
            rdata <= int_nodes_q1 >> (int_nodes_shift * 32);
        end
        else if (int_edges_read) begin
            rdata <= int_edges_q1 >> (int_edges_shift * 32);
        end
    end
end


//------------------------Register logic-----------------
assign interrupt     = int_gie & (|int_isr);
assign ap_start      = int_ap_start;
assign starting_node = int_starting_node;
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

// int_starting_node[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_starting_node[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STARTING_NODE_DATA_0)
            int_starting_node[31:0] <= (WDATA[31:0] & wmask) | (int_starting_node[31:0] & ~wmask);
    end
end

// int_starting_node[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_starting_node[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STARTING_NODE_DATA_1)
            int_starting_node[63:32] <= (WDATA[31:0] & wmask) | (int_starting_node[63:32] & ~wmask);
    end
end


//------------------------Memory logic-------------------
// level_counts
assign int_level_counts_address0 = level_counts_address0;
assign int_level_counts_ce0      = level_counts_ce0;
assign int_level_counts_we0      = level_counts_we0;
assign int_level_counts_be0      = {8{level_counts_we0}};
assign int_level_counts_d0       = level_counts_d0;
assign int_level_counts_address1 = ar_hs? raddr[6:3] : waddr[6:3];
assign int_level_counts_ce1      = ar_hs | (int_level_counts_write & WVALID);
assign int_level_counts_we1      = int_level_counts_write & w_hs;
assign int_level_counts_be1      = WSTRB << (waddr[2:2] * 4);
assign int_level_counts_d1       = {2{WDATA}};
// level
assign int_level_address0        = level_address0 >> 2;
assign int_level_ce0             = level_ce0;
assign int_level_we0             = level_we0;
assign int_level_be0             = 1 << level_address0[1:0];
assign int_level_d0              = {4{level_d0}};
assign level_q0                  = int_level_q0 >> (int_level_shift * 8);
assign int_level_address1        = ar_hs? raddr[7:2] : waddr[7:2];
assign int_level_ce1             = ar_hs | (int_level_write & WVALID);
assign int_level_we1             = int_level_write & w_hs;
assign int_level_be1             = WSTRB;
assign int_level_d1              = WDATA;
// nodes
assign int_nodes_address0        = nodes_address0;
assign int_nodes_ce0             = nodes_ce0;
assign int_nodes_we0             = 1'b0;
assign int_nodes_be0             = 1'b0;
assign int_nodes_d0              = 1'b0;
assign nodes_q0                  = int_nodes_q0;
assign int_nodes_address1        = ar_hs? raddr[11:4] : waddr[11:4];
assign int_nodes_ce1             = ar_hs | (int_nodes_write & WVALID);
assign int_nodes_we1             = int_nodes_write & w_hs;
assign int_nodes_be1             = WSTRB << (waddr[3:2] * 4);
assign int_nodes_d1              = {4{WDATA}};
// edges
assign int_edges_address0        = edges_address0;
assign int_edges_ce0             = edges_ce0;
assign int_edges_we0             = 1'b0;
assign int_edges_be0             = 1'b0;
assign int_edges_d0              = 1'b0;
assign edges_q0                  = int_edges_q0;
assign int_edges_address1        = ar_hs? raddr[14:3] : waddr[14:3];
assign int_edges_ce1             = ar_hs | (int_edges_write & WVALID);
assign int_edges_we1             = int_edges_write & w_hs;
assign int_edges_be1             = WSTRB << (waddr[2:2] * 4);
assign int_edges_d1              = {2{WDATA}};
// int_level_counts_read
always @(posedge ACLK) begin
    if (ARESET)
        int_level_counts_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_LEVEL_COUNTS_BASE && raddr <= ADDR_LEVEL_COUNTS_HIGH)
            int_level_counts_read <= 1'b1;
        else
            int_level_counts_read <= 1'b0;
    end
end

// int_level_counts_write
always @(posedge ACLK) begin
    if (ARESET)
        int_level_counts_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_LEVEL_COUNTS_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_LEVEL_COUNTS_HIGH)
            int_level_counts_write <= 1'b1;
        else if (w_hs)
            int_level_counts_write <= 1'b0;
    end
end

// int_level_counts_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_level_counts_shift <= raddr[2:2];
    end
end

// int_level_read
always @(posedge ACLK) begin
    if (ARESET)
        int_level_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_LEVEL_BASE && raddr <= ADDR_LEVEL_HIGH)
            int_level_read <= 1'b1;
        else
            int_level_read <= 1'b0;
    end
end

// int_level_write
always @(posedge ACLK) begin
    if (ARESET)
        int_level_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_LEVEL_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_LEVEL_HIGH)
            int_level_write <= 1'b1;
        else if (w_hs)
            int_level_write <= 1'b0;
    end
end

// int_level_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (level_ce0)
            int_level_shift <= level_address0[1:0];
    end
end

// int_nodes_read
always @(posedge ACLK) begin
    if (ARESET)
        int_nodes_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_NODES_BASE && raddr <= ADDR_NODES_HIGH)
            int_nodes_read <= 1'b1;
        else
            int_nodes_read <= 1'b0;
    end
end

// int_nodes_write
always @(posedge ACLK) begin
    if (ARESET)
        int_nodes_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_NODES_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_NODES_HIGH)
            int_nodes_write <= 1'b1;
        else if (w_hs)
            int_nodes_write <= 1'b0;
    end
end

// int_nodes_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_nodes_shift <= raddr[3:2];
    end
end

// int_edges_read
always @(posedge ACLK) begin
    if (ARESET)
        int_edges_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_EDGES_BASE && raddr <= ADDR_EDGES_HIGH)
            int_edges_read <= 1'b1;
        else
            int_edges_read <= 1'b0;
    end
end

// int_edges_write
always @(posedge ACLK) begin
    if (ARESET)
        int_edges_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_EDGES_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_EDGES_HIGH)
            int_edges_write <= 1'b1;
        else if (w_hs)
            int_edges_write <= 1'b0;
    end
end

// int_edges_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs)
            int_edges_shift <= raddr[2:2];
    end
end


endmodule


`timescale 1ns/1ps

module bfs_BUS_A_s_axi_ram
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

