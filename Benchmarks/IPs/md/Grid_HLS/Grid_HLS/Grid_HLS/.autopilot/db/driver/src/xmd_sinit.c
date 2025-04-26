// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xmd.h"

extern XMd_Config XMd_ConfigTable[];

XMd_Config *XMd_LookupConfig(u16 DeviceId) {
	XMd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMD_NUM_INSTANCES; Index++) {
		if (XMd_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMd_Initialize(XMd *InstancePtr, u16 DeviceId) {
	XMd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMd_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMd_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

