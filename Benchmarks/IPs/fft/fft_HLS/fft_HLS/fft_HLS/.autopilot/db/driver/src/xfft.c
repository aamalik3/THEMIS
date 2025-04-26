// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xfft.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFft_CfgInitialize(XFft *InstancePtr, XFft_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFft_Start(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_AP_CTRL) & 0x80;
    XFft_WriteReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFft_IsDone(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFft_IsIdle(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFft_IsReady(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFft_EnableAutoRestart(XFft *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XFft_DisableAutoRestart(XFft *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XFft_Get_real_twid_BaseAddress(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_TWID_BASE);
}

u32 XFft_Get_real_twid_HighAddress(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_TWID_HIGH);
}

u32 XFft_Get_real_twid_TotalBytes(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XFFT_BUS_A_ADDR_REAL_TWID_HIGH - XFFT_BUS_A_ADDR_REAL_TWID_BASE + 1);
}

u32 XFft_Get_real_twid_BitWidth(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFFT_BUS_A_WIDTH_REAL_TWID;
}

u32 XFft_Get_real_twid_Depth(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFFT_BUS_A_DEPTH_REAL_TWID;
}

u32 XFft_Write_real_twid_Words(XFft *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XFFT_BUS_A_ADDR_REAL_TWID_HIGH - XFFT_BUS_A_ADDR_REAL_TWID_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_TWID_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XFft_Read_real_twid_Words(XFft *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XFFT_BUS_A_ADDR_REAL_TWID_HIGH - XFFT_BUS_A_ADDR_REAL_TWID_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_TWID_BASE + (offset + i)*4);
    }
    return length;
}

u32 XFft_Write_real_twid_Bytes(XFft *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XFFT_BUS_A_ADDR_REAL_TWID_HIGH - XFFT_BUS_A_ADDR_REAL_TWID_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_TWID_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XFft_Read_real_twid_Bytes(XFft *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XFFT_BUS_A_ADDR_REAL_TWID_HIGH - XFFT_BUS_A_ADDR_REAL_TWID_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_TWID_BASE + offset + i);
    }
    return length;
}

u32 XFft_Get_real_r_BaseAddress(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_R_BASE);
}

u32 XFft_Get_real_r_HighAddress(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_R_HIGH);
}

u32 XFft_Get_real_r_TotalBytes(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XFFT_BUS_A_ADDR_REAL_R_HIGH - XFFT_BUS_A_ADDR_REAL_R_BASE + 1);
}

u32 XFft_Get_real_r_BitWidth(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFFT_BUS_A_WIDTH_REAL_R;
}

u32 XFft_Get_real_r_Depth(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFFT_BUS_A_DEPTH_REAL_R;
}

u32 XFft_Write_real_r_Words(XFft *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XFFT_BUS_A_ADDR_REAL_R_HIGH - XFFT_BUS_A_ADDR_REAL_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_R_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XFft_Read_real_r_Words(XFft *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XFFT_BUS_A_ADDR_REAL_R_HIGH - XFFT_BUS_A_ADDR_REAL_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_R_BASE + (offset + i)*4);
    }
    return length;
}

u32 XFft_Write_real_r_Bytes(XFft *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XFFT_BUS_A_ADDR_REAL_R_HIGH - XFFT_BUS_A_ADDR_REAL_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_R_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XFft_Read_real_r_Bytes(XFft *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XFFT_BUS_A_ADDR_REAL_R_HIGH - XFFT_BUS_A_ADDR_REAL_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_REAL_R_BASE + offset + i);
    }
    return length;
}

u32 XFft_Get_img_BaseAddress(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_BASE);
}

u32 XFft_Get_img_HighAddress(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_HIGH);
}

u32 XFft_Get_img_TotalBytes(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XFFT_BUS_A_ADDR_IMG_HIGH - XFFT_BUS_A_ADDR_IMG_BASE + 1);
}

u32 XFft_Get_img_BitWidth(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFFT_BUS_A_WIDTH_IMG;
}

u32 XFft_Get_img_Depth(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFFT_BUS_A_DEPTH_IMG;
}

u32 XFft_Write_img_Words(XFft *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XFFT_BUS_A_ADDR_IMG_HIGH - XFFT_BUS_A_ADDR_IMG_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XFft_Read_img_Words(XFft *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XFFT_BUS_A_ADDR_IMG_HIGH - XFFT_BUS_A_ADDR_IMG_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_BASE + (offset + i)*4);
    }
    return length;
}

u32 XFft_Write_img_Bytes(XFft *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XFFT_BUS_A_ADDR_IMG_HIGH - XFFT_BUS_A_ADDR_IMG_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XFft_Read_img_Bytes(XFft *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XFFT_BUS_A_ADDR_IMG_HIGH - XFFT_BUS_A_ADDR_IMG_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_BASE + offset + i);
    }
    return length;
}

u32 XFft_Get_img_twid_BaseAddress(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_TWID_BASE);
}

u32 XFft_Get_img_twid_HighAddress(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_TWID_HIGH);
}

u32 XFft_Get_img_twid_TotalBytes(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XFFT_BUS_A_ADDR_IMG_TWID_HIGH - XFFT_BUS_A_ADDR_IMG_TWID_BASE + 1);
}

u32 XFft_Get_img_twid_BitWidth(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFFT_BUS_A_WIDTH_IMG_TWID;
}

u32 XFft_Get_img_twid_Depth(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFFT_BUS_A_DEPTH_IMG_TWID;
}

u32 XFft_Write_img_twid_Words(XFft *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XFFT_BUS_A_ADDR_IMG_TWID_HIGH - XFFT_BUS_A_ADDR_IMG_TWID_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_TWID_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XFft_Read_img_twid_Words(XFft *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XFFT_BUS_A_ADDR_IMG_TWID_HIGH - XFFT_BUS_A_ADDR_IMG_TWID_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_TWID_BASE + (offset + i)*4);
    }
    return length;
}

u32 XFft_Write_img_twid_Bytes(XFft *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XFFT_BUS_A_ADDR_IMG_TWID_HIGH - XFFT_BUS_A_ADDR_IMG_TWID_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_TWID_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XFft_Read_img_twid_Bytes(XFft *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XFFT_BUS_A_ADDR_IMG_TWID_HIGH - XFFT_BUS_A_ADDR_IMG_TWID_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XFFT_BUS_A_ADDR_IMG_TWID_BASE + offset + i);
    }
    return length;
}

void XFft_InterruptGlobalEnable(XFft *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_GIE, 1);
}

void XFft_InterruptGlobalDisable(XFft *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_GIE, 0);
}

void XFft_InterruptEnable(XFft *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFft_ReadReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_IER);
    XFft_WriteReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_IER, Register | Mask);
}

void XFft_InterruptDisable(XFft *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFft_ReadReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_IER);
    XFft_WriteReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_IER, Register & (~Mask));
}

void XFft_InterruptClear(XFft *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_ISR, Mask);
}

u32 XFft_InterruptGetEnabled(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFft_ReadReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_IER);
}

u32 XFft_InterruptGetStatus(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFft_ReadReg(InstancePtr->Bus_a_BaseAddress, XFFT_BUS_A_ADDR_ISR);
}

