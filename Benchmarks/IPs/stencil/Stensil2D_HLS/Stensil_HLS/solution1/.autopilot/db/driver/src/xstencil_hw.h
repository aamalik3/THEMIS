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

#define XSTENCIL_BUS_A_ADDR_AP_CTRL     0x00000
#define XSTENCIL_BUS_A_ADDR_GIE         0x00004
#define XSTENCIL_BUS_A_ADDR_IER         0x00008
#define XSTENCIL_BUS_A_ADDR_ISR         0x0000c
#define XSTENCIL_BUS_A_ADDR_FILTER_BASE 0x00040
#define XSTENCIL_BUS_A_ADDR_FILTER_HIGH 0x0007f
#define XSTENCIL_BUS_A_WIDTH_FILTER     32
#define XSTENCIL_BUS_A_DEPTH_FILTER     9
#define XSTENCIL_BUS_A_ADDR_ORIG_BASE   0x08000
#define XSTENCIL_BUS_A_ADDR_ORIG_HIGH   0x0ffff
#define XSTENCIL_BUS_A_WIDTH_ORIG       32
#define XSTENCIL_BUS_A_DEPTH_ORIG       8192
#define XSTENCIL_BUS_A_ADDR_SOL_BASE    0x10000
#define XSTENCIL_BUS_A_ADDR_SOL_HIGH    0x17fff
#define XSTENCIL_BUS_A_WIDTH_SOL        32
#define XSTENCIL_BUS_A_DEPTH_SOL        8192

