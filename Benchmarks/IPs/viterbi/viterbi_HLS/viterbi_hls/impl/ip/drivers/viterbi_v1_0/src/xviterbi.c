// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xviterbi.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XViterbi_CfgInitialize(XViterbi *InstancePtr, XViterbi_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XViterbi_Start(XViterbi *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_AP_CTRL) & 0x80;
    XViterbi_WriteReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_AP_CTRL, Data | 0x01);
}

u32 XViterbi_IsDone(XViterbi *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XViterbi_IsIdle(XViterbi *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XViterbi_IsReady(XViterbi *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XViterbi_EnableAutoRestart(XViterbi *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XViterbi_WriteReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_AP_CTRL, 0x80);
}

void XViterbi_DisableAutoRestart(XViterbi *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XViterbi_WriteReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_AP_CTRL, 0);
}

u32 XViterbi_Get_return(XViterbi *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_AP_RETURN);
    return Data;
}
u32 XViterbi_Get_obs_BaseAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_OBS_BASE);
}

u32 XViterbi_Get_obs_HighAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_OBS_HIGH);
}

u32 XViterbi_Get_obs_TotalBytes(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XVITERBI_BUS_A_ADDR_OBS_HIGH - XVITERBI_BUS_A_ADDR_OBS_BASE + 1);
}

u32 XViterbi_Get_obs_BitWidth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_WIDTH_OBS;
}

u32 XViterbi_Get_obs_Depth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_DEPTH_OBS;
}

u32 XViterbi_Write_obs_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_OBS_HIGH - XVITERBI_BUS_A_ADDR_OBS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_OBS_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_obs_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_OBS_HIGH - XVITERBI_BUS_A_ADDR_OBS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_OBS_BASE + (offset + i)*4);
    }
    return length;
}

u32 XViterbi_Write_obs_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_OBS_HIGH - XVITERBI_BUS_A_ADDR_OBS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_OBS_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_obs_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_OBS_HIGH - XVITERBI_BUS_A_ADDR_OBS_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_OBS_BASE + offset + i);
    }
    return length;
}

u32 XViterbi_Get_init_BaseAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_INIT_BASE);
}

u32 XViterbi_Get_init_HighAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_INIT_HIGH);
}

u32 XViterbi_Get_init_TotalBytes(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XVITERBI_BUS_A_ADDR_INIT_HIGH - XVITERBI_BUS_A_ADDR_INIT_BASE + 1);
}

u32 XViterbi_Get_init_BitWidth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_WIDTH_INIT;
}

u32 XViterbi_Get_init_Depth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_DEPTH_INIT;
}

u32 XViterbi_Write_init_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_INIT_HIGH - XVITERBI_BUS_A_ADDR_INIT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_INIT_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_init_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_INIT_HIGH - XVITERBI_BUS_A_ADDR_INIT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_INIT_BASE + (offset + i)*4);
    }
    return length;
}

u32 XViterbi_Write_init_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_INIT_HIGH - XVITERBI_BUS_A_ADDR_INIT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_INIT_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_init_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_INIT_HIGH - XVITERBI_BUS_A_ADDR_INIT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_INIT_BASE + offset + i);
    }
    return length;
}

u32 XViterbi_Get_path_BaseAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_PATH_BASE);
}

u32 XViterbi_Get_path_HighAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_PATH_HIGH);
}

u32 XViterbi_Get_path_TotalBytes(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XVITERBI_BUS_A_ADDR_PATH_HIGH - XVITERBI_BUS_A_ADDR_PATH_BASE + 1);
}

u32 XViterbi_Get_path_BitWidth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_WIDTH_PATH;
}

u32 XViterbi_Get_path_Depth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_DEPTH_PATH;
}

u32 XViterbi_Write_path_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_PATH_HIGH - XVITERBI_BUS_A_ADDR_PATH_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_PATH_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_path_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_PATH_HIGH - XVITERBI_BUS_A_ADDR_PATH_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_PATH_BASE + (offset + i)*4);
    }
    return length;
}

