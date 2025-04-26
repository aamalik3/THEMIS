set_property SRC_FILE_INFO {cfile:{C:/Users/aamalik3/Desktop/Power Energy Setup/multislot_scheduling_2/multislot_scheduling_2.srcs/constrs_1/new/port_const.xdc} rfile:../../../multislot_scheduling_2.srcs/constrs_1/new/port_const.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:{C:/Users/aamalik3/Desktop/Power Energy Setup/multislot_scheduling_2/multislot_scheduling_2.srcs/constrs_1/new/PR_const.xdc} rfile:../../../multislot_scheduling_2.srcs/constrs_1/new/PR_const.xdc id:2} [current_design]
set_property src_info {type:XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T22 [get_ports interrupt_0]
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]
set_property src_info {type:XDC file:2 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_pblock pblock_custom_IP
resize_pblock [get_pblocks pblock_custom_IP] -add {SLICE_X0Y1:SLICE_X47Y48}
resize_pblock [get_pblocks pblock_custom_IP] -add {DSP48_X0Y2:DSP48_X2Y17}
resize_pblock [get_pblocks pblock_custom_IP] -add {RAMB18_X0Y2:RAMB18_X2Y17}
resize_pblock [get_pblocks pblock_custom_IP] -add {RAMB36_X0Y1:RAMB36_X2Y8}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_custom_IP]
set_property SNAPPING_MODE ON [get_pblocks pblock_custom_IP]
set_property src_info {type:XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
add_cells_to_pblock [get_pblocks pblock_custom_IP] [get_cells -quiet [list design_1_i/IP_wrapper_0/inst/custom_IP]]
set_property src_info {type:XDC file:2 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property DONT_TOUCH true [get_cells design_1_i/IP_wrapper_0/inst/custom_IP]
set_property src_info {type:XDC file:2 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property HD.RECONFIGURABLE true [get_cells design_1_i/IP_wrapper_0/inst/custom_IP]
set_property src_info {type:XDC file:2 line:12 export:INPUT save:INPUT read:READ} [current_design]
create_pblock pblock_custom_IP_1
resize_pblock [get_pblocks pblock_custom_IP_1] -add {SLICE_X50Y1:SLICE_X111Y49}
resize_pblock [get_pblocks pblock_custom_IP_1] -add {DSP48_X3Y2:DSP48_X4Y19}
resize_pblock [get_pblocks pblock_custom_IP_1] -add {RAMB18_X3Y2:RAMB18_X5Y19}
resize_pblock [get_pblocks pblock_custom_IP_1] -add {RAMB36_X3Y1:RAMB36_X5Y9}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_custom_IP_1]
set_property SNAPPING_MODE ON [get_pblocks pblock_custom_IP_1]
set_property src_info {type:XDC file:2 line:13 export:INPUT save:INPUT read:READ} [current_design]
add_cells_to_pblock [get_pblocks pblock_custom_IP_1] [get_cells -quiet [list design_1_i/IP_wrapper_1/inst/custom_IP]]
set_property src_info {type:XDC file:2 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property DONT_TOUCH true [get_cells design_1_i/IP_wrapper_1/inst/custom_IP]
set_property src_info {type:XDC file:2 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property HD.RECONFIGURABLE true [get_cells design_1_i/IP_wrapper_1/inst/custom_IP]
