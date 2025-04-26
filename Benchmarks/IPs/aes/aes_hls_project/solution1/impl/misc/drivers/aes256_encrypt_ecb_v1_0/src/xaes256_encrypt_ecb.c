// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xaes256_encrypt_ecb.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAes256_encrypt_ecb_CfgInitialize(XAes256_encrypt_ecb *InstancePtr, XAes256_encrypt_ecb_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAes256_encrypt_ecb_Start(XAes256_encrypt_ecb *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAes256_encrypt_ecb_ReadReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_AP_CTRL) & 0x80;
    XAes256_encrypt_ecb_WriteReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAes256_encrypt_ecb_IsDone(XAes256_encrypt_ecb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAes256_encrypt_ecb_ReadReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAes256_encrypt_ecb_IsIdle(XAes256_encrypt_ecb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAes256_encrypt_ecb_ReadReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAes256_encrypt_ecb_IsReady(XAes256_encrypt_ecb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAes256_encrypt_ecb_ReadReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAes256_encrypt_ecb_EnableAutoRestart(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAes256_encrypt_ecb_WriteReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XAes256_encrypt_ecb_DisableAutoRestart(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAes256_encrypt_ecb_WriteReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XAes256_encrypt_ecb_Get_k_BaseAddress(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE);
}

u32 XAes256_encrypt_ecb_Get_k_HighAddress(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_HIGH);
}

u32 XAes256_encrypt_ecb_Get_k_TotalBytes(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + 1);
}

u32 XAes256_encrypt_ecb_Get_k_BitWidth(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAES256_ENCRYPT_ECB_BUS_A_WIDTH_K;
}

u32 XAes256_encrypt_ecb_Get_k_Depth(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAES256_ENCRYPT_ECB_BUS_A_DEPTH_K;
}

u32 XAes256_encrypt_ecb_Write_k_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Read_k_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + (offset + i)*4);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Write_k_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Read_k_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_K_BASE + offset + i);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Get_buf_r_BaseAddress(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE);
}

u32 XAes256_encrypt_ecb_Get_buf_r_HighAddress(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_HIGH);
}

u32 XAes256_encrypt_ecb_Get_buf_r_TotalBytes(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + 1);
}

u32 XAes256_encrypt_ecb_Get_buf_r_BitWidth(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAES256_ENCRYPT_ECB_BUS_A_WIDTH_BUF_R;
}

u32 XAes256_encrypt_ecb_Get_buf_r_Depth(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAES256_ENCRYPT_ECB_BUS_A_DEPTH_BUF_R;
}

u32 XAes256_encrypt_ecb_Write_buf_r_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Read_buf_r_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + (offset + i)*4);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Write_buf_r_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Read_buf_r_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_BUF_R_BASE + offset + i);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Get_ctx_BaseAddress(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE);
}

u32 XAes256_encrypt_ecb_Get_ctx_HighAddress(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_HIGH);
}

u32 XAes256_encrypt_ecb_Get_ctx_TotalBytes(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + 1);
}

u32 XAes256_encrypt_ecb_Get_ctx_BitWidth(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAES256_ENCRYPT_ECB_BUS_A_WIDTH_CTX;
}

u32 XAes256_encrypt_ecb_Get_ctx_Depth(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAES256_ENCRYPT_ECB_BUS_A_DEPTH_CTX;
}

u32 XAes256_encrypt_ecb_Write_ctx_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Read_ctx_Words(XAes256_encrypt_ecb *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + (offset + i)*4);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Write_ctx_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XAes256_encrypt_ecb_Read_ctx_Bytes(XAes256_encrypt_ecb *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_HIGH - XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XAES256_ENCRYPT_ECB_BUS_A_ADDR_CTX_BASE + offset + i);
    }
    return length;
}

void XAes256_encrypt_ecb_InterruptGlobalEnable(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAes256_encrypt_ecb_WriteReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_GIE, 1);
}

void XAes256_encrypt_ecb_InterruptGlobalDisable(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAes256_encrypt_ecb_WriteReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_GIE, 0);
}

void XAes256_encrypt_ecb_InterruptEnable(XAes256_encrypt_ecb *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAes256_encrypt_ecb_ReadReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_IER);
    XAes256_encrypt_ecb_WriteReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_IER, Register | Mask);
}

void XAes256_encrypt_ecb_InterruptDisable(XAes256_encrypt_ecb *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAes256_encrypt_ecb_ReadReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_IER);
    XAes256_encrypt_ecb_WriteReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_IER, Register & (~Mask));
}

void XAes256_encrypt_ecb_InterruptClear(XAes256_encrypt_ecb *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAes256_encrypt_ecb_WriteReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_ISR, Mask);
}

u32 XAes256_encrypt_ecb_InterruptGetEnabled(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAes256_encrypt_ecb_ReadReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_IER);
}

u32 XAes256_encrypt_ecb_InterruptGetStatus(XAes256_encrypt_ecb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAes256_encrypt_ecb_ReadReg(InstancePtr->Bus_a_BaseAddress, XAES256_ENCRYPT_ECB_BUS_A_ADDR_ISR);
}

