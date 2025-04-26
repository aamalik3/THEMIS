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
// 0x2000 ~
// 0x3fff : Memory 'a' (2048 * 32b)
//          Word n : bit [31:0] - a[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XMS_MERGESORT_BUS_A_ADDR_AP_CTRL 0x0000
#define XMS_MERGESORT_BUS_A_ADDR_GIE     0x0004
#define XMS_MERGESORT_BUS_A_ADDR_IER     0x0008
#define XMS_MERGESORT_BUS_A_ADDR_ISR     0x000c
#define XMS_MERGESORT_BUS_A_ADDR_A_BASE  0x2000
#define XMS_MERGESORT_BUS_A_ADDR_A_HIGH  0x3fff
#define XMS_MERGESORT_BUS_A_WIDTH_A      32
#define XMS_MERGESORT_BUS_A_DEPTH_A      2048

