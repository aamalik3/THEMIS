// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XFFT_H
#define XFFT_H

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
#include "xfft_hw.h"

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
} XFft_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XFft;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFft_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFft_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFft_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFft_ReadReg(BaseAddress, RegOffset) \
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
int XFft_Initialize(XFft *InstancePtr, u16 DeviceId);
XFft_Config* XFft_LookupConfig(u16 DeviceId);
int XFft_CfgInitialize(XFft *InstancePtr, XFft_Config *ConfigPtr);
#else
int XFft_Initialize(XFft *InstancePtr, const char* InstanceName);
int XFft_Release(XFft *InstancePtr);
#endif

void XFft_Start(XFft *InstancePtr);
u32 XFft_IsDone(XFft *InstancePtr);
u32 XFft_IsIdle(XFft *InstancePtr);
u32 XFft_IsReady(XFft *InstancePtr);
void XFft_EnableAutoRestart(XFft *InstancePtr);
void XFft_DisableAutoRestart(XFft *InstancePtr);

u32 XFft_Get_real_twid_BaseAddress(XFft *InstancePtr);
u32 XFft_Get_real_twid_HighAddress(XFft *InstancePtr);
u32 XFft_Get_real_twid_TotalBytes(XFft *InstancePtr);
u32 XFft_Get_real_twid_BitWidth(XFft *InstancePtr);
u32 XFft_Get_real_twid_Depth(XFft *InstancePtr);
u32 XFft_Write_real_twid_Words(XFft *InstancePtr, int offset, word_type *data, int length);
u32 XFft_Read_real_twid_Words(XFft *InstancePtr, int offset, word_type *data, int length);
u32 XFft_Write_real_twid_Bytes(XFft *InstancePtr, int offset, char *data, int length);
u32 XFft_Read_real_twid_Bytes(XFft *InstancePtr, int offset, char *data, int length);
u32 XFft_Get_real_r_BaseAddress(XFft *InstancePtr);
u32 XFft_Get_real_r_HighAddress(XFft *InstancePtr);
u32 XFft_Get_real_r_TotalBytes(XFft *InstancePtr);
u32 XFft_Get_real_r_BitWidth(XFft *InstancePtr);
u32 XFft_Get_real_r_Depth(XFft *InstancePtr);
u32 XFft_Write_real_r_Words(XFft *InstancePtr, int offset, word_type *data, int length);
u32 XFft_Read_real_r_Words(XFft *InstancePtr, int offset, word_type *data, int length);
u32 XFft_Write_real_r_Bytes(XFft *InstancePtr, int offset, char *data, int length);
u32 XFft_Read_real_r_Bytes(XFft *InstancePtr, int offset, char *data, int length);
u32 XFft_Get_img_BaseAddress(XFft *InstancePtr);
u32 XFft_Get_img_HighAddress(XFft *InstancePtr);
u32 XFft_Get_img_TotalBytes(XFft *InstancePtr);
u32 XFft_Get_img_BitWidth(XFft *InstancePtr);
u32 XFft_Get_img_Depth(XFft *InstancePtr);
u32 XFft_Write_img_Words(XFft *InstancePtr, int offset, word_type *data, int length);
u32 XFft_Read_img_Words(XFft *InstancePtr, int offset, word_type *data, int length);
u32 XFft_Write_img_Bytes(XFft *InstancePtr, int offset, char *data, int length);
u32 XFft_Read_img_Bytes(XFft *InstancePtr, int offset, char *data, int length);
u32 XFft_Get_img_twid_BaseAddress(XFft *InstancePtr);
u32 XFft_Get_img_twid_HighAddress(XFft *InstancePtr);
u32 XFft_Get_img_twid_TotalBytes(XFft *InstancePtr);
u32 XFft_Get_img_twid_BitWidth(XFft *InstancePtr);
u32 XFft_Get_img_twid_Depth(XFft *InstancePtr);
u32 XFft_Write_img_twid_Words(XFft *InstancePtr, int offset, word_type *data, int length);
u32 XFft_Read_img_twid_Words(XFft *InstancePtr, int offset, word_type *data, int length);
u32 XFft_Write_img_twid_Bytes(XFft *InstancePtr, int offset, char *data, int length);
u32 XFft_Read_img_twid_Bytes(XFft *InstancePtr, int offset, char *data, int length);

void XFft_InterruptGlobalEnable(XFft *InstancePtr);
void XFft_InterruptGlobalDisable(XFft *InstancePtr);
void XFft_InterruptEnable(XFft *InstancePtr, u32 Mask);
void XFft_InterruptDisable(XFft *InstancePtr, u32 Mask);
void XFft_InterruptClear(XFft *InstancePtr, u32 Mask);
u32 XFft_InterruptGetEnabled(XFft *InstancePtr);
u32 XFft_InterruptGetStatus(XFft *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
