############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project backprop_HLS_2
set_top backprop
add_files ../CCode_backprop/backprop.c
add_files ../CCode_backprop/backprop.h
add_files ../CCode_backprop/check.data
add_files ../CCode_backprop/input.data
add_files ../CCode_backprop/local_support.c
add_files ../CCode_backprop/support.h
add_files -tb ../CCode_backprop/backprop.h
add_files -tb ../CCode_backprop/harness.c
add_files -tb ../CCode_backprop/support.c
add_files -tb ../CCode_backprop/support.h
open_solution "backprop_HLS_2" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./backprop_HLS_2/backprop_HLS_2/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
