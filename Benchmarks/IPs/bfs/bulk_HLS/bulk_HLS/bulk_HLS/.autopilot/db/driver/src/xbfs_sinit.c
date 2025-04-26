// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xbfs.h"

extern XBfs_Config XBfs_ConfigTable[];

XBfs_Config *XBfs_LookupConfig(u16 DeviceId) {
	XBfs_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBFS_NUM_INSTANCES; Index++) {
		if (XBfs_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBfs_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBfs_Initialize(XBfs *InstancePtr, u16 DeviceId) {
	XBfs_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBfs_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBfs_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

