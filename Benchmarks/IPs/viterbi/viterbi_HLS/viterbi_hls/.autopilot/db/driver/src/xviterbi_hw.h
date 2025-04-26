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
// 0x00010 : Data signal of ap_return
//           bit 31~0 - ap_return[31:0] (Read)
// 0x00100 ~
// 0x001ff : Memory 'obs' (140 * 8b)
//           Word n : bit [ 7: 0] - obs[4n]
//                    bit [15: 8] - obs[4n+1]
//                    bit [23:16] - obs[4n+2]
//                    bit [31:24] - obs[4n+3]
// 0x00200 ~
// 0x003ff : Memory 'init' (64 * 64b)
//           Word 2n   : bit [31:0] - init[n][31: 0]
//           Word 2n+1 : bit [31:0] - init[n][63:32]
// 0x00400 ~
// 0x004ff : Memory 'path' (140 * 8b)
//           Word n : bit [ 7: 0] - path[4n]
//                    bit [15: 8] - path[4n+1]
//                    bit [23:16] - path[4n+2]
//                    bit [31:24] - path[4n+3]
// 0x08000 ~
// 0x0ffff : Memory 'transition' (4096 * 64b)
//           Word 2n   : bit [31:0] - transition[n][31: 0]
//           Word 2n+1 : bit [31:0] - transition[n][63:32]
// 0x10000 ~
// 0x17fff : Memory 'emission' (4096 * 64b)
//           Word 2n   : bit [31:0] - emission[n][31: 0]
//           Word 2n+1 : bit [31:0] - emission[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XVITERBI_BUS_A_ADDR_AP_CTRL         0x00000
#define XVITERBI_BUS_A_ADDR_GIE             0x00004
#define XVITERBI_BUS_A_ADDR_IER             0x00008
#define XVITERBI_BUS_A_ADDR_ISR             0x0000c
#define XVITERBI_BUS_A_ADDR_AP_RETURN       0x00010
#define XVITERBI_BUS_A_BITS_AP_RETURN       32
#define XVITERBI_BUS_A_ADDR_OBS_BASE        0x00100
#define XVITERBI_BUS_A_ADDR_OBS_HIGH        0x001ff
#define XVITERBI_BUS_A_WIDTH_OBS            8
#define XVITERBI_BUS_A_DEPTH_OBS            140
#define XVITERBI_BUS_A_ADDR_INIT_BASE       0x00200
#define XVITERBI_BUS_A_ADDR_INIT_HIGH       0x003ff
#define XVITERBI_BUS_A_WIDTH_INIT           64
#define XVITERBI_BUS_A_DEPTH_INIT           64
#define XVITERBI_BUS_A_ADDR_PATH_BASE       0x00400
#define XVITERBI_BUS_A_ADDR_PATH_HIGH       0x004ff
#define XVITERBI_BUS_A_WIDTH_PATH           8
#define XVITERBI_BUS_A_DEPTH_PATH           140
#define XVITERBI_BUS_A_ADDR_TRANSITION_BASE 0x08000
#define XVITERBI_BUS_A_ADDR_TRANSITION_HIGH 0x0ffff
#define XVITERBI_BUS_A_WIDTH_TRANSITION     64
#define XVITERBI_BUS_A_DEPTH_TRANSITION     4096
#define XVITERBI_BUS_A_ADDR_EMISSION_BASE   0x10000
#define XVITERBI_BUS_A_ADDR_EMISSION_HIGH   0x17fff
#define XVITERBI_BUS_A_WIDTH_EMISSION       64
#define XVITERBI_BUS_A_DEPTH_EMISSION       4096

