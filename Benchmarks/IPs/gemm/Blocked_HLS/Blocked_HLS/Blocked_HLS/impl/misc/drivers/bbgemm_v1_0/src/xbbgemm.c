// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xbbgemm.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBbgemm_CfgInitialize(XBbgemm *InstancePtr, XBbgemm_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XBbgemm_Start(XBbgemm *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBbgemm_ReadReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_AP_CTRL) & 0x80;
    XBbgemm_WriteReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XBbgemm_IsDone(XBbgemm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBbgemm_ReadReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XBbgemm_IsIdle(XBbgemm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBbgemm_ReadReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XBbgemm_IsReady(XBbgemm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBbgemm_ReadReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XBbgemm_EnableAutoRestart(XBbgemm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBbgemm_WriteReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XBbgemm_DisableAutoRestart(XBbgemm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBbgemm_WriteReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XBbgemm_Get_m1_BaseAddress(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M1_BASE);
}

u32 XBbgemm_Get_m1_HighAddress(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M1_HIGH);
}

u32 XBbgemm_Get_m1_TotalBytes(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBBGEMM_BUS_A_ADDR_M1_HIGH - XBBGEMM_BUS_A_ADDR_M1_BASE + 1);
}

u32 XBbgemm_Get_m1_BitWidth(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBBGEMM_BUS_A_WIDTH_M1;
}

u32 XBbgemm_Get_m1_Depth(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBBGEMM_BUS_A_DEPTH_M1;
}

u32 XBbgemm_Write_m1_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBBGEMM_BUS_A_ADDR_M1_HIGH - XBBGEMM_BUS_A_ADDR_M1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBbgemm_Read_m1_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBBGEMM_BUS_A_ADDR_M1_HIGH - XBBGEMM_BUS_A_ADDR_M1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBbgemm_Write_m1_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBBGEMM_BUS_A_ADDR_M1_HIGH - XBBGEMM_BUS_A_ADDR_M1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBbgemm_Read_m1_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBBGEMM_BUS_A_ADDR_M1_HIGH - XBBGEMM_BUS_A_ADDR_M1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M1_BASE + offset + i);
    }
    return length;
}

u32 XBbgemm_Get_m2_BaseAddress(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M2_BASE);
}

u32 XBbgemm_Get_m2_HighAddress(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M2_HIGH);
}

u32 XBbgemm_Get_m2_TotalBytes(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBBGEMM_BUS_A_ADDR_M2_HIGH - XBBGEMM_BUS_A_ADDR_M2_BASE + 1);
}

u32 XBbgemm_Get_m2_BitWidth(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBBGEMM_BUS_A_WIDTH_M2;
}

u32 XBbgemm_Get_m2_Depth(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBBGEMM_BUS_A_DEPTH_M2;
}

u32 XBbgemm_Write_m2_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBBGEMM_BUS_A_ADDR_M2_HIGH - XBBGEMM_BUS_A_ADDR_M2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M2_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBbgemm_Read_m2_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBBGEMM_BUS_A_ADDR_M2_HIGH - XBBGEMM_BUS_A_ADDR_M2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M2_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBbgemm_Write_m2_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBBGEMM_BUS_A_ADDR_M2_HIGH - XBBGEMM_BUS_A_ADDR_M2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M2_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBbgemm_Read_m2_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBBGEMM_BUS_A_ADDR_M2_HIGH - XBBGEMM_BUS_A_ADDR_M2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_M2_BASE + offset + i);
    }
    return length;
}

u32 XBbgemm_Get_prod_BaseAddress(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_PROD_BASE);
}

u32 XBbgemm_Get_prod_HighAddress(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_PROD_HIGH);
}

u32 XBbgemm_Get_prod_TotalBytes(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBBGEMM_BUS_A_ADDR_PROD_HIGH - XBBGEMM_BUS_A_ADDR_PROD_BASE + 1);
}

u32 XBbgemm_Get_prod_BitWidth(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBBGEMM_BUS_A_WIDTH_PROD;
}

u32 XBbgemm_Get_prod_Depth(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBBGEMM_BUS_A_DEPTH_PROD;
}

u32 XBbgemm_Write_prod_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBBGEMM_BUS_A_ADDR_PROD_HIGH - XBBGEMM_BUS_A_ADDR_PROD_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_PROD_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBbgemm_Read_prod_Words(XBbgemm *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBBGEMM_BUS_A_ADDR_PROD_HIGH - XBBGEMM_BUS_A_ADDR_PROD_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_PROD_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBbgemm_Write_prod_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBBGEMM_BUS_A_ADDR_PROD_HIGH - XBBGEMM_BUS_A_ADDR_PROD_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_PROD_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBbgemm_Read_prod_Bytes(XBbgemm *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBBGEMM_BUS_A_ADDR_PROD_HIGH - XBBGEMM_BUS_A_ADDR_PROD_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBBGEMM_BUS_A_ADDR_PROD_BASE + offset + i);
    }
    return length;
}

void XBbgemm_InterruptGlobalEnable(XBbgemm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBbgemm_WriteReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_GIE, 1);
}

void XBbgemm_InterruptGlobalDisable(XBbgemm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBbgemm_WriteReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_GIE, 0);
}

void XBbgemm_InterruptEnable(XBbgemm *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBbgemm_ReadReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_IER);
    XBbgemm_WriteReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_IER, Register | Mask);
}

void XBbgemm_InterruptDisable(XBbgemm *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBbgemm_ReadReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_IER);
    XBbgemm_WriteReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_IER, Register & (~Mask));
}

void XBbgemm_InterruptClear(XBbgemm *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBbgemm_WriteReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_ISR, Mask);
}

u32 XBbgemm_InterruptGetEnabled(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBbgemm_ReadReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_IER);
}

u32 XBbgemm_InterruptGetStatus(XBbgemm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBbgemm_ReadReg(InstancePtr->Bus_a_BaseAddress, XBBGEMM_BUS_A_ADDR_ISR);
}

