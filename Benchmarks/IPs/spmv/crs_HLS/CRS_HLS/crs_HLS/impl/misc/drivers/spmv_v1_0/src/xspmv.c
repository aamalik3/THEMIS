// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xspmv.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSpmv_CfgInitialize(XSpmv *InstancePtr, XSpmv_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSpmv_Start(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_AP_CTRL) & 0x80;
    XSpmv_WriteReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSpmv_IsDone(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSpmv_IsIdle(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSpmv_IsReady(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSpmv_EnableAutoRestart(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XSpmv_DisableAutoRestart(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XSpmv_Get_rowDelimiters_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE);
}

u32 XSpmv_Get_rowDelimiters_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_ROWDELIMITERS_HIGH);
}

u32 XSpmv_Get_rowDelimiters_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_BUS_A_ADDR_ROWDELIMITERS_HIGH - XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + 1);
}

u32 XSpmv_Get_rowDelimiters_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_WIDTH_ROWDELIMITERS;
}

u32 XSpmv_Get_rowDelimiters_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_DEPTH_ROWDELIMITERS;
}

u32 XSpmv_Write_rowDelimiters_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_ROWDELIMITERS_HIGH - XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_rowDelimiters_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_ROWDELIMITERS_HIGH - XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_rowDelimiters_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_ROWDELIMITERS_HIGH - XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_rowDelimiters_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_ROWDELIMITERS_HIGH - XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_ROWDELIMITERS_BASE + offset + i);
    }
    return length;
}

u32 XSpmv_Get_vec_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VEC_BASE);
}

u32 XSpmv_Get_vec_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VEC_HIGH);
}

u32 XSpmv_Get_vec_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_BUS_A_ADDR_VEC_HIGH - XSPMV_BUS_A_ADDR_VEC_BASE + 1);
}

u32 XSpmv_Get_vec_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_WIDTH_VEC;
}

u32 XSpmv_Get_vec_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_DEPTH_VEC;
}

u32 XSpmv_Write_vec_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_VEC_HIGH - XSPMV_BUS_A_ADDR_VEC_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VEC_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_vec_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_VEC_HIGH - XSPMV_BUS_A_ADDR_VEC_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VEC_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_vec_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_VEC_HIGH - XSPMV_BUS_A_ADDR_VEC_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VEC_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_vec_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_VEC_HIGH - XSPMV_BUS_A_ADDR_VEC_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VEC_BASE + offset + i);
    }
    return length;
}

u32 XSpmv_Get_cols_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_COLS_BASE);
}

u32 XSpmv_Get_cols_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_COLS_HIGH);
}

u32 XSpmv_Get_cols_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_BUS_A_ADDR_COLS_HIGH - XSPMV_BUS_A_ADDR_COLS_BASE + 1);
}

u32 XSpmv_Get_cols_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_WIDTH_COLS;
}

u32 XSpmv_Get_cols_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_DEPTH_COLS;
}

u32 XSpmv_Write_cols_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_COLS_HIGH - XSPMV_BUS_A_ADDR_COLS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_COLS_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_cols_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_COLS_HIGH - XSPMV_BUS_A_ADDR_COLS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_COLS_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_cols_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_COLS_HIGH - XSPMV_BUS_A_ADDR_COLS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_COLS_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_cols_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_COLS_HIGH - XSPMV_BUS_A_ADDR_COLS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_COLS_BASE + offset + i);
    }
    return length;
}

u32 XSpmv_Get_val_r_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VAL_R_BASE);
}

u32 XSpmv_Get_val_r_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VAL_R_HIGH);
}

u32 XSpmv_Get_val_r_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_BUS_A_ADDR_VAL_R_HIGH - XSPMV_BUS_A_ADDR_VAL_R_BASE + 1);
}

u32 XSpmv_Get_val_r_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_WIDTH_VAL_R;
}

u32 XSpmv_Get_val_r_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_DEPTH_VAL_R;
}

u32 XSpmv_Write_val_r_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_VAL_R_HIGH - XSPMV_BUS_A_ADDR_VAL_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VAL_R_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_val_r_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_VAL_R_HIGH - XSPMV_BUS_A_ADDR_VAL_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VAL_R_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_val_r_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_VAL_R_HIGH - XSPMV_BUS_A_ADDR_VAL_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VAL_R_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_val_r_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_VAL_R_HIGH - XSPMV_BUS_A_ADDR_VAL_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_VAL_R_BASE + offset + i);
    }
    return length;
}

u32 XSpmv_Get_out_r_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_OUT_R_BASE);
}

u32 XSpmv_Get_out_r_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_OUT_R_HIGH);
}

u32 XSpmv_Get_out_r_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_BUS_A_ADDR_OUT_R_HIGH - XSPMV_BUS_A_ADDR_OUT_R_BASE + 1);
}

u32 XSpmv_Get_out_r_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_WIDTH_OUT_R;
}

u32 XSpmv_Get_out_r_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_BUS_A_DEPTH_OUT_R;
}

u32 XSpmv_Write_out_r_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_OUT_R_HIGH - XSPMV_BUS_A_ADDR_OUT_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_OUT_R_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_out_r_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_BUS_A_ADDR_OUT_R_HIGH - XSPMV_BUS_A_ADDR_OUT_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_OUT_R_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_out_r_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_OUT_R_HIGH - XSPMV_BUS_A_ADDR_OUT_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_OUT_R_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_out_r_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_BUS_A_ADDR_OUT_R_HIGH - XSPMV_BUS_A_ADDR_OUT_R_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XSPMV_BUS_A_ADDR_OUT_R_BASE + offset + i);
    }
    return length;
}

void XSpmv_InterruptGlobalEnable(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_GIE, 1);
}

void XSpmv_InterruptGlobalDisable(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_GIE, 0);
}

void XSpmv_InterruptEnable(XSpmv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSpmv_ReadReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_IER);
    XSpmv_WriteReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_IER, Register | Mask);
}

void XSpmv_InterruptDisable(XSpmv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSpmv_ReadReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_IER);
    XSpmv_WriteReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_IER, Register & (~Mask));
}

void XSpmv_InterruptClear(XSpmv *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_ISR, Mask);
}

u32 XSpmv_InterruptGetEnabled(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSpmv_ReadReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_IER);
}

u32 XSpmv_InterruptGetStatus(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSpmv_ReadReg(InstancePtr->Bus_a_BaseAddress, XSPMV_BUS_A_ADDR_ISR);
}

