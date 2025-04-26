// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// BUS_A
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

#define XBFS_BUS_A_ADDR_AP_CTRL            0x0000
#define XBFS_BUS_A_ADDR_GIE                0x0004
#define XBFS_BUS_A_ADDR_IER                0x0008
#define XBFS_BUS_A_ADDR_ISR                0x000c
#define XBFS_BUS_A_ADDR_STARTING_NODE_DATA 0x0010
#define XBFS_BUS_A_BITS_STARTING_NODE_DATA 64
#define XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE  0x0080
#define XBFS_BUS_A_ADDR_LEVEL_COUNTS_HIGH  0x00ff
#define XBFS_BUS_A_WIDTH_LEVEL_COUNTS      64
#define XBFS_BUS_A_DEPTH_LEVEL_COUNTS      10
#define XBFS_BUS_A_ADDR_LEVEL_BASE         0x0100
#define XBFS_BUS_A_ADDR_LEVEL_HIGH         0x01ff
#define XBFS_BUS_A_WIDTH_LEVEL             8
#define XBFS_BUS_A_DEPTH_LEVEL             256
#define XBFS_BUS_A_ADDR_NODES_BASE         0x1000
#define XBFS_BUS_A_ADDR_NODES_HIGH         0x1fff
#define XBFS_BUS_A_WIDTH_NODES             128
#define XBFS_BUS_A_DEPTH_NODES             256
#define XBFS_BUS_A_ADDR_EDGES_BASE         0x8000
#define XBFS_BUS_A_ADDR_EDGES_HIGH         0xffff
#define XBFS_BUS_A_WIDTH_EDGES             64
#define XBFS_BUS_A_DEPTH_EDGES             4096

