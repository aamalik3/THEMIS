// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xbackprop.h"

extern XBackprop_Config XBackprop_ConfigTable[];

XBackprop_Config *XBackprop_LookupConfig(u16 DeviceId) {
	XBackprop_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBACKPROP_NUM_INSTANCES; Index++) {
		if (XBackprop_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBackprop_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBackprop_Initialize(XBackprop *InstancePtr, u16 DeviceId) {
	XBackprop_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBackprop_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBackprop_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

