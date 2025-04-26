// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XMS_MERGESORT_H
#define XMS_MERGESORT_H

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
#include "xms_mergesort_hw.h"

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
} XMs_mergesort_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XMs_mergesort;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMs_mergesort_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMs_mergesort_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMs_mergesort_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMs_mergesort_ReadReg(BaseAddress, RegOffset) \
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
int XMs_mergesort_Initialize(XMs_mergesort *InstancePtr, u16 DeviceId);
XMs_mergesort_Config* XMs_mergesort_LookupConfig(u16 DeviceId);
int XMs_mergesort_CfgInitialize(XMs_mergesort *InstancePtr, XMs_mergesort_Config *ConfigPtr);
#else
int XMs_mergesort_Initialize(XMs_mergesort *InstancePtr, const char* InstanceName);
int XMs_mergesort_Release(XMs_mergesort *InstancePtr);
#endif

void XMs_mergesort_Start(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_IsDone(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_IsIdle(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_IsReady(XMs_mergesort *InstancePtr);
void XMs_mergesort_EnableAutoRestart(XMs_mergesort *InstancePtr);
void XMs_mergesort_DisableAutoRestart(XMs_mergesort *InstancePtr);

u32 XMs_mergesort_Get_a_BaseAddress(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_Get_a_HighAddress(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_Get_a_TotalBytes(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_Get_a_BitWidth(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_Get_a_Depth(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_Write_a_Words(XMs_mergesort *InstancePtr, int offset, word_type *data, int length);
u32 XMs_mergesort_Read_a_Words(XMs_mergesort *InstancePtr, int offset, word_type *data, int length);
u32 XMs_mergesort_Write_a_Bytes(XMs_mergesort *InstancePtr, int offset, char *data, int length);
u32 XMs_mergesort_Read_a_Bytes(XMs_mergesort *InstancePtr, int offset, char *data, int length);

void XMs_mergesort_InterruptGlobalEnable(XMs_mergesort *InstancePtr);
void XMs_mergesort_InterruptGlobalDisable(XMs_mergesort *InstancePtr);
void XMs_mergesort_InterruptEnable(XMs_mergesort *InstancePtr, u32 Mask);
void XMs_mergesort_InterruptDisable(XMs_mergesort *InstancePtr, u32 Mask);
void XMs_mergesort_InterruptClear(XMs_mergesort *InstancePtr, u32 Mask);
u32 XMs_mergesort_InterruptGetEnabled(XMs_mergesort *InstancePtr);
u32 XMs_mergesort_InterruptGetStatus(XMs_mergesort *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
