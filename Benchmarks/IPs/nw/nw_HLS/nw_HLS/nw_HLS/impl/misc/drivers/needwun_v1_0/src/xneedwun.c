// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xneedwun.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XNeedwun_CfgInitialize(XNeedwun *InstancePtr, XNeedwun_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XNeedwun_Start(XNeedwun *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XNeedwun_ReadReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_AP_CTRL) & 0x80;
    XNeedwun_WriteReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XNeedwun_IsDone(XNeedwun *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XNeedwun_ReadReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XNeedwun_IsIdle(XNeedwun *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XNeedwun_ReadReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XNeedwun_IsReady(XNeedwun *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XNeedwun_ReadReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XNeedwun_EnableAutoRestart(XNeedwun *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNeedwun_WriteReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XNeedwun_DisableAutoRestart(XNeedwun *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNeedwun_WriteReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XNeedwun_Get_SEQA_BaseAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQA_BASE);
}

u32 XNeedwun_Get_SEQA_HighAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQA_HIGH);
}

u32 XNeedwun_Get_SEQA_TotalBytes(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XNEEDWUN_BUS_A_ADDR_SEQA_HIGH - XNEEDWUN_BUS_A_ADDR_SEQA_BASE + 1);
}

u32 XNeedwun_Get_SEQA_BitWidth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_WIDTH_SEQA;
}

u32 XNeedwun_Get_SEQA_Depth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_DEPTH_SEQA;
}

u32 XNeedwun_Write_SEQA_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_SEQA_HIGH - XNEEDWUN_BUS_A_ADDR_SEQA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQA_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_SEQA_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_SEQA_HIGH - XNEEDWUN_BUS_A_ADDR_SEQA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQA_BASE + (offset + i)*4);
    }
    return length;
}

u32 XNeedwun_Write_SEQA_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_SEQA_HIGH - XNEEDWUN_BUS_A_ADDR_SEQA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQA_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_SEQA_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_SEQA_HIGH - XNEEDWUN_BUS_A_ADDR_SEQA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQA_BASE + offset + i);
    }
    return length;
}

u32 XNeedwun_Get_SEQB_BaseAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQB_BASE);
}

u32 XNeedwun_Get_SEQB_HighAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQB_HIGH);
}

u32 XNeedwun_Get_SEQB_TotalBytes(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XNEEDWUN_BUS_A_ADDR_SEQB_HIGH - XNEEDWUN_BUS_A_ADDR_SEQB_BASE + 1);
}

u32 XNeedwun_Get_SEQB_BitWidth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_WIDTH_SEQB;
}

u32 XNeedwun_Get_SEQB_Depth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_DEPTH_SEQB;
}

u32 XNeedwun_Write_SEQB_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_SEQB_HIGH - XNEEDWUN_BUS_A_ADDR_SEQB_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQB_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_SEQB_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_SEQB_HIGH - XNEEDWUN_BUS_A_ADDR_SEQB_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQB_BASE + (offset + i)*4);
    }
    return length;
}

u32 XNeedwun_Write_SEQB_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_SEQB_HIGH - XNEEDWUN_BUS_A_ADDR_SEQB_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQB_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_SEQB_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_SEQB_HIGH - XNEEDWUN_BUS_A_ADDR_SEQB_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_SEQB_BASE + offset + i);
    }
    return length;
}

u32 XNeedwun_Get_alignedA_BaseAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE);
}

u32 XNeedwun_Get_alignedA_HighAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDA_HIGH);
}

u32 XNeedwun_Get_alignedA_TotalBytes(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XNEEDWUN_BUS_A_ADDR_ALIGNEDA_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + 1);
}

u32 XNeedwun_Get_alignedA_BitWidth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_WIDTH_ALIGNEDA;
}

u32 XNeedwun_Get_alignedA_Depth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_DEPTH_ALIGNEDA;
}

u32 XNeedwun_Write_alignedA_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_ALIGNEDA_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_alignedA_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_ALIGNEDA_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + (offset + i)*4);
    }
    return length;
}

u32 XNeedwun_Write_alignedA_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_ALIGNEDA_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_alignedA_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_ALIGNEDA_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDA_BASE + offset + i);
    }
    return length;
}

u32 XNeedwun_Get_alignedB_BaseAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE);
}

u32 XNeedwun_Get_alignedB_HighAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDB_HIGH);
}

