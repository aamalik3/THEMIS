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

#define XSPMV_BUS_A_ADDR_AP_CTRL            0x0000
#define XSPMV_BUS_A_ADDR_GIE                0x0004
#define XSPMV_BUS_A_ADDR_IER                0x0008
#define XSPMV_BUS_A_ADDR_ISR                0x000c
#define XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE 0x0800
#define XSPMV_BUS_A_ADDR_ROWDELIMITERS_HIGH 0x0fff
#define XSPMV_BUS_A_WIDTH_ROWDELIMITERS     32
#define XSPMV_BUS_A_DEPTH_ROWDELIMITERS     495
#define XSPMV_BUS_A_ADDR_VEC_BASE           0x1000
#define XSPMV_BUS_A_ADDR_VEC_HIGH           0x1fff
#define XSPMV_BUS_A_WIDTH_VEC               64
#define XSPMV_BUS_A_DEPTH_VEC               494
#define XSPMV_BUS_A_ADDR_COLS_BASE          0x2000
#define XSPMV_BUS_A_ADDR_COLS_HIGH          0x3fff
#define XSPMV_BUS_A_WIDTH_COLS              32
#define XSPMV_BUS_A_DEPTH_COLS              1666
#define XSPMV_BUS_A_ADDR_VAL_R_BASE         0x4000
#define XSPMV_BUS_A_ADDR_VAL_R_HIGH         0x7fff
#define XSPMV_BUS_A_WIDTH_VAL_R             64
#define XSPMV_BUS_A_DEPTH_VAL_R             1666
#define XSPMV_BUS_A_ADDR_OUT_R_BASE         0x8000
#define XSPMV_BUS_A_ADDR_OUT_R_HIGH         0x8fff
#define XSPMV_BUS_A_WIDTH_OUT_R             64
#define XSPMV_BUS_A_DEPTH_OUT_R             494

