############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Grid_HLS
set_top md
add_files ../CCode_grid/check.data
add_files ../CCode_grid/input.data
add_files ../CCode_grid/md.c
add_files -tb ../CCode_grid/harness.c
add_files -tb ../CCode_grid/support.c
add_files -tb ../CCode_grid/support.h
open_solution "Grid_HLS" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./Grid_HLS/Grid_HLS/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