u32 XNeedwun_Get_alignedB_TotalBytes(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XNEEDWUN_BUS_A_ADDR_ALIGNEDB_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + 1);
}

u32 XNeedwun_Get_alignedB_BitWidth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_WIDTH_ALIGNEDB;
}

u32 XNeedwun_Get_alignedB_Depth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_DEPTH_ALIGNEDB;
}

u32 XNeedwun_Write_alignedB_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_ALIGNEDB_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_alignedB_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_ALIGNEDB_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + (offset + i)*4);
    }
    return length;
}

u32 XNeedwun_Write_alignedB_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_ALIGNEDB_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_alignedB_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_ALIGNEDB_HIGH - XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_ALIGNEDB_BASE + offset + i);
    }
    return length;
}

u32 XNeedwun_Get_ptr_BaseAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_PTR_BASE);
}

u32 XNeedwun_Get_ptr_HighAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_PTR_HIGH);
}

u32 XNeedwun_Get_ptr_TotalBytes(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XNEEDWUN_BUS_A_ADDR_PTR_HIGH - XNEEDWUN_BUS_A_ADDR_PTR_BASE + 1);
}

u32 XNeedwun_Get_ptr_BitWidth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_WIDTH_PTR;
}

u32 XNeedwun_Get_ptr_Depth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_DEPTH_PTR;
}

u32 XNeedwun_Write_ptr_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_PTR_HIGH - XNEEDWUN_BUS_A_ADDR_PTR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_PTR_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_ptr_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_PTR_HIGH - XNEEDWUN_BUS_A_ADDR_PTR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_PTR_BASE + (offset + i)*4);
    }
    return length;
}

u32 XNeedwun_Write_ptr_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_PTR_HIGH - XNEEDWUN_BUS_A_ADDR_PTR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_PTR_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_ptr_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_PTR_HIGH - XNEEDWUN_BUS_A_ADDR_PTR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_PTR_BASE + offset + i);
    }
    return length;
}

u32 XNeedwun_Get_M_BaseAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_M_BASE);
}

u32 XNeedwun_Get_M_HighAddress(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_M_HIGH);
}

u32 XNeedwun_Get_M_TotalBytes(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XNEEDWUN_BUS_A_ADDR_M_HIGH - XNEEDWUN_BUS_A_ADDR_M_BASE + 1);
}

u32 XNeedwun_Get_M_BitWidth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_WIDTH_M;
}

u32 XNeedwun_Get_M_Depth(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNEEDWUN_BUS_A_DEPTH_M;
}

u32 XNeedwun_Write_M_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_M_HIGH - XNEEDWUN_BUS_A_ADDR_M_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_M_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_M_Words(XNeedwun *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XNEEDWUN_BUS_A_ADDR_M_HIGH - XNEEDWUN_BUS_A_ADDR_M_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_M_BASE + (offset + i)*4);
    }
    return length;
}

u32 XNeedwun_Write_M_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_M_HIGH - XNEEDWUN_BUS_A_ADDR_M_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_M_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XNeedwun_Read_M_Bytes(XNeedwun *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XNEEDWUN_BUS_A_ADDR_M_HIGH - XNEEDWUN_BUS_A_ADDR_M_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XNEEDWUN_BUS_A_ADDR_M_BASE + offset + i);
    }
    return length;
}

void XNeedwun_InterruptGlobalEnable(XNeedwun *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNeedwun_WriteReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_GIE, 1);
}

void XNeedwun_InterruptGlobalDisable(XNeedwun *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNeedwun_WriteReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_GIE, 0);
}

void XNeedwun_InterruptEnable(XNeedwun *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XNeedwun_ReadReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_IER);
    XNeedwun_WriteReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_IER, Register | Mask);
}

void XNeedwun_InterruptDisable(XNeedwun *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XNeedwun_ReadReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_IER);
    XNeedwun_WriteReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_IER, Register & (~Mask));
}

void XNeedwun_InterruptClear(XNeedwun *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNeedwun_WriteReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_ISR, Mask);
}

u32 XNeedwun_InterruptGetEnabled(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNeedwun_ReadReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_IER);
}

u32 XNeedwun_InterruptGetStatus(XNeedwun *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XNeedwun_ReadReg(InstancePtr->Bus_a_BaseAddress, XNEEDWUN_BUS_A_ADDR_ISR);
}

