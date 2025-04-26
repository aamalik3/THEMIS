create_pblock pblock_custom_IP
add_cells_to_pblock [get_pblocks pblock_custom_IP] [get_cells -quiet [list design_1_i/IP_wrapper_0/inst/custom_IP]]
resize_pblock [get_pblocks pblock_custom_IP] -add {SLICE_X0Y1:SLICE_X47Y48}
resize_pblock [get_pblocks pblock_custom_IP] -add {DSP48_X0Y2:DSP48_X2Y17}
resize_pblock [get_pblocks pblock_custom_IP] -add {RAMB18_X0Y2:RAMB18_X2Y17}
resize_pblock [get_pblocks pblock_custom_IP] -add {RAMB36_X0Y1:RAMB36_X2Y8}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_custom_IP]
set_property SNAPPING_MODE ON [get_pblocks pblock_custom_IP]
set_property DONT_TOUCH true [get_cells design_1_i/IP_wrapper_0/inst/custom_IP]
set_property HD.RECONFIGURABLE true [get_cells design_1_i/IP_wrapper_0/inst/custom_IP]



