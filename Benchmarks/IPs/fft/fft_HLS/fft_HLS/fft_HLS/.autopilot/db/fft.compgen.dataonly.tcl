# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
real_twid { 
	dir I
	width 64
	depth 512
	mode ap_memory
	offset 4096
	offset_end 8191
}
real_r { 
	dir IO
	width 64
	depth 1024
	mode ap_memory
	offset 8192
	offset_end 16383
}
img { 
	dir IO
	width 64
	depth 1024
	mode ap_memory
	offset 16384
	offset_end 24575
}
img_twid { 
	dir I
	width 64
	depth 512
	mode ap_memory
	offset 24576
	offset_end 28671
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict BUS_A $port_BUS_A


