// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// BUS_A
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x20 ~
// 0x3f : Memory 'k' (32 * 8b)
//        Word n : bit [ 7: 0] - k[4n]
//                 bit [15: 8] - k[4n+1]
//                 bit [23:16] - k[4n+2]
//                 bit [31:24] - k[4n+3]
// 0x40 ~
// 0x4f : Memory 'buf_r' (16 * 8b)
//        Word n : bit [ 7: 0] - buf_r[4n]
//                 bit [15: 8] - buf_r[4n+1]
//                 bit [23:16] - buf_r[4n+2]
//                 bit [31:24] - buf_r[4n+3]
// 0x80 ~
// 0xff : Memory 'ctx' (96 * 8b)
//        Word n : bit [ 7: 0] - ctx[4n]
//                 bit [15: 8] - ctx[4n+1]
//                 bit [23:16] - ctx[4n+2]
//                 bit [31:24] - ctx[4n+3]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_AP_CTRL    0x00
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_GIE        0x04
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_IER        0x08
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_ISR        0x0c
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE     0x20
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_HIGH     0x3f
#define XAES256_ENCRYPT_ECB_BUS_A_WIDTH_K         8
#define XAES256_ENCRYPT_ECB_BUS_A_DEPTH_K         32
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE 0x40
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_HIGH 0x4f
#define XAES256_ENCRYPT_ECB_BUS_A_WIDTH_BUF_R     8
#define XAES256_ENCRYPT_ECB_BUS_A_DEPTH_BUF_R     16
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE   0x80
#define XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_HIGH   0xff
#define XAES256_ENCRYPT_ECB_BUS_A_WIDTH_CTX       8
#define XAES256_ENCRYPT_ECB_BUS_A_DEPTH_CTX       96

