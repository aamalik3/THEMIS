// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xstencil.h"

extern XStencil_Config XStencil_ConfigTable[];

XStencil_Config *XStencil_LookupConfig(u16 DeviceId) {
	XStencil_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSTENCIL_NUM_INSTANCES; Index++) {
		if (XStencil_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XStencil_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XStencil_Initialize(XStencil *InstancePtr, u16 DeviceId) {
	XStencil_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XStencil_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XStencil_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

