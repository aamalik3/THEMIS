# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
a { 
	dir IO
	width 32
	depth 2048
	mode ap_memory
	offset 8192
	offset_end 16383
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict BUS_A $port_BUS_A


