// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xmd.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMd_CfgInitialize(XMd *InstancePtr, XMd_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMd_Start(XMd *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMd_ReadReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_AP_CTRL) & 0x80;
    XMd_WriteReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMd_IsDone(XMd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMd_ReadReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMd_IsIdle(XMd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMd_ReadReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMd_IsReady(XMd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMd_ReadReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMd_EnableAutoRestart(XMd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMd_WriteReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XMd_DisableAutoRestart(XMd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMd_WriteReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XMd_Get_n_points_BaseAddress(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_N_POINTS_BASE);
}

u32 XMd_Get_n_points_HighAddress(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_N_POINTS_HIGH);
}

u32 XMd_Get_n_points_TotalBytes(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XMD_BUS_A_ADDR_N_POINTS_HIGH - XMD_BUS_A_ADDR_N_POINTS_BASE + 1);
}

u32 XMd_Get_n_points_BitWidth(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMD_BUS_A_WIDTH_N_POINTS;
}

u32 XMd_Get_n_points_Depth(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMD_BUS_A_DEPTH_N_POINTS;
}

u32 XMd_Write_n_points_Words(XMd *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMD_BUS_A_ADDR_N_POINTS_HIGH - XMD_BUS_A_ADDR_N_POINTS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_N_POINTS_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XMd_Read_n_points_Words(XMd *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMD_BUS_A_ADDR_N_POINTS_HIGH - XMD_BUS_A_ADDR_N_POINTS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_N_POINTS_BASE + (offset + i)*4);
    }
    return length;
}

u32 XMd_Write_n_points_Bytes(XMd *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMD_BUS_A_ADDR_N_POINTS_HIGH - XMD_BUS_A_ADDR_N_POINTS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_N_POINTS_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XMd_Read_n_points_Bytes(XMd *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMD_BUS_A_ADDR_N_POINTS_HIGH - XMD_BUS_A_ADDR_N_POINTS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_N_POINTS_BASE + offset + i);
    }
    return length;
}

u32 XMd_Get_force_r_BaseAddress(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_FORCE_R_BASE);
}

u32 XMd_Get_force_r_HighAddress(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_FORCE_R_HIGH);
}

u32 XMd_Get_force_r_TotalBytes(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XMD_BUS_A_ADDR_FORCE_R_HIGH - XMD_BUS_A_ADDR_FORCE_R_BASE + 1);
}

u32 XMd_Get_force_r_BitWidth(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMD_BUS_A_WIDTH_FORCE_R;
}

u32 XMd_Get_force_r_Depth(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMD_BUS_A_DEPTH_FORCE_R;
}

u32 XMd_Write_force_r_Words(XMd *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMD_BUS_A_ADDR_FORCE_R_HIGH - XMD_BUS_A_ADDR_FORCE_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_FORCE_R_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XMd_Read_force_r_Words(XMd *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMD_BUS_A_ADDR_FORCE_R_HIGH - XMD_BUS_A_ADDR_FORCE_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_FORCE_R_BASE + (offset + i)*4);
    }
    return length;
}

u32 XMd_Write_force_r_Bytes(XMd *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMD_BUS_A_ADDR_FORCE_R_HIGH - XMD_BUS_A_ADDR_FORCE_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_FORCE_R_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XMd_Read_force_r_Bytes(XMd *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMD_BUS_A_ADDR_FORCE_R_HIGH - XMD_BUS_A_ADDR_FORCE_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_FORCE_R_BASE + offset + i);
    }
    return length;
}

u32 XMd_Get_position_BaseAddress(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_POSITION_BASE);
}

u32 XMd_Get_position_HighAddress(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_POSITION_HIGH);
}

u32 XMd_Get_position_TotalBytes(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XMD_BUS_A_ADDR_POSITION_HIGH - XMD_BUS_A_ADDR_POSITION_BASE + 1);
}

u32 XMd_Get_position_BitWidth(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMD_BUS_A_WIDTH_POSITION;
}

u32 XMd_Get_position_Depth(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMD_BUS_A_DEPTH_POSITION;
}

u32 XMd_Write_position_Words(XMd *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMD_BUS_A_ADDR_POSITION_HIGH - XMD_BUS_A_ADDR_POSITION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_POSITION_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XMd_Read_position_Words(XMd *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMD_BUS_A_ADDR_POSITION_HIGH - XMD_BUS_A_ADDR_POSITION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_POSITION_BASE + (offset + i)*4);
    }
    return length;
}

u32 XMd_Write_position_Bytes(XMd *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMD_BUS_A_ADDR_POSITION_HIGH - XMD_BUS_A_ADDR_POSITION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_POSITION_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XMd_Read_position_Bytes(XMd *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMD_BUS_A_ADDR_POSITION_HIGH - XMD_BUS_A_ADDR_POSITION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XMD_BUS_A_ADDR_POSITION_BASE + offset + i);
    }
    return length;
}

void XMd_InterruptGlobalEnable(XMd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMd_WriteReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_GIE, 1);
}

void XMd_InterruptGlobalDisable(XMd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMd_WriteReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_GIE, 0);
}

void XMd_InterruptEnable(XMd *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMd_ReadReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_IER);
    XMd_WriteReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_IER, Register | Mask);
}

void XMd_InterruptDisable(XMd *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMd_ReadReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_IER);
    XMd_WriteReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_IER, Register & (~Mask));
}

void XMd_InterruptClear(XMd *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMd_WriteReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_ISR, Mask);
}

u32 XMd_InterruptGetEnabled(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMd_ReadReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_IER);
}

u32 XMd_InterruptGetStatus(XMd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMd_ReadReg(InstancePtr->Bus_a_BaseAddress, XMD_BUS_A_ADDR_ISR);
}

