// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSTENCIL_H
#define XSTENCIL_H

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
#include "xstencil_hw.h"

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
} XStencil_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XStencil;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XStencil_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XStencil_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XStencil_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XStencil_ReadReg(BaseAddress, RegOffset) \
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
int XStencil_Initialize(XStencil *InstancePtr, u16 DeviceId);
XStencil_Config* XStencil_LookupConfig(u16 DeviceId);
int XStencil_CfgInitialize(XStencil *InstancePtr, XStencil_Config *ConfigPtr);
#else
int XStencil_Initialize(XStencil *InstancePtr, const char* InstanceName);
int XStencil_Release(XStencil *InstancePtr);
#endif

void XStencil_Start(XStencil *InstancePtr);
u32 XStencil_IsDone(XStencil *InstancePtr);
u32 XStencil_IsIdle(XStencil *InstancePtr);
u32 XStencil_IsReady(XStencil *InstancePtr);
void XStencil_EnableAutoRestart(XStencil *InstancePtr);
void XStencil_DisableAutoRestart(XStencil *InstancePtr);

u32 XStencil_Get_filter_BaseAddress(XStencil *InstancePtr);
u32 XStencil_Get_filter_HighAddress(XStencil *InstancePtr);
u32 XStencil_Get_filter_TotalBytes(XStencil *InstancePtr);
u32 XStencil_Get_filter_BitWidth(XStencil *InstancePtr);
u32 XStencil_Get_filter_Depth(XStencil *InstancePtr);
u32 XStencil_Write_filter_Words(XStencil *InstancePtr, int offset, word_type *data, int length);
u32 XStencil_Read_filter_Words(XStencil *InstancePtr, int offset, word_type *data, int length);
u32 XStencil_Write_filter_Bytes(XStencil *InstancePtr, int offset, char *data, int length);
u32 XStencil_Read_filter_Bytes(XStencil *InstancePtr, int offset, char *data, int length);
u32 XStencil_Get_orig_BaseAddress(XStencil *InstancePtr);
u32 XStencil_Get_orig_HighAddress(XStencil *InstancePtr);
u32 XStencil_Get_orig_TotalBytes(XStencil *InstancePtr);
u32 XStencil_Get_orig_BitWidth(XStencil *InstancePtr);
u32 XStencil_Get_orig_Depth(XStencil *InstancePtr);
u32 XStencil_Write_orig_Words(XStencil *InstancePtr, int offset, word_type *data, int length);
u32 XStencil_Read_orig_Words(XStencil *InstancePtr, int offset, word_type *data, int length);
u32 XStencil_Write_orig_Bytes(XStencil *InstancePtr, int offset, char *data, int length);
u32 XStencil_Read_orig_Bytes(XStencil *InstancePtr, int offset, char *data, int length);
u32 XStencil_Get_sol_BaseAddress(XStencil *InstancePtr);
u32 XStencil_Get_sol_HighAddress(XStencil *InstancePtr);
u32 XStencil_Get_sol_TotalBytes(XStencil *InstancePtr);
u32 XStencil_Get_sol_BitWidth(XStencil *InstancePtr);
u32 XStencil_Get_sol_Depth(XStencil *InstancePtr);
u32 XStencil_Write_sol_Words(XStencil *InstancePtr, int offset, word_type *data, int length);
u32 XStencil_Read_sol_Words(XStencil *InstancePtr, int offset, word_type *data, int length);
u32 XStencil_Write_sol_Bytes(XStencil *InstancePtr, int offset, char *data, int length);
u32 XStencil_Read_sol_Bytes(XStencil *InstancePtr, int offset, char *data, int length);

void XStencil_InterruptGlobalEnable(XStencil *InstancePtr);
void XStencil_InterruptGlobalDisable(XStencil *InstancePtr);
void XStencil_InterruptEnable(XStencil *InstancePtr, u32 Mask);
void XStencil_InterruptDisable(XStencil *InstancePtr, u32 Mask);
void XStencil_InterruptClear(XStencil *InstancePtr, u32 Mask);
u32 XStencil_InterruptGetEnabled(XStencil *InstancePtr);
u32 XStencil_InterruptGetStatus(XStencil *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
