// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xkmp.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XKmp_CfgInitialize(XKmp *InstancePtr, XKmp_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XKmp_Start(XKmp *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_AP_CTRL) & 0x80;
    XKmp_WriteReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XKmp_IsDone(XKmp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XKmp_IsIdle(XKmp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XKmp_IsReady(XKmp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XKmp_EnableAutoRestart(XKmp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKmp_WriteReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XKmp_DisableAutoRestart(XKmp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKmp_WriteReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XKmp_Get_return(XKmp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_AP_RETURN);
    return Data;
}
u32 XKmp_Get_n_matches(XKmp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_N_MATCHES_DATA);
    return Data;
}

u32 XKmp_Get_n_matches_vld(XKmp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_N_MATCHES_CTRL);
    return Data & 0x1;
}

u32 XKmp_Get_pattern_BaseAddress(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_PATTERN_BASE);
}

u32 XKmp_Get_pattern_HighAddress(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_PATTERN_HIGH);
}

u32 XKmp_Get_pattern_TotalBytes(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XKMP_BUS_A_ADDR_PATTERN_HIGH - XKMP_BUS_A_ADDR_PATTERN_BASE + 1);
}

u32 XKmp_Get_pattern_BitWidth(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKMP_BUS_A_WIDTH_PATTERN;
}

u32 XKmp_Get_pattern_Depth(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKMP_BUS_A_DEPTH_PATTERN;
}

u32 XKmp_Write_pattern_Words(XKmp *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XKMP_BUS_A_ADDR_PATTERN_HIGH - XKMP_BUS_A_ADDR_PATTERN_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_PATTERN_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XKmp_Read_pattern_Words(XKmp *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XKMP_BUS_A_ADDR_PATTERN_HIGH - XKMP_BUS_A_ADDR_PATTERN_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_PATTERN_BASE + (offset + i)*4);
    }
    return length;
}

u32 XKmp_Write_pattern_Bytes(XKmp *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XKMP_BUS_A_ADDR_PATTERN_HIGH - XKMP_BUS_A_ADDR_PATTERN_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_PATTERN_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XKmp_Read_pattern_Bytes(XKmp *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XKMP_BUS_A_ADDR_PATTERN_HIGH - XKMP_BUS_A_ADDR_PATTERN_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_PATTERN_BASE + offset + i);
    }
    return length;
}

u32 XKmp_Get_kmpNext_BaseAddress(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_KMPNEXT_BASE);
}

u32 XKmp_Get_kmpNext_HighAddress(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_KMPNEXT_HIGH);
}

u32 XKmp_Get_kmpNext_TotalBytes(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XKMP_BUS_A_ADDR_KMPNEXT_HIGH - XKMP_BUS_A_ADDR_KMPNEXT_BASE + 1);
}

u32 XKmp_Get_kmpNext_BitWidth(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKMP_BUS_A_WIDTH_KMPNEXT;
}

u32 XKmp_Get_kmpNext_Depth(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKMP_BUS_A_DEPTH_KMPNEXT;
}

u32 XKmp_Write_kmpNext_Words(XKmp *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XKMP_BUS_A_ADDR_KMPNEXT_HIGH - XKMP_BUS_A_ADDR_KMPNEXT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_KMPNEXT_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XKmp_Read_kmpNext_Words(XKmp *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XKMP_BUS_A_ADDR_KMPNEXT_HIGH - XKMP_BUS_A_ADDR_KMPNEXT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_KMPNEXT_BASE + (offset + i)*4);
    }
    return length;
}

u32 XKmp_Write_kmpNext_Bytes(XKmp *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XKMP_BUS_A_ADDR_KMPNEXT_HIGH - XKMP_BUS_A_ADDR_KMPNEXT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_KMPNEXT_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XKmp_Read_kmpNext_Bytes(XKmp *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XKMP_BUS_A_ADDR_KMPNEXT_HIGH - XKMP_BUS_A_ADDR_KMPNEXT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_KMPNEXT_BASE + offset + i);
    }
    return length;
}

u32 XKmp_Get_input_r_BaseAddress(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_INPUT_R_BASE);
}

u32 XKmp_Get_input_r_HighAddress(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_INPUT_R_HIGH);
}

u32 XKmp_Get_input_r_TotalBytes(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XKMP_BUS_A_ADDR_INPUT_R_HIGH - XKMP_BUS_A_ADDR_INPUT_R_BASE + 1);
}

u32 XKmp_Get_input_r_BitWidth(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKMP_BUS_A_WIDTH_INPUT_R;
}

u32 XKmp_Get_input_r_Depth(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKMP_BUS_A_DEPTH_INPUT_R;
}

u32 XKmp_Write_input_r_Words(XKmp *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XKMP_BUS_A_ADDR_INPUT_R_HIGH - XKMP_BUS_A_ADDR_INPUT_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_INPUT_R_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XKmp_Read_input_r_Words(XKmp *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XKMP_BUS_A_ADDR_INPUT_R_HIGH - XKMP_BUS_A_ADDR_INPUT_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_INPUT_R_BASE + (offset + i)*4);
    }
    return length;
}

u32 XKmp_Write_input_r_Bytes(XKmp *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XKMP_BUS_A_ADDR_INPUT_R_HIGH - XKMP_BUS_A_ADDR_INPUT_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_INPUT_R_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XKmp_Read_input_r_Bytes(XKmp *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XKMP_BUS_A_ADDR_INPUT_R_HIGH - XKMP_BUS_A_ADDR_INPUT_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XKMP_BUS_A_ADDR_INPUT_R_BASE + offset + i);
    }
    return length;
}

void XKmp_InterruptGlobalEnable(XKmp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKmp_WriteReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_GIE, 1);
}

void XKmp_InterruptGlobalDisable(XKmp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKmp_WriteReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_GIE, 0);
}

void XKmp_InterruptEnable(XKmp *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_IER);
    XKmp_WriteReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_IER, Register | Mask);
}

void XKmp_InterruptDisable(XKmp *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_IER);
    XKmp_WriteReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_IER, Register & (~Mask));
}

void XKmp_InterruptClear(XKmp *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKmp_WriteReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_ISR, Mask);
}

u32 XKmp_InterruptGetEnabled(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_IER);
}

u32 XKmp_InterruptGetStatus(XKmp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKmp_ReadReg(InstancePtr->Bus_a_BaseAddress, XKMP_BUS_A_ADDR_ISR);
}

