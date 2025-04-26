############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project fft_HLS
set_top fft
add_files ../CCode_fft/check.data
add_files ../CCode_fft/fft.c
add_files ../CCode_fft/input.data
add_files -tb ../CCode_fft/harness.c
add_files -tb ../CCode_fft/support.c
add_files -tb ../CCode_fft/support.h
open_solution "fft_HLS" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./fft_HLS/fft_HLS/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
