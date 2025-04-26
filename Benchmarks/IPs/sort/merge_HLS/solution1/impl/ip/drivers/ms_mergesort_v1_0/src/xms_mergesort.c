// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xms_mergesort.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMs_mergesort_CfgInitialize(XMs_mergesort *InstancePtr, XMs_mergesort_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMs_mergesort_Start(XMs_mergesort *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMs_mergesort_ReadReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_AP_CTRL) & 0x80;
    XMs_mergesort_WriteReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMs_mergesort_IsDone(XMs_mergesort *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMs_mergesort_ReadReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMs_mergesort_IsIdle(XMs_mergesort *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMs_mergesort_ReadReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMs_mergesort_IsReady(XMs_mergesort *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMs_mergesort_ReadReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMs_mergesort_EnableAutoRestart(XMs_mergesort *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMs_mergesort_WriteReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XMs_mergesort_DisableAutoRestart(XMs_mergesort *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMs_mergesort_WriteReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XMs_mergesort_Get_a_BaseAddress(XMs_mergesort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XMS_MERGESORT_BUS_A_ADDR_A_BASE);
}

u32 XMs_mergesort_Get_a_HighAddress(XMs_mergesort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XMS_MERGESORT_BUS_A_ADDR_A_HIGH);
}

u32 XMs_mergesort_Get_a_TotalBytes(XMs_mergesort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XMS_MERGESORT_BUS_A_ADDR_A_HIGH - XMS_MERGESORT_BUS_A_ADDR_A_BASE + 1);
}

u32 XMs_mergesort_Get_a_BitWidth(XMs_mergesort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMS_MERGESORT_BUS_A_WIDTH_A;
}

u32 XMs_mergesort_Get_a_Depth(XMs_mergesort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMS_MERGESORT_BUS_A_DEPTH_A;
}

u32 XMs_mergesort_Write_a_Words(XMs_mergesort *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMS_MERGESORT_BUS_A_ADDR_A_HIGH - XMS_MERGESORT_BUS_A_ADDR_A_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XMS_MERGESORT_BUS_A_ADDR_A_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XMs_mergesort_Read_a_Words(XMs_mergesort *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMS_MERGESORT_BUS_A_ADDR_A_HIGH - XMS_MERGESORT_BUS_A_ADDR_A_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XMS_MERGESORT_BUS_A_ADDR_A_BASE + (offset + i)*4);
    }
    return length;
}

u32 XMs_mergesort_Write_a_Bytes(XMs_mergesort *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMS_MERGESORT_BUS_A_ADDR_A_HIGH - XMS_MERGESORT_BUS_A_ADDR_A_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XMS_MERGESORT_BUS_A_ADDR_A_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XMs_mergesort_Read_a_Bytes(XMs_mergesort *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMS_MERGESORT_BUS_A_ADDR_A_HIGH - XMS_MERGESORT_BUS_A_ADDR_A_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XMS_MERGESORT_BUS_A_ADDR_A_BASE + offset + i);
    }
    return length;
}

void XMs_mergesort_InterruptGlobalEnable(XMs_mergesort *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMs_mergesort_WriteReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_GIE, 1);
}

void XMs_mergesort_InterruptGlobalDisable(XMs_mergesort *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMs_mergesort_WriteReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_GIE, 0);
}

void XMs_mergesort_InterruptEnable(XMs_mergesort *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMs_mergesort_ReadReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_IER);
    XMs_mergesort_WriteReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_IER, Register | Mask);
}

void XMs_mergesort_InterruptDisable(XMs_mergesort *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMs_mergesort_ReadReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_IER);
    XMs_mergesort_WriteReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_IER, Register & (~Mask));
}

void XMs_mergesort_InterruptClear(XMs_mergesort *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMs_mergesort_WriteReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_ISR, Mask);
}

u32 XMs_mergesort_InterruptGetEnabled(XMs_mergesort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMs_mergesort_ReadReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_IER);
}

u32 XMs_mergesort_InterruptGetStatus(XMs_mergesort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMs_mergesort_ReadReg(InstancePtr->Bus_a_BaseAddress, XMS_MERGESORT_BUS_A_ADDR_ISR);
}

