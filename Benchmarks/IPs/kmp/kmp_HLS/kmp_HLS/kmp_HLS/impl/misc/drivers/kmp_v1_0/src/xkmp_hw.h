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
// 0x0010 : Data signal of ap_return
//          bit 31~0 - ap_return[31:0] (Read)
// 0x0030 : Data signal of n_matches
//          bit 31~0 - n_matches[31:0] (Read)
// 0x0034 : Control signal of n_matches
//          bit 0  - n_matches_ap_vld (Read/COR)
//          others - reserved
// 0x0018 ~
// 0x001f : Memory 'pattern' (4 * 8b)
//          Word n : bit [ 7: 0] - pattern[4n]
//                   bit [15: 8] - pattern[4n+1]
//                   bit [23:16] - pattern[4n+2]
//                   bit [31:24] - pattern[4n+3]
// 0x0020 ~
// 0x002f : Memory 'kmpNext' (4 * 32b)
//          Word n : bit [31:0] - kmpNext[n]
// 0x8000 ~
// 0xffff : Memory 'input_r' (32411 * 8b)
//          Word n : bit [ 7: 0] - input_r[4n]
//                   bit [15: 8] - input_r[4n+1]
//                   bit [23:16] - input_r[4n+2]
//                   bit [31:24] - input_r[4n+3]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XKMP_BUS_A_ADDR_AP_CTRL        0x0000
#define XKMP_BUS_A_ADDR_GIE            0x0004
#define XKMP_BUS_A_ADDR_IER            0x0008
#define XKMP_BUS_A_ADDR_ISR            0x000c
#define XKMP_BUS_A_ADDR_AP_RETURN      0x0010
#define XKMP_BUS_A_BITS_AP_RETURN      32
#define XKMP_BUS_A_ADDR_N_MATCHES_DATA 0x0030
#define XKMP_BUS_A_BITS_N_MATCHES_DATA 32
#define XKMP_BUS_A_ADDR_N_MATCHES_CTRL 0x0034
#define XKMP_BUS_A_ADDR_PATTERN_BASE   0x0018
#define XKMP_BUS_A_ADDR_PATTERN_HIGH   0x001f
#define XKMP_BUS_A_WIDTH_PATTERN       8
#define XKMP_BUS_A_DEPTH_PATTERN       4
#define XKMP_BUS_A_ADDR_KMPNEXT_BASE   0x0020
#define XKMP_BUS_A_ADDR_KMPNEXT_HIGH   0x002f
#define XKMP_BUS_A_WIDTH_KMPNEXT       32
#define XKMP_BUS_A_DEPTH_KMPNEXT       4
#define XKMP_BUS_A_ADDR_INPUT_R_BASE   0x8000
#define XKMP_BUS_A_ADDR_INPUT_R_HIGH   0xffff
#define XKMP_BUS_A_WIDTH_INPUT_R       8
#define XKMP_BUS_A_DEPTH_INPUT_R       32411

