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
// 0x1000 ~
// 0x1fff : Memory 'real_twid' (512 * 64b)
//          Word 2n   : bit [31:0] - real_twid[n][31: 0]
//          Word 2n+1 : bit [31:0] - real_twid[n][63:32]
// 0x2000 ~
// 0x3fff : Memory 'real_r' (1024 * 64b)
//          Word 2n   : bit [31:0] - real_r[n][31: 0]
//          Word 2n+1 : bit [31:0] - real_r[n][63:32]
// 0x4000 ~
// 0x5fff : Memory 'img' (1024 * 64b)
//          Word 2n   : bit [31:0] - img[n][31: 0]
//          Word 2n+1 : bit [31:0] - img[n][63:32]
// 0x6000 ~
// 0x6fff : Memory 'img_twid' (512 * 64b)
//          Word 2n   : bit [31:0] - img_twid[n][31: 0]
//          Word 2n+1 : bit [31:0] - img_twid[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XFFT_BUS_A_ADDR_AP_CTRL        0x0000
#define XFFT_BUS_A_ADDR_GIE            0x0004
#define XFFT_BUS_A_ADDR_IER            0x0008
#define XFFT_BUS_A_ADDR_ISR            0x000c
#define XFFT_BUS_A_ADDR_REAL_TWID_BASE 0x1000
#define XFFT_BUS_A_ADDR_REAL_TWID_HIGH 0x1fff
#define XFFT_BUS_A_WIDTH_REAL_TWID     64
#define XFFT_BUS_A_DEPTH_REAL_TWID     512
#define XFFT_BUS_A_ADDR_REAL_R_BASE    0x2000
#define XFFT_BUS_A_ADDR_REAL_R_HIGH    0x3fff
#define XFFT_BUS_A_WIDTH_REAL_R        64
#define XFFT_BUS_A_DEPTH_REAL_R        1024
#define XFFT_BUS_A_ADDR_IMG_BASE       0x4000
#define XFFT_BUS_A_ADDR_IMG_HIGH       0x5fff
#define XFFT_BUS_A_WIDTH_IMG           64
#define XFFT_BUS_A_DEPTH_IMG           1024
#define XFFT_BUS_A_ADDR_IMG_TWID_BASE  0x6000
#define XFFT_BUS_A_ADDR_IMG_TWID_HIGH  0x6fff
#define XFFT_BUS_A_WIDTH_IMG_TWID      64
#define XFFT_BUS_A_DEPTH_IMG_TWID      512

