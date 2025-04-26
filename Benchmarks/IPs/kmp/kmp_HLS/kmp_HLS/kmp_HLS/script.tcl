############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project kmp_HLS
set_top kmp
add_files ../CCode_kmp/check.data
add_files ../CCode_kmp/input.data
add_files ../CCode_kmp/kmp.c
add_files -tb ../CCode_kmp/harness.c
add_files -tb ../CCode_kmp/support.c
add_files -tb ../CCode_kmp/support.h
open_solution "kmp_HLS" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./kmp_HLS/kmp_HLS/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
