// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XMD_H
#define XMD_H

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
#include "xmd_hw.h"

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
} XMd_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XMd;

typedef u32 word_type;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
    u32 word_4;
    u32 word_5;
} XMd_Force_r;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
    u32 word_4;
    u32 word_5;
} XMd_Position;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMd_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMd_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMd_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMd_ReadReg(BaseAddress, RegOffset) \
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
int XMd_Initialize(XMd *InstancePtr, u16 DeviceId);
XMd_Config* XMd_LookupConfig(u16 DeviceId);
int XMd_CfgInitialize(XMd *InstancePtr, XMd_Config *ConfigPtr);
#else
int XMd_Initialize(XMd *InstancePtr, const char* InstanceName);
int XMd_Release(XMd *InstancePtr);
#endif

void XMd_Start(XMd *InstancePtr);
u32 XMd_IsDone(XMd *InstancePtr);
u32 XMd_IsIdle(XMd *InstancePtr);
u32 XMd_IsReady(XMd *InstancePtr);
void XMd_EnableAutoRestart(XMd *InstancePtr);
void XMd_DisableAutoRestart(XMd *InstancePtr);

u32 XMd_Get_n_points_BaseAddress(XMd *InstancePtr);
u32 XMd_Get_n_points_HighAddress(XMd *InstancePtr);
u32 XMd_Get_n_points_TotalBytes(XMd *InstancePtr);
u32 XMd_Get_n_points_BitWidth(XMd *InstancePtr);
u32 XMd_Get_n_points_Depth(XMd *InstancePtr);
u32 XMd_Write_n_points_Words(XMd *InstancePtr, int offset, word_type *data, int length);
u32 XMd_Read_n_points_Words(XMd *InstancePtr, int offset, word_type *data, int length);
u32 XMd_Write_n_points_Bytes(XMd *InstancePtr, int offset, char *data, int length);
u32 XMd_Read_n_points_Bytes(XMd *InstancePtr, int offset, char *data, int length);
u32 XMd_Get_force_r_BaseAddress(XMd *InstancePtr);
u32 XMd_Get_force_r_HighAddress(XMd *InstancePtr);
u32 XMd_Get_force_r_TotalBytes(XMd *InstancePtr);
u32 XMd_Get_force_r_BitWidth(XMd *InstancePtr);
u32 XMd_Get_force_r_Depth(XMd *InstancePtr);
u32 XMd_Write_force_r_Words(XMd *InstancePtr, int offset, word_type *data, int length);
u32 XMd_Read_force_r_Words(XMd *InstancePtr, int offset, word_type *data, int length);
u32 XMd_Write_force_r_Bytes(XMd *InstancePtr, int offset, char *data, int length);
u32 XMd_Read_force_r_Bytes(XMd *InstancePtr, int offset, char *data, int length);
u32 XMd_Get_position_BaseAddress(XMd *InstancePtr);
u32 XMd_Get_position_HighAddress(XMd *InstancePtr);
u32 XMd_Get_position_TotalBytes(XMd *InstancePtr);
u32 XMd_Get_position_BitWidth(XMd *InstancePtr);
u32 XMd_Get_position_Depth(XMd *InstancePtr);
u32 XMd_Write_position_Words(XMd *InstancePtr, int offset, word_type *data, int length);
u32 XMd_Read_position_Words(XMd *InstancePtr, int offset, word_type *data, int length);
u32 XMd_Write_position_Bytes(XMd *InstancePtr, int offset, char *data, int length);
u32 XMd_Read_position_Bytes(XMd *InstancePtr, int offset, char *data, int length);

void XMd_InterruptGlobalEnable(XMd *InstancePtr);
void XMd_InterruptGlobalDisable(XMd *InstancePtr);
void XMd_InterruptEnable(XMd *InstancePtr, u32 Mask);
void XMd_InterruptDisable(XMd *InstancePtr, u32 Mask);
void XMd_InterruptClear(XMd *InstancePtr, u32 Mask);
u32 XMd_InterruptGetEnabled(XMd *InstancePtr);
u32 XMd_InterruptGetStatus(XMd *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
