############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project nw_HLS
set_top needwun
add_files ../CCode/check.data
add_files ../CCode/input.data
add_files ../CCode/nw.c
add_files -tb ../CCode/harness.c
add_files -tb ../CCode/support.c
add_files -tb ../CCode/support.h
open_solution "nw_HLS" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./nw_HLS/nw_HLS/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
