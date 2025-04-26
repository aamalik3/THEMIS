############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project CRS_HLS
set_top spmv
add_files ../CCode_crs/spmv.c
add_files ../CCode_crs/input.data
add_files ../CCode_crs/check.data
add_files -tb ../CCode_crs/support.h -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../CCode_crs/support.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../CCode_crs/harness.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "crs_HLS" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
source "./CRS_HLS/crs_HLS/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
