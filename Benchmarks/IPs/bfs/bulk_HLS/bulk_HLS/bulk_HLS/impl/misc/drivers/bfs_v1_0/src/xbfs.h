// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XBFS_H
#define XBFS_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xbfs_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Bus_a_BaseAddress;
} XBfs_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XBfs;

typedef u32 word_type;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
} XBfs_Nodes;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XBfs_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XBfs_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XBfs_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XBfs_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XBfs_Initialize(XBfs *InstancePtr, u16 DeviceId);
XBfs_Config* XBfs_LookupConfig(u16 DeviceId);
int XBfs_CfgInitialize(XBfs *InstancePtr, XBfs_Config *ConfigPtr);
#else
int XBfs_Initialize(XBfs *InstancePtr, const char* InstanceName);
int XBfs_Release(XBfs *InstancePtr);
#endif

void XBfs_Start(XBfs *InstancePtr);
u32 XBfs_IsDone(XBfs *InstancePtr);
u32 XBfs_IsIdle(XBfs *InstancePtr);
u32 XBfs_IsReady(XBfs *InstancePtr);
void XBfs_EnableAutoRestart(XBfs *InstancePtr);
void XBfs_DisableAutoRestart(XBfs *InstancePtr);

void XBfs_Set_starting_node(XBfs *InstancePtr, u64 Data);
u64 XBfs_Get_starting_node(XBfs *InstancePtr);
u32 XBfs_Get_level_counts_BaseAddress(XBfs *InstancePtr);
u32 XBfs_Get_level_counts_HighAddress(XBfs *InstancePtr);
u32 XBfs_Get_level_counts_TotalBytes(XBfs *InstancePtr);
u32 XBfs_Get_level_counts_BitWidth(XBfs *InstancePtr);
u32 XBfs_Get_level_counts_Depth(XBfs *InstancePtr);
u32 XBfs_Write_level_counts_Words(XBfs *InstancePtr, int offset, word_type *data, int length);
u32 XBfs_Read_level_counts_Words(XBfs *InstancePtr, int offset, word_type *data, int length);
u32 XBfs_Write_level_counts_Bytes(XBfs *InstancePtr, int offset, char *data, int length);
u32 XBfs_Read_level_counts_Bytes(XBfs *InstancePtr, int offset, char *data, int length);
u32 XBfs_Get_level_BaseAddress(XBfs *InstancePtr);
u32 XBfs_Get_level_HighAddress(XBfs *InstancePtr);
u32 XBfs_Get_level_TotalBytes(XBfs *InstancePtr);
u32 XBfs_Get_level_BitWidth(XBfs *InstancePtr);
u32 XBfs_Get_level_Depth(XBfs *InstancePtr);
u32 XBfs_Write_level_Words(XBfs *InstancePtr, int offset, word_type *data, int length);
u32 XBfs_Read_level_Words(XBfs *InstancePtr, int offset, word_type *data, int length);
u32 XBfs_Write_level_Bytes(XBfs *InstancePtr, int offset, char *data, int length);
u32 XBfs_Read_level_Bytes(XBfs *InstancePtr, int offset, char *data, int length);
u32 XBfs_Get_nodes_BaseAddress(XBfs *InstancePtr);
u32 XBfs_Get_nodes_HighAddress(XBfs *InstancePtr);
u32 XBfs_Get_nodes_TotalBytes(XBfs *InstancePtr);
u32 XBfs_Get_nodes_BitWidth(XBfs *InstancePtr);
u32 XBfs_Get_nodes_Depth(XBfs *InstancePtr);
u32 XBfs_Write_nodes_Words(XBfs *InstancePtr, int offset, word_type *data, int length);
u32 XBfs_Read_nodes_Words(XBfs *InstancePtr, int offset, word_type *data, int length);
u32 XBfs_Write_nodes_Bytes(XBfs *InstancePtr, int offset, char *data, int length);
u32 XBfs_Read_nodes_Bytes(XBfs *InstancePtr, int offset, char *data, int length);
u32 XBfs_Get_edges_BaseAddress(XBfs *InstancePtr);
u32 XBfs_Get_edges_HighAddress(XBfs *InstancePtr);
u32 XBfs_Get_edges_TotalBytes(XBfs *InstancePtr);
u32 XBfs_Get_edges_BitWidth(XBfs *InstancePtr);
u32 XBfs_Get_edges_Depth(XBfs *InstancePtr);
u32 XBfs_Write_edges_Words(XBfs *InstancePtr, int offset, word_type *data, int length);
u32 XBfs_Read_edges_Words(XBfs *InstancePtr, int offset, word_type *data, int length);
u32 XBfs_Write_edges_Bytes(XBfs *InstancePtr, int offset, char *data, int length);
u32 XBfs_Read_edges_Bytes(XBfs *InstancePtr, int offset, char *data, int length);

void XBfs_InterruptGlobalEnable(XBfs *InstancePtr);
void XBfs_InterruptGlobalDisable(XBfs *InstancePtr);
void XBfs_InterruptEnable(XBfs *InstancePtr, u32 Mask);
void XBfs_InterruptDisable(XBfs *InstancePtr, u32 Mask);
void XBfs_InterruptClear(XBfs *InstancePtr, u32 Mask);
u32 XBfs_InterruptGetEnabled(XBfs *InstancePtr);
u32 XBfs_InterruptGetStatus(XBfs *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
