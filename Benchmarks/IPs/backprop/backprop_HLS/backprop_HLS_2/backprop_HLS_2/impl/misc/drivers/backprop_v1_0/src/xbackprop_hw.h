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
// 0x00020 ~
// 0x0003f : Memory 'biases3' (3 * 64b)
//           Word 2n   : bit [31:0] - biases3[n][31: 0]
//           Word 2n+1 : bit [31:0] - biases3[n][63:32]
// 0x00200 ~
// 0x003ff : Memory 'biases1' (64 * 64b)
//           Word 2n   : bit [31:0] - biases1[n][31: 0]
//           Word 2n+1 : bit [31:0] - biases1[n][63:32]
// 0x00400 ~
// 0x005ff : Memory 'biases2' (64 * 64b)
//           Word 2n   : bit [31:0] - biases2[n][31: 0]
//           Word 2n+1 : bit [31:0] - biases2[n][63:32]
// 0x00800 ~
// 0x00fff : Memory 'weights3' (192 * 64b)
//           Word 2n   : bit [31:0] - weights3[n][31: 0]
//           Word 2n+1 : bit [31:0] - weights3[n][63:32]
// 0x01000 ~
// 0x01fff : Memory 'training_targets' (489 * 64b)
//           Word 2n   : bit [31:0] - training_targets[n][31: 0]
//           Word 2n+1 : bit [31:0] - training_targets[n][63:32]
// 0x02000 ~
// 0x03fff : Memory 'weights1' (832 * 64b)
//           Word 2n   : bit [31:0] - weights1[n][31: 0]
//           Word 2n+1 : bit [31:0] - weights1[n][63:32]
// 0x08000 ~
// 0x0ffff : Memory 'weights2' (4096 * 64b)
//           Word 2n   : bit [31:0] - weights2[n][31: 0]
//           Word 2n+1 : bit [31:0] - weights2[n][63:32]
// 0x10000 ~
// 0x17fff : Memory 'training_data' (2119 * 64b)
//           Word 2n   : bit [31:0] - training_data[n][31: 0]
//           Word 2n+1 : bit [31:0] - training_data[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XBACKPROP_BUS_A_ADDR_AP_CTRL               0x00000
#define XBACKPROP_BUS_A_ADDR_GIE                   0x00004
#define XBACKPROP_BUS_A_ADDR_IER                   0x00008
#define XBACKPROP_BUS_A_ADDR_ISR                   0x0000c
#define XBACKPROP_BUS_A_ADDR_BIASES3_BASE          0x00020
#define XBACKPROP_BUS_A_ADDR_BIASES3_HIGH          0x0003f
#define XBACKPROP_BUS_A_WIDTH_BIASES3              64
#define XBACKPROP_BUS_A_DEPTH_BIASES3              3
#define XBACKPROP_BUS_A_ADDR_BIASES1_BASE          0x00200
#define XBACKPROP_BUS_A_ADDR_BIASES1_HIGH          0x003ff
#define XBACKPROP_BUS_A_WIDTH_BIASES1              64
#define XBACKPROP_BUS_A_DEPTH_BIASES1              64
#define XBACKPROP_BUS_A_ADDR_BIASES2_BASE          0x00400
#define XBACKPROP_BUS_A_ADDR_BIASES2_HIGH          0x005ff
#define XBACKPROP_BUS_A_WIDTH_BIASES2              64
#define XBACKPROP_BUS_A_DEPTH_BIASES2              64
#define XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE         0x00800
#define XBACKPROP_BUS_A_ADDR_WEIGHTS3_HIGH         0x00fff
#define XBACKPROP_BUS_A_WIDTH_WEIGHTS3             64
#define XBACKPROP_BUS_A_DEPTH_WEIGHTS3             192
#define XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE 0x01000
#define XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_HIGH 0x01fff
#define XBACKPROP_BUS_A_WIDTH_TRAINING_TARGETS     64
#define XBACKPROP_BUS_A_DEPTH_TRAINING_TARGETS     489
#define XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE         0x02000
#define XBACKPROP_BUS_A_ADDR_WEIGHTS1_HIGH         0x03fff
#define XBACKPROP_BUS_A_WIDTH_WEIGHTS1             64
#define XBACKPROP_BUS_A_DEPTH_WEIGHTS1             832
#define XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE         0x08000
#define XBACKPROP_BUS_A_ADDR_WEIGHTS2_HIGH         0x0ffff
#define XBACKPROP_BUS_A_WIDTH_WEIGHTS2             64
#define XBACKPROP_BUS_A_DEPTH_WEIGHTS2             4096
#define XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE    0x10000
#define XBACKPROP_BUS_A_ADDR_TRAINING_DATA_HIGH    0x17fff
#define XBACKPROP_BUS_A_WIDTH_TRAINING_DATA        64
#define XBACKPROP_BUS_A_DEPTH_TRAINING_DATA        2119

