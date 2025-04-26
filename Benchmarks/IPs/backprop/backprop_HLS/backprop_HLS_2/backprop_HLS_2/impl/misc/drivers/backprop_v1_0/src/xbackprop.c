// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xbackprop.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBackprop_CfgInitialize(XBackprop *InstancePtr, XBackprop_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XBackprop_Start(XBackprop *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackprop_ReadReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_AP_CTRL) & 0x80;
    XBackprop_WriteReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XBackprop_IsDone(XBackprop *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackprop_ReadReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XBackprop_IsIdle(XBackprop *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackprop_ReadReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XBackprop_IsReady(XBackprop *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackprop_ReadReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XBackprop_EnableAutoRestart(XBackprop *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackprop_WriteReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XBackprop_DisableAutoRestart(XBackprop *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackprop_WriteReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XBackprop_Get_biases3_BaseAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES3_BASE);
}

u32 XBackprop_Get_biases3_HighAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES3_HIGH);
}

u32 XBackprop_Get_biases3_TotalBytes(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBACKPROP_BUS_A_ADDR_BIASES3_HIGH - XBACKPROP_BUS_A_ADDR_BIASES3_BASE + 1);
}

u32 XBackprop_Get_biases3_BitWidth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_WIDTH_BIASES3;
}

u32 XBackprop_Get_biases3_Depth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_DEPTH_BIASES3;
}

u32 XBackprop_Write_biases3_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_BIASES3_HIGH - XBACKPROP_BUS_A_ADDR_BIASES3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES3_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_biases3_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_BIASES3_HIGH - XBACKPROP_BUS_A_ADDR_BIASES3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES3_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBackprop_Write_biases3_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_BIASES3_HIGH - XBACKPROP_BUS_A_ADDR_BIASES3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES3_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_biases3_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_BIASES3_HIGH - XBACKPROP_BUS_A_ADDR_BIASES3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES3_BASE + offset + i);
    }
    return length;
}

u32 XBackprop_Get_biases1_BaseAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES1_BASE);
}

u32 XBackprop_Get_biases1_HighAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES1_HIGH);
}

u32 XBackprop_Get_biases1_TotalBytes(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBACKPROP_BUS_A_ADDR_BIASES1_HIGH - XBACKPROP_BUS_A_ADDR_BIASES1_BASE + 1);
}

u32 XBackprop_Get_biases1_BitWidth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_WIDTH_BIASES1;
}

u32 XBackprop_Get_biases1_Depth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_DEPTH_BIASES1;
}

u32 XBackprop_Write_biases1_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_BIASES1_HIGH - XBACKPROP_BUS_A_ADDR_BIASES1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_biases1_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_BIASES1_HIGH - XBACKPROP_BUS_A_ADDR_BIASES1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBackprop_Write_biases1_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_BIASES1_HIGH - XBACKPROP_BUS_A_ADDR_BIASES1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_biases1_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_BIASES1_HIGH - XBACKPROP_BUS_A_ADDR_BIASES1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES1_BASE + offset + i);
    }
    return length;
}

u32 XBackprop_Get_biases2_BaseAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES2_BASE);
}

u32 XBackprop_Get_biases2_HighAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES2_HIGH);
}

u32 XBackprop_Get_biases2_TotalBytes(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBACKPROP_BUS_A_ADDR_BIASES2_HIGH - XBACKPROP_BUS_A_ADDR_BIASES2_BASE + 1);
}

u32 XBackprop_Get_biases2_BitWidth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_WIDTH_BIASES2;
}

u32 XBackprop_Get_biases2_Depth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_DEPTH_BIASES2;
}

u32 XBackprop_Write_biases2_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_BIASES2_HIGH - XBACKPROP_BUS_A_ADDR_BIASES2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES2_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_biases2_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_BIASES2_HIGH - XBACKPROP_BUS_A_ADDR_BIASES2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES2_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBackprop_Write_biases2_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_BIASES2_HIGH - XBACKPROP_BUS_A_ADDR_BIASES2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES2_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_biases2_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_BIASES2_HIGH - XBACKPROP_BUS_A_ADDR_BIASES2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_BIASES2_BASE + offset + i);
    }
    return length;
}

u32 XBackprop_Get_weights3_BaseAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE);
}

u32 XBackprop_Get_weights3_HighAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS3_HIGH);
}

u32 XBackprop_Get_weights3_TotalBytes(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBACKPROP_BUS_A_ADDR_WEIGHTS3_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + 1);
}

u32 XBackprop_Get_weights3_BitWidth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_WIDTH_WEIGHTS3;
}

