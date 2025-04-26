// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1ns/1ps

module backprop_dacc_64ns_64ns_1ns_64_4_med_dsp_1
#(parameter
  DWIDTH  = 64
)(
    input wire clk,
    input ce,
    input reset,
    input wire [DWIDTH-1:0] in_data,
    input in_valid,
    input in_last,
    output wire [DWIDTH-1:0] out_data
);

wire [DWIDTH-1:0] in_data_tmp = in_valid ? in_data : 0;
wire out_valid;
wire out_last;
wire reset_invert = ~reset;

//-------------------Instantiation----------------------------

DAcc DAcc_u (
    .aclk(clk),
    .aclken(ce),
    .aresetn(reset_invert),
    .s_axis_a_tvalid(in_valid),
    .s_axis_a_tdata(in_data_tmp),
    .s_axis_a_tlast(in_last),
    .m_axis_result_tvalid(out_valid),
    .m_axis_result_tdata(out_data),
    .m_axis_result_tlast(out_last)
);

//-------------------End Instantiation------------------------
endmodule
