set moduleName update_weights_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {update_weights.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ weights1 int 64 regular {array 832 { 2 } 1 1 }  }
	{ weights2 int 64 regular {array 4096 { 2 } 1 1 }  }
	{ weights3 int 64 regular {array 192 { 2 } 1 1 }  }
	{ biases1 int 64 regular {array 64 { 2 } 1 1 }  }
	{ biases2 int 64 regular {array 64 { 2 } 1 1 }  }
	{ biases3 int 64 regular {array 3 { 2 } 1 1 }  }
	{ d_weights1 double 64 regular {array 832 { 1 3 } 1 1 }  }
	{ d_weights2 double 64 regular {array 4096 { 1 3 } 1 1 }  }
	{ d_weights3 double 64 regular {array 192 { 1 3 } 1 1 }  }
	{ d_biases1 double 64 regular {array 64 { 1 3 } 1 1 }  }
	{ d_biases2 double 64 regular {array 64 { 1 3 } 1 1 }  }
	{ d_biases3_0_read double 64 regular  }
	{ d_biases3_1_read double 64 regular  }
	{ d_biases3_2_read double 64 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "weights1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "weights2", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "weights3", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases2", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases3", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "d_weights1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_weights2", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_weights3", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_biases1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_biases2", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_biases3_0_read", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_biases3_1_read", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_biases3_2_read", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 67
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ weights1_address0 sc_out sc_lv 10 signal 0 } 
	{ weights1_ce0 sc_out sc_logic 1 signal 0 } 
	{ weights1_we0 sc_out sc_logic 1 signal 0 } 
	{ weights1_d0 sc_out sc_lv 64 signal 0 } 
	{ weights1_q0 sc_in sc_lv 64 signal 0 } 
	{ weights2_address0 sc_out sc_lv 12 signal 1 } 
	{ weights2_ce0 sc_out sc_logic 1 signal 1 } 
	{ weights2_we0 sc_out sc_logic 1 signal 1 } 
	{ weights2_d0 sc_out sc_lv 64 signal 1 } 
	{ weights2_q0 sc_in sc_lv 64 signal 1 } 
	{ weights3_address0 sc_out sc_lv 8 signal 2 } 
	{ weights3_ce0 sc_out sc_logic 1 signal 2 } 
	{ weights3_we0 sc_out sc_logic 1 signal 2 } 
	{ weights3_d0 sc_out sc_lv 64 signal 2 } 
	{ weights3_q0 sc_in sc_lv 64 signal 2 } 
	{ biases1_address0 sc_out sc_lv 6 signal 3 } 
	{ biases1_ce0 sc_out sc_logic 1 signal 3 } 
	{ biases1_we0 sc_out sc_logic 1 signal 3 } 
	{ biases1_d0 sc_out sc_lv 64 signal 3 } 
	{ biases1_q0 sc_in sc_lv 64 signal 3 } 
	{ biases2_address0 sc_out sc_lv 6 signal 4 } 
	{ biases2_ce0 sc_out sc_logic 1 signal 4 } 
	{ biases2_we0 sc_out sc_logic 1 signal 4 } 
	{ biases2_d0 sc_out sc_lv 64 signal 4 } 
	{ biases2_q0 sc_in sc_lv 64 signal 4 } 
	{ biases3_address0 sc_out sc_lv 2 signal 5 } 
	{ biases3_ce0 sc_out sc_logic 1 signal 5 } 
	{ biases3_we0 sc_out sc_logic 1 signal 5 } 
	{ biases3_d0 sc_out sc_lv 64 signal 5 } 
	{ biases3_q0 sc_in sc_lv 64 signal 5 } 
	{ d_weights1_address0 sc_out sc_lv 10 signal 6 } 
	{ d_weights1_ce0 sc_out sc_logic 1 signal 6 } 
	{ d_weights1_q0 sc_in sc_lv 64 signal 6 } 
	{ d_weights2_address0 sc_out sc_lv 12 signal 7 } 
	{ d_weights2_ce0 sc_out sc_logic 1 signal 7 } 
	{ d_weights2_q0 sc_in sc_lv 64 signal 7 } 
	{ d_weights3_address0 sc_out sc_lv 8 signal 8 } 
	{ d_weights3_ce0 sc_out sc_logic 1 signal 8 } 
	{ d_weights3_q0 sc_in sc_lv 64 signal 8 } 
	{ d_biases1_address0 sc_out sc_lv 6 signal 9 } 
	{ d_biases1_ce0 sc_out sc_logic 1 signal 9 } 
	{ d_biases1_q0 sc_in sc_lv 64 signal 9 } 
	{ d_biases2_address0 sc_out sc_lv 6 signal 10 } 
	{ d_biases2_ce0 sc_out sc_logic 1 signal 10 } 
	{ d_biases2_q0 sc_in sc_lv 64 signal 10 } 
	{ d_biases3_0_read sc_in sc_lv 64 signal 11 } 
	{ d_biases3_1_read sc_in sc_lv 64 signal 12 } 
	{ d_biases3_2_read sc_in sc_lv 64 signal 13 } 
	{ grp_fu_6323_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_6323_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_6323_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_6323_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_6323_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_6341_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_6341_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_6341_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_6341_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_6349_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_6349_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_6349_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_6349_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "weights1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "weights1", "role": "address0" }} , 
 	{ "name": "weights1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights1", "role": "ce0" }} , 
 	{ "name": "weights1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights1", "role": "we0" }} , 
 	{ "name": "weights1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights1", "role": "d0" }} , 
 	{ "name": "weights1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights1", "role": "q0" }} , 
 	{ "name": "weights2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "weights2", "role": "address0" }} , 
 	{ "name": "weights2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights2", "role": "ce0" }} , 
 	{ "name": "weights2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights2", "role": "we0" }} , 
 	{ "name": "weights2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights2", "role": "d0" }} , 
 	{ "name": "weights2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights2", "role": "q0" }} , 
 	{ "name": "weights3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "weights3", "role": "address0" }} , 
 	{ "name": "weights3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights3", "role": "ce0" }} , 
 	{ "name": "weights3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights3", "role": "we0" }} , 
 	{ "name": "weights3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights3", "role": "d0" }} , 
 	{ "name": "weights3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights3", "role": "q0" }} , 
 	{ "name": "biases1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "biases1", "role": "address0" }} , 
 	{ "name": "biases1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases1", "role": "ce0" }} , 
 	{ "name": "biases1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases1", "role": "we0" }} , 
 	{ "name": "biases1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases1", "role": "d0" }} , 
 	{ "name": "biases1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases1", "role": "q0" }} , 
 	{ "name": "biases2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "biases2", "role": "address0" }} , 
 	{ "name": "biases2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases2", "role": "ce0" }} , 
 	{ "name": "biases2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases2", "role": "we0" }} , 
 	{ "name": "biases2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases2", "role": "d0" }} , 
 	{ "name": "biases2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases2", "role": "q0" }} , 
 	{ "name": "biases3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "biases3", "role": "address0" }} , 
 	{ "name": "biases3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases3", "role": "ce0" }} , 
 	{ "name": "biases3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases3", "role": "we0" }} , 
 	{ "name": "biases3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases3", "role": "d0" }} , 
 	{ "name": "biases3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases3", "role": "q0" }} , 
 	{ "name": "d_weights1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "d_weights1", "role": "address0" }} , 
 	{ "name": "d_weights1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_weights1", "role": "ce0" }} , 
 	{ "name": "d_weights1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_weights1", "role": "q0" }} , 
 	{ "name": "d_weights2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "d_weights2", "role": "address0" }} , 
 	{ "name": "d_weights2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_weights2", "role": "ce0" }} , 
 	{ "name": "d_weights2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_weights2", "role": "q0" }} , 
 	{ "name": "d_weights3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "d_weights3", "role": "address0" }} , 
 	{ "name": "d_weights3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_weights3", "role": "ce0" }} , 
 	{ "name": "d_weights3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_weights3", "role": "q0" }} , 
 	{ "name": "d_biases1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "d_biases1", "role": "address0" }} , 
 	{ "name": "d_biases1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_biases1", "role": "ce0" }} , 
 	{ "name": "d_biases1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_biases1", "role": "q0" }} , 
 	{ "name": "d_biases2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "d_biases2", "role": "address0" }} , 
 	{ "name": "d_biases2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_biases2", "role": "ce0" }} , 
 	{ "name": "d_biases2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_biases2", "role": "q0" }} , 
 	{ "name": "d_biases3_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_biases3_0_read", "role": "default" }} , 
 	{ "name": "d_biases3_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_biases3_1_read", "role": "default" }} , 
 	{ "name": "d_biases3_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_biases3_2_read", "role": "default" }} , 
 	{ "name": "grp_fu_6323_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6323_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_6323_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6323_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_6323_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_6323_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_6323_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6323_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_6323_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_6323_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_6341_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6341_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_6341_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6341_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_6341_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6341_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_6341_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_6341_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_6349_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6349_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_6349_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6349_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_6349_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_6349_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_6349_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_6349_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "update_weights_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "179138", "EstimateLatencyMax" : "179138",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "weights1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "d_weights1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_weights2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_weights3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_biases1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_biases2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_biases3_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_biases3_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_biases3_2_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsqrt_64ns_64ns_64_30_no_dsp_1_U4", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dacc_64ns_64ns_1ns_64_4_med_dsp_1_U5", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dacc_64ns_64ns_1ns_64_4_med_dsp_1_U6", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dacc_64ns_64ns_1ns_64_4_med_dsp_1_U7", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dacc_64ns_64ns_1ns_64_4_med_dsp_1_U8", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dacc_64ns_64ns_1ns_64_4_med_dsp_1_U9", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_64_1_1_U10", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dacc_64ns_64ns_1ns_64_4_med_dsp_1_U11", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	update_weights_1 {
		weights1 {Type IO LastRead 34 FirstWrite 14}
		weights2 {Type IO LastRead 100 FirstWrite 80}
		weights3 {Type IO LastRead 166 FirstWrite 146}
		biases1 {Type IO LastRead 65 FirstWrite 16}
		biases2 {Type IO LastRead 131 FirstWrite 82}
		biases3 {Type IO LastRead 197 FirstWrite 146}
		d_weights1 {Type I LastRead 1 FirstWrite -1}
		d_weights2 {Type I LastRead 67 FirstWrite -1}
		d_weights3 {Type I LastRead 133 FirstWrite -1}
		d_biases1 {Type I LastRead 3 FirstWrite -1}
		d_biases2 {Type I LastRead 69 FirstWrite -1}
		d_biases3_0_read {Type I LastRead 0 FirstWrite -1}
		d_biases3_1_read {Type I LastRead 0 FirstWrite -1}
		d_biases3_2_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "179138", "Max" : "179138"}
	, {"Name" : "Interval", "Min" : "179138", "Max" : "179138"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
	{"Pipeline" : "4", "EnableSignal" : "ap_enable_pp4"}
	{"Pipeline" : "5", "EnableSignal" : "ap_enable_pp5"}
	{"Pipeline" : "6", "EnableSignal" : "ap_enable_pp6"}
	{"Pipeline" : "7", "EnableSignal" : "ap_enable_pp7"}
	{"Pipeline" : "8", "EnableSignal" : "ap_enable_pp8"}
	{"Pipeline" : "9", "EnableSignal" : "ap_enable_pp9"}
	{"Pipeline" : "10", "EnableSignal" : "ap_enable_pp10"}
	{"Pipeline" : "11", "EnableSignal" : "ap_enable_pp11"}
]}

