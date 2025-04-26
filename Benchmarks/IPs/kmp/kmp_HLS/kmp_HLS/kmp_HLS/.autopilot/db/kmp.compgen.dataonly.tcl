# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
ap_return { 
	dir o
	width 32
	depth 1
	mode ap_ctrl_hs
	offset 16
	offset_end 0
}
pattern { 
	dir I
	width 8
	depth 4
	mode ap_memory
	offset 24
	offset_end 31
}
kmpNext { 
	dir IO
	width 32
	depth 4
	mode ap_memory
	offset 32
	offset_end 47
}
n_matches { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 48
	offset_end 55
}
input_r { 
	dir I
	width 8
	depth 32411
	mode ap_memory
	offset 32768
	offset_end 65535
}
}
dict set axilite_register_dict BUS_A $port_BUS_A


