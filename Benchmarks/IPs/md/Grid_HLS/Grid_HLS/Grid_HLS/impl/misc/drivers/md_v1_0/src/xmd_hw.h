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
// 0x00100 ~
// 0x001ff : Memory 'n_points' (64 * 32b)
//           Word n : bit [31:0] - n_points[n]
// 0x08000 ~
// 0x0ffff : Memory 'force_r' (640 * 192b)
//           Word 8n   : bit [31:0] - force_r[n][31: 0]
//           Word 8n+1 : bit [31:0] - force_r[n][63:32]
//           Word 8n+2 : bit [31:0] - force_r[n][95:64]
//           Word 8n+3 : bit [31:0] - force_r[n][127:96]
//           Word 8n+4 : bit [31:0] - force_r[n][159:128]
//           Word 8n+5 : bit [31:0] - force_r[n][191:160]
//           Word 8n+6 : bit [31:0] - reserved
//           Word 8n+7 : bit [31:0] - reserved
// 0x10000 ~
// 0x17fff : Memory 'position' (640 * 192b)
//           Word 8n   : bit [31:0] - position[n][31: 0]
//           Word 8n+1 : bit [31:0] - position[n][63:32]
//           Word 8n+2 : bit [31:0] - position[n][95:64]
//           Word 8n+3 : bit [31:0] - position[n][127:96]
//           Word 8n+4 : bit [31:0] - position[n][159:128]
//           Word 8n+5 : bit [31:0] - position[n][191:160]
//           Word 8n+6 : bit [31:0] - reserved
//           Word 8n+7 : bit [31:0] - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XMD_BUS_A_ADDR_AP_CTRL       0x00000
#define XMD_BUS_A_ADDR_GIE           0x00004
#define XMD_BUS_A_ADDR_IER           0x00008
#define XMD_BUS_A_ADDR_ISR           0x0000c
#define XMD_BUS_A_ADDR_N_POINTS_BASE 0x00100
#define XMD_BUS_A_ADDR_N_POINTS_HIGH 0x001ff
#define XMD_BUS_A_WIDTH_N_POINTS     32
#define XMD_BUS_A_DEPTH_N_POINTS     64
#define XMD_BUS_A_ADDR_FORCE_R_BASE  0x08000
#define XMD_BUS_A_ADDR_FORCE_R_HIGH  0x0ffff
#define XMD_BUS_A_WIDTH_FORCE_R      192
#define XMD_BUS_A_DEPTH_FORCE_R      640
#define XMD_BUS_A_ADDR_POSITION_BASE 0x10000
#define XMD_BUS_A_ADDR_POSITION_HIGH 0x17fff
#define XMD_BUS_A_WIDTH_POSITION     192
#define XMD_BUS_A_DEPTH_POSITION     640

