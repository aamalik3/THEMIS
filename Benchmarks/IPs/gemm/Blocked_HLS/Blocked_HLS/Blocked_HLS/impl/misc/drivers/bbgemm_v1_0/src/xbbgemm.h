// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XBBGEMM_H
#define XBBGEMM_H

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
#include "xbbgemm_hw.h"

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
} XBbgemm_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XBbgemm;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XBbgemm_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XBbgemm_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XBbgemm_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XBbgemm_ReadReg(BaseAddress, RegOffset) \
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
int XBbgemm_Initialize(XBbgemm *InstancePtr, u16 DeviceId);
XBbgemm_Config* XBbgemm_LookupConfig(u16 DeviceId);
int XBbgemm_CfgInitialize(XBbgemm *InstancePtr, XBbgemm_Config *ConfigPtr);
#else
int XBbgemm_Initialize(XBbgemm *InstancePtr, const char* InstanceName);
int XBbgemm_Release(XBbgemm *InstancePtr);
#endif

void XBbgemm_Start(XBbgemm *InstancePtr);
u32 XBbgemm_IsDone(XBbgemm *InstancePtr);
u32 XBbgemm_IsIdle(XBbgemm *InstancePtr);
u32 XBbgemm_IsReady(XBbgemm *InstancePtr);
void XBbgemm_EnableAutoRestart(XBbgemm *InstancePtr);
void XBbgemm_DisableAutoRestart(XBbgemm *InstancePtr);

u32 XBbgemm_Get_m1_BaseAddress(XBbgemm *InstancePtr);
u32 XBbgemm_Get_m1_HighAddress(XBbgemm *InstancePtr);
u32 XBbgemm_Get_m1_TotalBytes(XBbgemm *InstancePtr);
u32 XBbgemm_Get_m1_BitWidth(XBbgemm *InstancePtr);
u32 XBbgemm_Get_m1_Depth(XBbgemm *InstancePtr);
u32 XBbgemm_Write_m1_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length);
u32 XBbgemm_Read_m1_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length);
u32 XBbgemm_Write_m1_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length);
u32 XBbgemm_Read_m1_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length);
u32 XBbgemm_Get_m2_BaseAddress(XBbgemm *InstancePtr);
u32 XBbgemm_Get_m2_HighAddress(XBbgemm *InstancePtr);
u32 XBbgemm_Get_m2_TotalBytes(XBbgemm *InstancePtr);
u32 XBbgemm_Get_m2_BitWidth(XBbgemm *InstancePtr);
u32 XBbgemm_Get_m2_Depth(XBbgemm *InstancePtr);
u32 XBbgemm_Write_m2_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length);
u32 XBbgemm_Read_m2_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length);
u32 XBbgemm_Write_m2_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length);
u32 XBbgemm_Read_m2_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length);
u32 XBbgemm_Get_prod_BaseAddress(XBbgemm *InstancePtr);
u32 XBbgemm_Get_prod_HighAddress(XBbgemm *InstancePtr);
u32 XBbgemm_Get_prod_TotalBytes(XBbgemm *InstancePtr);
u32 XBbgemm_Get_prod_BitWidth(XBbgemm *InstancePtr);
u32 XBbgemm_Get_prod_Depth(XBbgemm *InstancePtr);
u32 XBbgemm_Write_prod_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length);
u32 XBbgemm_Read_prod_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length);
u32 XBbgemm_Write_prod_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length);
u32 XBbgemm_Read_prod_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length);

void XBbgemm_InterruptGlobalEnable(XBbgemm *InstancePtr);
void XBbgemm_InterruptGlobalDisable(XBbgemm *InstancePtr);
void XBbgemm_InterruptEnable(XBbgemm *InstancePtr, u32 Mask);
void XBbgemm_InterruptDisable(XBbgemm *InstancePtr, u32 Mask);
void XBbgemm_InterruptClear(XBbgemm *InstancePtr, u32 Mask);
u32 XBbgemm_InterruptGetEnabled(XBbgemm *InstancePtr);
u32 XBbgemm_InterruptGetStatus(XBbgemm *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
