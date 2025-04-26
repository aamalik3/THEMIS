// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XKMP_H
#define XKMP_H

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
#include "xkmp_hw.h"

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
} XKmp_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XKmp;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XKmp_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XKmp_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XKmp_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XKmp_ReadReg(BaseAddress, RegOffset) \
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
int XKmp_Initialize(XKmp *InstancePtr, u16 DeviceId);
XKmp_Config* XKmp_LookupConfig(u16 DeviceId);
int XKmp_CfgInitialize(XKmp *InstancePtr, XKmp_Config *ConfigPtr);
#else
int XKmp_Initialize(XKmp *InstancePtr, const char* InstanceName);
int XKmp_Release(XKmp *InstancePtr);
#endif

void XKmp_Start(XKmp *InstancePtr);
u32 XKmp_IsDone(XKmp *InstancePtr);
u32 XKmp_IsIdle(XKmp *InstancePtr);
u32 XKmp_IsReady(XKmp *InstancePtr);
void XKmp_EnableAutoRestart(XKmp *InstancePtr);
void XKmp_DisableAutoRestart(XKmp *InstancePtr);
u32 XKmp_Get_return(XKmp *InstancePtr);

u32 XKmp_Get_n_matches(XKmp *InstancePtr);
u32 XKmp_Get_n_matches_vld(XKmp *InstancePtr);
u32 XKmp_Get_pattern_BaseAddress(XKmp *InstancePtr);
u32 XKmp_Get_pattern_HighAddress(XKmp *InstancePtr);
u32 XKmp_Get_pattern_TotalBytes(XKmp *InstancePtr);
u32 XKmp_Get_pattern_BitWidth(XKmp *InstancePtr);
u32 XKmp_Get_pattern_Depth(XKmp *InstancePtr);
u32 XKmp_Write_pattern_Words(XKmp *InstancePtr, int offset, word_type *data, int length);
u32 XKmp_Read_pattern_Words(XKmp *InstancePtr, int offset, word_type *data, int length);
u32 XKmp_Write_pattern_Bytes(XKmp *InstancePtr, int offset, char *data, int length);
u32 XKmp_Read_pattern_Bytes(XKmp *InstancePtr, int offset, char *data, int length);
u32 XKmp_Get_kmpNext_BaseAddress(XKmp *InstancePtr);
u32 XKmp_Get_kmpNext_HighAddress(XKmp *InstancePtr);
u32 XKmp_Get_kmpNext_TotalBytes(XKmp *InstancePtr);
u32 XKmp_Get_kmpNext_BitWidth(XKmp *InstancePtr);
u32 XKmp_Get_kmpNext_Depth(XKmp *InstancePtr);
u32 XKmp_Write_kmpNext_Words(XKmp *InstancePtr, int offset, word_type *data, int length);
u32 XKmp_Read_kmpNext_Words(XKmp *InstancePtr, int offset, word_type *data, int length);
u32 XKmp_Write_kmpNext_Bytes(XKmp *InstancePtr, int offset, char *data, int length);
u32 XKmp_Read_kmpNext_Bytes(XKmp *InstancePtr, int offset, char *data, int length);
u32 XKmp_Get_input_r_BaseAddress(XKmp *InstancePtr);
u32 XKmp_Get_input_r_HighAddress(XKmp *InstancePtr);
u32 XKmp_Get_input_r_TotalBytes(XKmp *InstancePtr);
u32 XKmp_Get_input_r_BitWidth(XKmp *InstancePtr);
u32 XKmp_Get_input_r_Depth(XKmp *InstancePtr);
u32 XKmp_Write_input_r_Words(XKmp *InstancePtr, int offset, word_type *data, int length);
u32 XKmp_Read_input_r_Words(XKmp *InstancePtr, int offset, word_type *data, int length);
u32 XKmp_Write_input_r_Bytes(XKmp *InstancePtr, int offset, char *data, int length);
u32 XKmp_Read_input_r_Bytes(XKmp *InstancePtr, int offset, char *data, int length);

void XKmp_InterruptGlobalEnable(XKmp *InstancePtr);
void XKmp_InterruptGlobalDisable(XKmp *InstancePtr);
void XKmp_InterruptEnable(XKmp *InstancePtr, u32 Mask);
void XKmp_InterruptDisable(XKmp *InstancePtr, u32 Mask);
void XKmp_InterruptClear(XKmp *InstancePtr, u32 Mask);
u32 XKmp_InterruptGetEnabled(XKmp *InstancePtr);
u32 XKmp_InterruptGetStatus(XKmp *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
