// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xstencil.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XStencil_CfgInitialize(XStencil *InstancePtr, XStencil_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XStencil_Start(XStencil *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStencil_ReadReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_AP_CTRL) & 0x80;
    XStencil_WriteReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XStencil_IsDone(XStencil *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStencil_ReadReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XStencil_IsIdle(XStencil *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStencil_ReadReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XStencil_IsReady(XStencil *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStencil_ReadReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XStencil_EnableAutoRestart(XStencil *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStencil_WriteReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XStencil_DisableAutoRestart(XStencil *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStencil_WriteReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XStencil_Get_filter_BaseAddress(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_FILTER_BASE);
}

u32 XStencil_Get_filter_HighAddress(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_FILTER_HIGH);
}

u32 XStencil_Get_filter_TotalBytes(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSTENCIL_BUS_A_ADDR_FILTER_HIGH - XSTENCIL_BUS_A_ADDR_FILTER_BASE + 1);
}

u32 XStencil_Get_filter_BitWidth(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSTENCIL_BUS_A_WIDTH_FILTER;
}

u32 XStencil_Get_filter_Depth(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSTENCIL_BUS_A_DEPTH_FILTER;
}

u32 XStencil_Write_filter_Words(XStencil *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSTENCIL_BUS_A_ADDR_FILTER_HIGH - XSTENCIL_BUS_A_ADDR_FILTER_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_FILTER_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XStencil_Read_filter_Words(XStencil *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSTENCIL_BUS_A_ADDR_FILTER_HIGH - XSTENCIL_BUS_A_ADDR_FILTER_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_FILTER_BASE + (offset + i)*4);
    }
    return length;
}

u32 XStencil_Write_filter_Bytes(XStencil *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSTENCIL_BUS_A_ADDR_FILTER_HIGH - XSTENCIL_BUS_A_ADDR_FILTER_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_FILTER_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XStencil_Read_filter_Bytes(XStencil *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSTENCIL_BUS_A_ADDR_FILTER_HIGH - XSTENCIL_BUS_A_ADDR_FILTER_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_FILTER_BASE + offset + i);
    }
    return length;
}

u32 XStencil_Get_orig_BaseAddress(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_ORIG_BASE);
}

u32 XStencil_Get_orig_HighAddress(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_ORIG_HIGH);
}

u32 XStencil_Get_orig_TotalBytes(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSTENCIL_BUS_A_ADDR_ORIG_HIGH - XSTENCIL_BUS_A_ADDR_ORIG_BASE + 1);
}

u32 XStencil_Get_orig_BitWidth(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSTENCIL_BUS_A_WIDTH_ORIG;
}

u32 XStencil_Get_orig_Depth(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSTENCIL_BUS_A_DEPTH_ORIG;
}

u32 XStencil_Write_orig_Words(XStencil *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSTENCIL_BUS_A_ADDR_ORIG_HIGH - XSTENCIL_BUS_A_ADDR_ORIG_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_ORIG_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XStencil_Read_orig_Words(XStencil *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSTENCIL_BUS_A_ADDR_ORIG_HIGH - XSTENCIL_BUS_A_ADDR_ORIG_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_ORIG_BASE + (offset + i)*4);
    }
    return length;
}

u32 XStencil_Write_orig_Bytes(XStencil *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSTENCIL_BUS_A_ADDR_ORIG_HIGH - XSTENCIL_BUS_A_ADDR_ORIG_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_ORIG_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XStencil_Read_orig_Bytes(XStencil *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSTENCIL_BUS_A_ADDR_ORIG_HIGH - XSTENCIL_BUS_A_ADDR_ORIG_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_ORIG_BASE + offset + i);
    }
    return length;
}

u32 XStencil_Get_sol_BaseAddress(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_SOL_BASE);
}

u32 XStencil_Get_sol_HighAddress(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_SOL_HIGH);
}

u32 XStencil_Get_sol_TotalBytes(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSTENCIL_BUS_A_ADDR_SOL_HIGH - XSTENCIL_BUS_A_ADDR_SOL_BASE + 1);
}

u32 XStencil_Get_sol_BitWidth(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSTENCIL_BUS_A_WIDTH_SOL;
}

u32 XStencil_Get_sol_Depth(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSTENCIL_BUS_A_DEPTH_SOL;
}

u32 XStencil_Write_sol_Words(XStencil *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSTENCIL_BUS_A_ADDR_SOL_HIGH - XSTENCIL_BUS_A_ADDR_SOL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_SOL_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XStencil_Read_sol_Words(XStencil *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSTENCIL_BUS_A_ADDR_SOL_HIGH - XSTENCIL_BUS_A_ADDR_SOL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_SOL_BASE + (offset + i)*4);
    }
    return length;
}

u32 XStencil_Write_sol_Bytes(XStencil *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSTENCIL_BUS_A_ADDR_SOL_HIGH - XSTENCIL_BUS_A_ADDR_SOL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_SOL_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XStencil_Read_sol_Bytes(XStencil *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSTENCIL_BUS_A_ADDR_SOL_HIGH - XSTENCIL_BUS_A_ADDR_SOL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XSTENCIL_BUS_A_ADDR_SOL_BASE + offset + i);
    }
    return length;
}

void XStencil_InterruptGlobalEnable(XStencil *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStencil_WriteReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_GIE, 1);
}

void XStencil_InterruptGlobalDisable(XStencil *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStencil_WriteReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_GIE, 0);
}

void XStencil_InterruptEnable(XStencil *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XStencil_ReadReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_IER);
    XStencil_WriteReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_IER, Register | Mask);
}

void XStencil_InterruptDisable(XStencil *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XStencil_ReadReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_IER);
    XStencil_WriteReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_IER, Register & (~Mask));
}

void XStencil_InterruptClear(XStencil *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStencil_WriteReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_ISR, Mask);
}

u32 XStencil_InterruptGetEnabled(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XStencil_ReadReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_IER);
}

u32 XStencil_InterruptGetStatus(XStencil *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XStencil_ReadReg(InstancePtr->Bus_a_BaseAddress, XSTENCIL_BUS_A_ADDR_ISR);
}

