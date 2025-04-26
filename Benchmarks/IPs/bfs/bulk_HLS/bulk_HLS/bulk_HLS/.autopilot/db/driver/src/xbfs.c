// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xbfs.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBfs_CfgInitialize(XBfs *InstancePtr, XBfs_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XBfs_Start(XBfs *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_AP_CTRL) & 0x80;
    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XBfs_IsDone(XBfs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XBfs_IsIdle(XBfs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XBfs_IsReady(XBfs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XBfs_EnableAutoRestart(XBfs *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XBfs_DisableAutoRestart(XBfs *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_AP_CTRL, 0);
}

void XBfs_Set_starting_node(XBfs *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_STARTING_NODE_DATA, (u32)(Data));
    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_STARTING_NODE_DATA + 4, (u32)(Data >> 32));
}

u64 XBfs_Get_starting_node(XBfs *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_STARTING_NODE_DATA);
    Data += (u64)XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_STARTING_NODE_DATA + 4) << 32;
    return Data;
}

u32 XBfs_Get_level_counts_BaseAddress(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE);
}

u32 XBfs_Get_level_counts_HighAddress(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_COUNTS_HIGH);
}

u32 XBfs_Get_level_counts_TotalBytes(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBFS_BUS_A_ADDR_LEVEL_COUNTS_HIGH - XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + 1);
}

u32 XBfs_Get_level_counts_BitWidth(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBFS_BUS_A_WIDTH_LEVEL_COUNTS;
}

u32 XBfs_Get_level_counts_Depth(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBFS_BUS_A_DEPTH_LEVEL_COUNTS;
}

u32 XBfs_Write_level_counts_Words(XBfs *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBFS_BUS_A_ADDR_LEVEL_COUNTS_HIGH - XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBfs_Read_level_counts_Words(XBfs *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBFS_BUS_A_ADDR_LEVEL_COUNTS_HIGH - XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBfs_Write_level_counts_Bytes(XBfs *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBFS_BUS_A_ADDR_LEVEL_COUNTS_HIGH - XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBfs_Read_level_counts_Bytes(XBfs *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBFS_BUS_A_ADDR_LEVEL_COUNTS_HIGH - XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_COUNTS_BASE + offset + i);
    }
    return length;
}

u32 XBfs_Get_level_BaseAddress(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_BASE);
}

u32 XBfs_Get_level_HighAddress(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_HIGH);
}

u32 XBfs_Get_level_TotalBytes(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBFS_BUS_A_ADDR_LEVEL_HIGH - XBFS_BUS_A_ADDR_LEVEL_BASE + 1);
}

u32 XBfs_Get_level_BitWidth(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBFS_BUS_A_WIDTH_LEVEL;
}

u32 XBfs_Get_level_Depth(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBFS_BUS_A_DEPTH_LEVEL;
}

u32 XBfs_Write_level_Words(XBfs *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBFS_BUS_A_ADDR_LEVEL_HIGH - XBFS_BUS_A_ADDR_LEVEL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBfs_Read_level_Words(XBfs *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBFS_BUS_A_ADDR_LEVEL_HIGH - XBFS_BUS_A_ADDR_LEVEL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBfs_Write_level_Bytes(XBfs *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBFS_BUS_A_ADDR_LEVEL_HIGH - XBFS_BUS_A_ADDR_LEVEL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBfs_Read_level_Bytes(XBfs *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBFS_BUS_A_ADDR_LEVEL_HIGH - XBFS_BUS_A_ADDR_LEVEL_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_LEVEL_BASE + offset + i);
    }
    return length;
}

u32 XBfs_Get_nodes_BaseAddress(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_NODES_BASE);
}

u32 XBfs_Get_nodes_HighAddress(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_NODES_HIGH);
}

u32 XBfs_Get_nodes_TotalBytes(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBFS_BUS_A_ADDR_NODES_HIGH - XBFS_BUS_A_ADDR_NODES_BASE + 1);
}

u32 XBfs_Get_nodes_BitWidth(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBFS_BUS_A_WIDTH_NODES;
}

u32 XBfs_Get_nodes_Depth(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBFS_BUS_A_DEPTH_NODES;
}

u32 XBfs_Write_nodes_Words(XBfs *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBFS_BUS_A_ADDR_NODES_HIGH - XBFS_BUS_A_ADDR_NODES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_NODES_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBfs_Read_nodes_Words(XBfs *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBFS_BUS_A_ADDR_NODES_HIGH - XBFS_BUS_A_ADDR_NODES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_NODES_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBfs_Write_nodes_Bytes(XBfs *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBFS_BUS_A_ADDR_NODES_HIGH - XBFS_BUS_A_ADDR_NODES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_NODES_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBfs_Read_nodes_Bytes(XBfs *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBFS_BUS_A_ADDR_NODES_HIGH - XBFS_BUS_A_ADDR_NODES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_NODES_BASE + offset + i);
    }
    return length;
}

u32 XBfs_Get_edges_BaseAddress(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_EDGES_BASE);
}

u32 XBfs_Get_edges_HighAddress(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_EDGES_HIGH);
}

u32 XBfs_Get_edges_TotalBytes(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XBFS_BUS_A_ADDR_EDGES_HIGH - XBFS_BUS_A_ADDR_EDGES_BASE + 1);
}

u32 XBfs_Get_edges_BitWidth(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBFS_BUS_A_WIDTH_EDGES;
}

u32 XBfs_Get_edges_Depth(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBFS_BUS_A_DEPTH_EDGES;
}

u32 XBfs_Write_edges_Words(XBfs *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBFS_BUS_A_ADDR_EDGES_HIGH - XBFS_BUS_A_ADDR_EDGES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_EDGES_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XBfs_Read_edges_Words(XBfs *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XBFS_BUS_A_ADDR_EDGES_HIGH - XBFS_BUS_A_ADDR_EDGES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_EDGES_BASE + (offset + i)*4);
    }
    return length;
}

u32 XBfs_Write_edges_Bytes(XBfs *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBFS_BUS_A_ADDR_EDGES_HIGH - XBFS_BUS_A_ADDR_EDGES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_EDGES_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XBfs_Read_edges_Bytes(XBfs *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XBFS_BUS_A_ADDR_EDGES_HIGH - XBFS_BUS_A_ADDR_EDGES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XBFS_BUS_A_ADDR_EDGES_BASE + offset + i);
    }
    return length;
}

void XBfs_InterruptGlobalEnable(XBfs *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_GIE, 1);
}

void XBfs_InterruptGlobalDisable(XBfs *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_GIE, 0);
}

void XBfs_InterruptEnable(XBfs *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_IER);
    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_IER, Register | Mask);
}

void XBfs_InterruptDisable(XBfs *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_IER);
    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_IER, Register & (~Mask));
}

void XBfs_InterruptClear(XBfs *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBfs_WriteReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_ISR, Mask);
}

u32 XBfs_InterruptGetEnabled(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_IER);
}

u32 XBfs_InterruptGetStatus(XBfs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBfs_ReadReg(InstancePtr->Bus_a_BaseAddress, XBFS_BUS_A_ADDR_ISR);
}