set Spec2ImplPortList { 
	weights1 { ap_memory {  { weights1_address0 mem_address 1 10 }  { weights1_ce0 mem_ce 1 1 }  { weights1_we0 mem_we 1 1 }  { weights1_d0 mem_din 1 64 }  { weights1_q0 mem_dout 0 64 } } }
	weights2 { ap_memory {  { weights2_address0 mem_address 1 12 }  { weights2_ce0 mem_ce 1 1 }  { weights2_we0 mem_we 1 1 }  { weights2_d0 mem_din 1 64 }  { weights2_q0 mem_dout 0 64 } } }
	weights3 { ap_memory {  { weights3_address0 mem_address 1 8 }  { weights3_ce0 mem_ce 1 1 }  { weights3_we0 mem_we 1 1 }  { weights3_d0 mem_din 1 64 }  { weights3_q0 mem_dout 0 64 } } }
	biases1 { ap_memory {  { biases1_address0 mem_address 1 6 }  { biases1_ce0 mem_ce 1 1 }  { biases1_we0 mem_we 1 1 }  { biases1_d0 mem_din 1 64 }  { biases1_q0 mem_dout 0 64 } } }
	biases2 { ap_memory {  { biases2_address0 mem_address 1 6 }  { biases2_ce0 mem_ce 1 1 }  { biases2_we0 mem_we 1 1 }  { biases2_d0 mem_din 1 64 }  { biases2_q0 mem_dout 0 64 } } }
	biases3 { ap_memory {  { biases3_address0 mem_address 1 2 }  { biases3_ce0 mem_ce 1 1 }  { biases3_we0 mem_we 1 1 }  { biases3_d0 mem_din 1 64 }  { biases3_q0 mem_dout 0 64 } } }
	d_weights1 { ap_memory {  { d_weights1_address0 mem_address 1 10 }  { d_weights1_ce0 mem_ce 1 1 }  { d_weights1_q0 mem_dout 0 64 } } }
	d_weights2 { ap_memory {  { d_weights2_address0 mem_address 1 12 }  { d_weights2_ce0 mem_ce 1 1 }  { d_weights2_q0 mem_dout 0 64 } } }
	d_weights3 { ap_memory {  { d_weights3_address0 mem_address 1 8 }  { d_weights3_ce0 mem_ce 1 1 }  { d_weights3_q0 mem_dout 0 64 } } }
	d_biases1 { ap_memory {  { d_biases1_address0 mem_address 1 6 }  { d_biases1_ce0 mem_ce 1 1 }  { d_biases1_q0 mem_dout 0 64 } } }
	d_biases2 { ap_memory {  { d_biases2_address0 mem_address 1 6 }  { d_biases2_ce0 mem_ce 1 1 }  { d_biases2_q0 mem_dout 0 64 } } }
	d_biases3_0_read { ap_none {  { d_biases3_0_read in_data 0 64 } } }
	d_biases3_1_read { ap_none {  { d_biases3_1_read in_data 0 64 } } }
	d_biases3_2_read { ap_none {  { d_biases3_2_read in_data 0 64 } } }
}