u32 XBackprop_Get_weights3_Depth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_DEPTH_WEIGHTS3;
}

u32 XBackprop_Write_weights3_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_WEIGHTS3_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_weights3_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_WEIGHTS3_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBackprop_Write_weights3_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_WEIGHTS3_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_weights3_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_WEIGHTS3_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS3_BASE + offset + i);
    }
    return length;
}

u32 XBackprop_Get_training_targets_BaseAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE);
}

u32 XBackprop_Get_training_targets_HighAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_HIGH);
}

u32 XBackprop_Get_training_targets_TotalBytes(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + 1);
}

u32 XBackprop_Get_training_targets_BitWidth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_WIDTH_TRAINING_TARGETS;
}

u32 XBackprop_Get_training_targets_Depth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_DEPTH_TRAINING_TARGETS;
}

u32 XBackprop_Write_training_targets_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_training_targets_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBackprop_Write_training_targets_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_training_targets_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_TARGETS_BASE + offset + i);
    }
    return length;
}

u32 XBackprop_Get_weights1_BaseAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE);
}

u32 XBackprop_Get_weights1_HighAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS1_HIGH);
}

u32 XBackprop_Get_weights1_TotalBytes(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBACKPROP_BUS_A_ADDR_WEIGHTS1_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + 1);
}

u32 XBackprop_Get_weights1_BitWidth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_WIDTH_WEIGHTS1;
}

u32 XBackprop_Get_weights1_Depth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_DEPTH_WEIGHTS1;
}

u32 XBackprop_Write_weights1_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_WEIGHTS1_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_weights1_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_WEIGHTS1_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBackprop_Write_weights1_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_WEIGHTS1_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_weights1_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_WEIGHTS1_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS1_BASE + offset + i);
    }
    return length;
}

u32 XBackprop_Get_weights2_BaseAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE);
}

u32 XBackprop_Get_weights2_HighAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS2_HIGH);
}

u32 XBackprop_Get_weights2_TotalBytes(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBACKPROP_BUS_A_ADDR_WEIGHTS2_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + 1);
}

u32 XBackprop_Get_weights2_BitWidth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_WIDTH_WEIGHTS2;
}

u32 XBackprop_Get_weights2_Depth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_DEPTH_WEIGHTS2;
}

u32 XBackprop_Write_weights2_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_WEIGHTS2_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_weights2_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_WEIGHTS2_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBackprop_Write_weights2_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_WEIGHTS2_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_weights2_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_WEIGHTS2_HIGH - XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_WEIGHTS2_BASE + offset + i);
    }
    return length;
}

u32 XBackprop_Get_training_data_BaseAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE);
}

u32 XBackprop_Get_training_data_HighAddress(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_DATA_HIGH);
}

u32 XBackprop_Get_training_data_TotalBytes(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBACKPROP_BUS_A_ADDR_TRAINING_DATA_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + 1);
}

u32 XBackprop_Get_training_data_BitWidth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_WIDTH_TRAINING_DATA;
}

u32 XBackprop_Get_training_data_Depth(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBACKPROP_BUS_A_DEPTH_TRAINING_DATA;
}

u32 XBackprop_Write_training_data_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_TRAINING_DATA_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_training_data_Words(XBackprop *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBACKPROP_BUS_A_ADDR_TRAINING_DATA_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBackprop_Write_training_data_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_TRAINING_DATA_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBackprop_Read_training_data_Bytes(XBackprop *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBACKPROP_BUS_A_ADDR_TRAINING_DATA_HIGH - XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBACKPROP_BUS_A_ADDR_TRAINING_DATA_BASE + offset + i);
    }
    return length;
}

void XBackprop_InterruptGlobalEnable(XBackprop *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackprop_WriteReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_GIE, 1);
}

void XBackprop_InterruptGlobalDisable(XBackprop *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackprop_WriteReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_GIE, 0);
}

void XBackprop_InterruptEnable(XBackprop *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBackprop_ReadReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_IER);
    XBackprop_WriteReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_IER, Register | Mask);
}

void XBackprop_InterruptDisable(XBackprop *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBackprop_ReadReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_IER);
    XBackprop_WriteReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_IER, Register & (~Mask));
}

void XBackprop_InterruptClear(XBackprop *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackprop_WriteReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_ISR, Mask);
}

u32 XBackprop_InterruptGetEnabled(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBackprop_ReadReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_IER);
}

u32 XBackprop_InterruptGetStatus(XBackprop *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBackprop_ReadReg(InstancePtr->Bus_a_BaseAddress, XBACKPROP_BUS_A_ADDR_ISR);
}

