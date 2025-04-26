// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xviterbi.h"

extern XViterbi_Config XViterbi_ConfigTable[];

XViterbi_Config *XViterbi_LookupConfig(u16 DeviceId) {
	XViterbi_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XVITERBI_NUM_INSTANCES; Index++) {
		if (XViterbi_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XViterbi_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XViterbi_Initialize(XViterbi *InstancePtr, u16 DeviceId) {
	XViterbi_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XViterbi_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XViterbi_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

