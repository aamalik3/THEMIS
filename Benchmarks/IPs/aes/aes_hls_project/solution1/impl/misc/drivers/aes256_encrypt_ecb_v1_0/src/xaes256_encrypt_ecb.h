// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XAES256_ENCRYPT_ECB_H
#define XAES256_ENCRYPT_ECB_H

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
#include "xaes256_encrypt_ecb_hw.h"

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
} XAes256_encrypt_ecb_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XAes256_encrypt_ecb;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAes256_encrypt_ecb_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAes256_encrypt_ecb_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAes256_encrypt_ecb_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAes256_encrypt_ecb_ReadReg(BaseAddress, RegOffset) \
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
int XAes256_encrypt_ecb_Initialize(XAes256_encrypt_ecb *InstancePtr, u16 DeviceId);
XAes256_encrypt_ecb_Config* XAes256_encrypt_ecb_LookupConfig(u16 DeviceId);
int XAes256_encrypt_ecb_CfgInitialize(XAes256_encrypt_ecb *InstancePtr, XAes256_encrypt_ecb_Config *ConfigPtr);
#else
int XAes256_encrypt_ecb_Initialize(XAes256_encrypt_ecb *InstancePtr, const char* InstanceName);
int XAes256_encrypt_ecb_Release(XAes256_encrypt_ecb *InstancePtr);
#endif

void XAes256_encrypt_ecb_Start(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_IsDone(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_IsIdle(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_IsReady(XAes256_encrypt_ecb *InstancePtr);
void XAes256_encrypt_ecb_EnableAutoRestart(XAes256_encrypt_ecb *InstancePtr);
void XAes256_encrypt_ecb_DisableAutoRestart(XAes256_encrypt_ecb *InstancePtr);

u32 XAes256_encrypt_ecb_Get_k_BaseAddress(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_k_HighAddress(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_k_TotalBytes(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_k_BitWidth(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_k_Depth(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Write_k_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length);
u32 XAes256_encrypt_ecb_Read_k_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length);
u32 XAes256_encrypt_ecb_Write_k_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length);
u32 XAes256_encrypt_ecb_Read_k_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length);
u32 XAes256_encrypt_ecb_Get_buf_r_BaseAddress(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_buf_r_HighAddress(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_buf_r_TotalBytes(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_buf_r_BitWidth(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_buf_r_Depth(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Write_buf_r_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length);
u32 XAes256_encrypt_ecb_Read_buf_r_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length);
u32 XAes256_encrypt_ecb_Write_buf_r_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length);
u32 XAes256_encrypt_ecb_Read_buf_r_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length);
u32 XAes256_encrypt_ecb_Get_ctx_BaseAddress(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_ctx_HighAddress(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_ctx_TotalBytes(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_ctx_BitWidth(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Get_ctx_Depth(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_Write_ctx_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length);
u32 XAes256_encrypt_ecb_Read_ctx_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length);
u32 XAes256_encrypt_ecb_Write_ctx_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length);
u32 XAes256_encrypt_ecb_Read_ctx_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length);

void XAes256_encrypt_ecb_InterruptGlobalEnable(XAes256_encrypt_ecb *InstancePtr);
void XAes256_encrypt_ecb_InterruptGlobalDisable(XAes256_encrypt_ecb *InstancePtr);
void XAes256_encrypt_ecb_InterruptEnable(XAes256_encrypt_ecb *InstancePtr, u32 Mask);
void XAes256_encrypt_ecb_InterruptDisable(XAes256_encrypt_ecb *InstancePtr, u32 Mask);
void XAes256_encrypt_ecb_InterruptClear(XAes256_encrypt_ecb *InstancePtr, u32 Mask);
u32 XAes256_encrypt_ecb_InterruptGetEnabled(XAes256_encrypt_ecb *InstancePtr);
u32 XAes256_encrypt_ecb_InterruptGetStatus(XAes256_encrypt_ecb *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
