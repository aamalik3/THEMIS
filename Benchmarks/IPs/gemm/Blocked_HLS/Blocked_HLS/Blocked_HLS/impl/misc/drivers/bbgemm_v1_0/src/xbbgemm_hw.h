// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// BUS_A
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
// 0x08000 ~
// 0x0ffff : Memory 'm1' (4096 * 64b)
//           Word 2n   : bit [31:0] - m1[n][31: 0]
//           Word 2n+1 : bit [31:0] - m1[n][63:32]
// 0x10000 ~
// 0x17fff : Memory 'm2' (4096 * 64b)
//           Word 2n   : bit [31:0] - m2[n][31: 0]
//           Word 2n+1 : bit [31:0] - m2[n][63:32]
// 0x18000 ~
// 0x1ffff : Memory 'prod' (4096 * 64b)
//           Word 2n   : bit [31:0] - prod[n][31: 0]
//           Word 2n+1 : bit [31:0] - prod[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XBBGEMM_BUS_A_ADDR_AP_CTRL   0x00000
#define XBBGEMM_BUS_A_ADDR_GIE       0x00004
#define XBBGEMM_BUS_A_ADDR_IER       0x00008
#define XBBGEMM_BUS_A_ADDR_ISR       0x0000c
#define XBBGEMM_BUS_A_ADDR_M1_BASE   0x08000
#define XBBGEMM_BUS_A_ADDR_M1_HIGH   0x0ffff
#define XBBGEMM_BUS_A_WIDTH_M1       64
#define XBBGEMM_BUS_A_DEPTH_M1       4096
#define XBBGEMM_BUS_A_ADDR_M2_BASE   0x10000
#define XBBGEMM_BUS_A_ADDR_M2_HIGH   0x17fff
#define XBBGEMM_BUS_A_WIDTH_M2       64
#define XBBGEMM_BUS_A_DEPTH_M2       4096
#define XBBGEMM_BUS_A_ADDR_PROD_BASE 0x18000
#define XBBGEMM_BUS_A_ADDR_PROD_HIGH 0x1ffff
#define XBBGEMM_BUS_A_WIDTH_PROD     64
#define XBBGEMM_BUS_A_DEPTH_PROD     4096

