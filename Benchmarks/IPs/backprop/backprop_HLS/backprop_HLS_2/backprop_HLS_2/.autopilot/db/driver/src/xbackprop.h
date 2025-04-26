// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XBACKPROP_H
#define XBACKPROP_H

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
#include "xbackprop_hw.h"

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
} XBackprop_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XBackprop;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XBackprop_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XBackprop_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XBackprop_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XBackprop_ReadReg(BaseAddress, RegOffset) \
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
int XBackprop_Initialize(XBackprop *InstancePtr, u16 DeviceId);
XBackprop_Config* XBackprop_LookupConfig(u16 DeviceId);
int XBackprop_CfgInitialize(XBackprop *InstancePtr, XBackprop_Config *ConfigPtr);
#else
int XBackprop_Initialize(XBackprop *InstancePtr, const char* InstanceName);
int XBackprop_Release(XBackprop *InstancePtr);
#endif

void XBackprop_Start(XBackprop *InstancePtr);
u32 XBackprop_IsDone(XBackprop *InstancePtr);
u32 XBackprop_IsIdle(XBackprop *InstancePtr);
u32 XBackprop_IsReady(XBackprop *InstancePtr);
void XBackprop_EnableAutoRestart(XBackprop *InstancePtr);
void XBackprop_DisableAutoRestart(XBackprop *InstancePtr);

u32 XBackprop_Get_biases3_BaseAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_biases3_HighAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_biases3_TotalBytes(XBackprop *InstancePtr);
u32 XBackprop_Get_biases3_BitWidth(XBackprop *InstancePtr);
u32 XBackprop_Get_biases3_Depth(XBackprop *InstancePtr);
u32 XBackprop_Write_biases3_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Read_biases3_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Write_biases3_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Read_biases3_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Get_biases1_BaseAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_biases1_HighAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_biases1_TotalBytes(XBackprop *InstancePtr);
u32 XBackprop_Get_biases1_BitWidth(XBackprop *InstancePtr);
u32 XBackprop_Get_biases1_Depth(XBackprop *InstancePtr);
u32 XBackprop_Write_biases1_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Read_biases1_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Write_biases1_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Read_biases1_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Get_biases2_BaseAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_biases2_HighAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_biases2_TotalBytes(XBackprop *InstancePtr);
u32 XBackprop_Get_biases2_BitWidth(XBackprop *InstancePtr);
u32 XBackprop_Get_biases2_Depth(XBackprop *InstancePtr);
u32 XBackprop_Write_biases2_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Read_biases2_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Write_biases2_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Read_biases2_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Get_weights3_BaseAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_weights3_HighAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_weights3_TotalBytes(XBackprop *InstancePtr);
u32 XBackprop_Get_weights3_BitWidth(XBackprop *InstancePtr);
u32 XBackprop_Get_weights3_Depth(XBackprop *InstancePtr);
u32 XBackprop_Write_weights3_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Read_weights3_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Write_weights3_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Read_weights3_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Get_training_targets_BaseAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_training_targets_HighAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_training_targets_TotalBytes(XBackprop *InstancePtr);
u32 XBackprop_Get_training_targets_BitWidth(XBackprop *InstancePtr);
u32 XBackprop_Get_training_targets_Depth(XBackprop *InstancePtr);
u32 XBackprop_Write_training_targets_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Read_training_targets_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Write_training_targets_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Read_training_targets_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Get_weights1_BaseAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_weights1_HighAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_weights1_TotalBytes(XBackprop *InstancePtr);
u32 XBackprop_Get_weights1_BitWidth(XBackprop *InstancePtr);
u32 XBackprop_Get_weights1_Depth(XBackprop *InstancePtr);
u32 XBackprop_Write_weights1_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Read_weights1_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Write_weights1_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Read_weights1_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Get_weights2_BaseAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_weights2_HighAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_weights2_TotalBytes(XBackprop *InstancePtr);
u32 XBackprop_Get_weights2_BitWidth(XBackprop *InstancePtr);
u32 XBackprop_Get_weights2_Depth(XBackprop *InstancePtr);
u32 XBackprop_Write_weights2_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Read_weights2_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Write_weights2_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Read_weights2_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Get_training_data_BaseAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_training_data_HighAddress(XBackprop *InstancePtr);
u32 XBackprop_Get_training_data_TotalBytes(XBackprop *InstancePtr);
u32 XBackprop_Get_training_data_BitWidth(XBackprop *InstancePtr);
u32 XBackprop_Get_training_data_Depth(XBackprop *InstancePtr);
u32 XBackprop_Write_training_data_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Read_training_data_Words(XBackprop *InstancePtr, int offset, word_type *data, int length);
u32 XBackprop_Write_training_data_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);
u32 XBackprop_Read_training_data_Bytes(XBackprop *InstancePtr, int offset, char *data, int length);

void XBackprop_InterruptGlobalEnable(XBackprop *InstancePtr);
void XBackprop_InterruptGlobalDisable(XBackprop *InstancePtr);
void XBackprop_InterruptEnable(XBackprop *InstancePtr, u32 Mask);
void XBackprop_InterruptDisable(XBackprop *InstancePtr, u32 Mask);
void XBackprop_InterruptClear(XBackprop *InstancePtr, u32 Mask);
u32 XBackprop_InterruptGetEnabled(XBackprop *InstancePtr);
u32 XBackprop_InterruptGetStatus(XBackprop *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