u32 XViterbi_Write_path_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_PATH_HIGH - XVITERBI_BUS_A_ADDR_PATH_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_PATH_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_path_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_PATH_HIGH - XVITERBI_BUS_A_ADDR_PATH_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_PATH_BASE + offset + i);
    }
    return length;
}

u32 XViterbi_Get_transition_BaseAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_TRANSITION_BASE);
}

u32 XViterbi_Get_transition_HighAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_TRANSITION_HIGH);
}

u32 XViterbi_Get_transition_TotalBytes(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XVITERBI_BUS_A_ADDR_TRANSITION_HIGH - XVITERBI_BUS_A_ADDR_TRANSITION_BASE + 1);
}

u32 XViterbi_Get_transition_BitWidth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_WIDTH_TRANSITION;
}

u32 XViterbi_Get_transition_Depth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_DEPTH_TRANSITION;
}

u32 XViterbi_Write_transition_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_TRANSITION_HIGH - XVITERBI_BUS_A_ADDR_TRANSITION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_TRANSITION_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_transition_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_TRANSITION_HIGH - XVITERBI_BUS_A_ADDR_TRANSITION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_TRANSITION_BASE + (offset + i)*4);
    }
    return length;
}

u32 XViterbi_Write_transition_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_TRANSITION_HIGH - XVITERBI_BUS_A_ADDR_TRANSITION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_TRANSITION_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_transition_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_TRANSITION_HIGH - XVITERBI_BUS_A_ADDR_TRANSITION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_TRANSITION_BASE + offset + i);
    }
    return length;
}

u32 XViterbi_Get_emission_BaseAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_EMISSION_BASE);
}

u32 XViterbi_Get_emission_HighAddress(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_EMISSION_HIGH);
}

u32 XViterbi_Get_emission_TotalBytes(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XVITERBI_BUS_A_ADDR_EMISSION_HIGH - XVITERBI_BUS_A_ADDR_EMISSION_BASE + 1);
}

u32 XViterbi_Get_emission_BitWidth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_WIDTH_EMISSION;
}

u32 XViterbi_Get_emission_Depth(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVITERBI_BUS_A_DEPTH_EMISSION;
}

u32 XViterbi_Write_emission_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_EMISSION_HIGH - XVITERBI_BUS_A_ADDR_EMISSION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_EMISSION_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_emission_Words(XViterbi *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XVITERBI_BUS_A_ADDR_EMISSION_HIGH - XVITERBI_BUS_A_ADDR_EMISSION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_EMISSION_BASE + (offset + i)*4);
    }
    return length;
}

u32 XViterbi_Write_emission_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_EMISSION_HIGH - XVITERBI_BUS_A_ADDR_EMISSION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_EMISSION_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XViterbi_Read_emission_Bytes(XViterbi *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XVITERBI_BUS_A_ADDR_EMISSION_HIGH - XVITERBI_BUS_A_ADDR_EMISSION_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Bus_a_BaseAddress + XVITERBI_BUS_A_ADDR_EMISSION_BASE + offset + i);
    }
    return length;
}

void XViterbi_InterruptGlobalEnable(XViterbi *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XViterbi_WriteReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_GIE, 1);
}

void XViterbi_InterruptGlobalDisable(XViterbi *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XViterbi_WriteReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_GIE, 0);
}

void XViterbi_InterruptEnable(XViterbi *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_IER);
    XViterbi_WriteReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_IER, Register | Mask);
}

void XViterbi_InterruptDisable(XViterbi *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_IER);
    XViterbi_WriteReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_IER, Register & (~Mask));
}

void XViterbi_InterruptClear(XViterbi *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XViterbi_WriteReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_ISR, Mask);
}

u32 XViterbi_InterruptGetEnabled(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_IER);
}

u32 XViterbi_InterruptGetStatus(XViterbi *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XViterbi_ReadReg(InstancePtr->Bus_a_BaseAddress, XVITERBI_BUS_A_ADDR_ISR);
}

