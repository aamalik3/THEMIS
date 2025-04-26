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
// 0x00080 ~
// 0x000ff : Memory 'SEQA' (128 * 8b)
//           Word n : bit [ 7: 0] - SEQA[4n]
//                    bit [15: 8] - SEQA[4n+1]
//                    bit [23:16] - SEQA[4n+2]
//                    bit [31:24] - SEQA[4n+3]
// 0x00100 ~
// 0x0017f : Memory 'SEQB' (128 * 8b)
//           Word n : bit [ 7: 0] - SEQB[4n]
//                    bit [15: 8] - SEQB[4n+1]
//                    bit [23:16] - SEQB[4n+2]
//                    bit [31:24] - SEQB[4n+3]
// 0x00200 ~
// 0x002ff : Memory 'alignedA' (256 * 8b)
//           Word n : bit [ 7: 0] - alignedA[4n]
//                    bit [15: 8] - alignedA[4n+1]
//                    bit [23:16] - alignedA[4n+2]
//                    bit [31:24] - alignedA[4n+3]
// 0x00300 ~
// 0x003ff : Memory 'alignedB' (256 * 8b)
//           Word n : bit [ 7: 0] - alignedB[4n]
//                    bit [15: 8] - alignedB[4n+1]
//                    bit [23:16] - alignedB[4n+2]
//                    bit [31:24] - alignedB[4n+3]
// 0x08000 ~
// 0x0ffff : Memory 'ptr' (16641 * 8b)
//           Word n : bit [ 7: 0] - ptr[4n]
//                    bit [15: 8] - ptr[4n+1]
//                    bit [23:16] - ptr[4n+2]
//                    bit [31:24] - ptr[4n+3]
// 0x20000 ~
// 0x3ffff : Memory 'M' (16641 * 32b)
//           Word n : bit [31:0] - M[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XNEEDWUN_BUS_A_ADDR_AP_CTRL       0x00000
#define XNEEDWUN_BUS_A_ADDR_GIE           0x00004
#define XNEEDWUN_BUS_A_ADDR_IER           0x00008
#define XNEEDWUN_BUS_A_ADDR_ISR           0x0000c
#define XNEEDWUN_BUS_A_ADDR_SEQA_BASE     0x00080
#define XNEEDWUN_BUS_A_ADDR_SEQA_HIGH     0x000ff
#define XNEEDWUN_BUS_A_WIDTH_SEQA         8
#define XNEEDWUN_BUS_A_DEPTH_SEQA         128
#define XNEEDWUN_BUS_A_ADDR_SEQB_BASE     0x00100
#define XNEEDWUN_BUS_A_ADDR_SEQB_HIGH     0x0017f
#define XNEEDWUN_BUS_A_WIDTH_SEQB         8
#define XNEEDWUN_BUS_A_DEPTH_SEQB         128
#define XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE 0x00200
#define XNEEDWUN_BUS_A_ADDR_ALIGNEDA_HIGH 0x002ff
#define XNEEDWUN_BUS_A_WIDTH_ALIGNEDA     8
#define XNEEDWUN_BUS_A_DEPTH_ALIGNEDA     256
#define XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE 0x00300
#define XNEEDWUN_BUS_A_ADDR_ALIGNEDB_HIGH 0x003ff
#define XNEEDWUN_BUS_A_WIDTH_ALIGNEDB     8
#define XNEEDWUN_BUS_A_DEPTH_ALIGNEDB     256
#define XNEEDWUN_BUS_A_ADDR_PTR_BASE      0x08000
#define XNEEDWUN_BUS_A_ADDR_PTR_HIGH      0x0ffff
#define XNEEDWUN_BUS_A_WIDTH_PTR          8
#define XNEEDWUN_BUS_A_DEPTH_PTR          16641
#define XNEEDWUN_BUS_A_ADDR_M_BASE        0x20000
#define XNEEDWUN_BUS_A_ADDR_M_HIGH        0x3ffff
#define XNEEDWUN_BUS_A_WIDTH_M            32
#define XNEEDWUN_BUS_A_DEPTH_M            16641

