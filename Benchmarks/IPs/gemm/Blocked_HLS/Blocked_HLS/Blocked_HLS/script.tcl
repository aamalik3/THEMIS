############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Blocked_HLS
set_top bbgemm
add_files ../CCODE_Blocked/check.data
add_files ../CCODE_Blocked/gemm.c
add_files ../CCODE_Blocked/input.data
add_files -tb ../CCODE_Blocked/harness.c
add_files -tb ../CCODE_Blocked/support.c
add_files -tb ../CCODE_Blocked/support.h
open_solution "Blocked_HLS" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./Blocked_HLS/Blocked_HLS/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
