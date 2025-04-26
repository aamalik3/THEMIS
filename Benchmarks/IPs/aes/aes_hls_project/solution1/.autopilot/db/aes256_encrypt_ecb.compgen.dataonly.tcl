# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
k { 
	dir I
	width 8
	depth 32
	mode ap_memory
	offset 32
	offset_end 63
}
buf_r { 
	dir IO
	width 8
	depth 16
	mode ap_memory
	offset 64
	offset_end 79
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
ctx { 
	dir IO
	width 8
	depth 96
	mode ap_memory
	offset 128
	offset_end 255
}
}
dict set axilite_register_dict BUS_A $port_BUS_A


