// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XVITERBI_H
#define XVITERBI_H

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
#include "xviterbi_hw.h"

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
} XViterbi_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XViterbi;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XViterbi_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XViterbi_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XViterbi_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XViterbi_ReadReg(BaseAddress, RegOffset) \
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
int XViterbi_Initialize(XViterbi *InstancePtr, u16 DeviceId);
XViterbi_Config* XViterbi_LookupConfig(u16 DeviceId);
int XViterbi_CfgInitialize(XViterbi *InstancePtr, XViterbi_Config *ConfigPtr);
#else
int XViterbi_Initialize(XViterbi *InstancePtr, const char* InstanceName);
int XViterbi_Release(XViterbi *InstancePtr);
#endif

void XViterbi_Start(XViterbi *InstancePtr);
u32 XViterbi_IsDone(XViterbi *InstancePtr);
u32 XViterbi_IsIdle(XViterbi *InstancePtr);
u32 XViterbi_IsReady(XViterbi *InstancePtr);
void XViterbi_EnableAutoRestart(XViterbi *InstancePtr);
void XViterbi_DisableAutoRestart(XViterbi *InstancePtr);
u32 XViterbi_Get_return(XViterbi *InstancePtr);

u32 XViterbi_Get_obs_BaseAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_obs_HighAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_obs_TotalBytes(XViterbi *InstancePtr);
u32 XViterbi_Get_obs_BitWidth(XViterbi *InstancePtr);
u32 XViterbi_Get_obs_Depth(XViterbi *InstancePtr);
u32 XViterbi_Write_obs_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Read_obs_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Write_obs_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Read_obs_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Get_init_BaseAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_init_HighAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_init_TotalBytes(XViterbi *InstancePtr);
u32 XViterbi_Get_init_BitWidth(XViterbi *InstancePtr);
u32 XViterbi_Get_init_Depth(XViterbi *InstancePtr);
u32 XViterbi_Write_init_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Read_init_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Write_init_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Read_init_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Get_path_BaseAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_path_HighAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_path_TotalBytes(XViterbi *InstancePtr);
u32 XViterbi_Get_path_BitWidth(XViterbi *InstancePtr);
u32 XViterbi_Get_path_Depth(XViterbi *InstancePtr);
u32 XViterbi_Write_path_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Read_path_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Write_path_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Read_path_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Get_transition_BaseAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_transition_HighAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_transition_TotalBytes(XViterbi *InstancePtr);
u32 XViterbi_Get_transition_BitWidth(XViterbi *InstancePtr);
u32 XViterbi_Get_transition_Depth(XViterbi *InstancePtr);
u32 XViterbi_Write_transition_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Read_transition_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Write_transition_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Read_transition_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Get_emission_BaseAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_emission_HighAddress(XViterbi *InstancePtr);
u32 XViterbi_Get_emission_TotalBytes(XViterbi *InstancePtr);
u32 XViterbi_Get_emission_BitWidth(XViterbi *InstancePtr);
u32 XViterbi_Get_emission_Depth(XViterbi *InstancePtr);
u32 XViterbi_Write_emission_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Read_emission_Words(XViterbi *InstancePtr, int offset, word_type *data, int length);
u32 XViterbi_Write_emission_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);
u32 XViterbi_Read_emission_Bytes(XViterbi *InstancePtr, int offset, char *data, int length);

void XViterbi_InterruptGlobalEnable(XViterbi *InstancePtr);
void XViterbi_InterruptGlobalDisable(XViterbi *InstancePtr);
void XViterbi_InterruptEnable(XViterbi *InstancePtr, u32 Mask);
void XViterbi_InterruptDisable(XViterbi *InstancePtr, u32 Mask);
void XViterbi_InterruptClear(XViterbi *InstancePtr, u32 Mask);
u32 XViterbi_InterruptGetEnabled(XViterbi *InstancePtr);
u32 XViterbi_InterruptGetStatus(XViterbi *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
