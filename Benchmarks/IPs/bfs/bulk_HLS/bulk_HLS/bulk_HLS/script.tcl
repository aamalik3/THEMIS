############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project bulk_HLS
set_top bfs
add_files ../CCOde_bulk/input.data
add_files ../CCOde_bulk/check.data
add_files ../CCOde_bulk/bfs.c
add_files -tb ../CCOde_bulk/support.h -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../CCOde_bulk/support.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../CCOde_bulk/harness.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "bulk_HLS" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
source "./bulk_HLS/bulk_HLS/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
