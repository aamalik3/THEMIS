# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
n_points { 
	dir I
	width 32
	depth 64
	mode ap_memory
	offset 256
	offset_end 511
}
force_r { 
	dir IO
	width 192
	depth 640
	mode ap_memory
	offset 32768
	offset_end 65535
}
position { 
	dir I
	width 192
	depth 640
	mode ap_memory
	offset 65536
	offset_end 98303
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict BUS_A $port_BUS_A


