# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
starting_node { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
level_counts { 
	dir O
	width 64
	depth 10
	mode ap_memory
	offset 128
	offset_end 255
}
level { 
	dir IO
	width 8
	depth 256
	mode ap_memory
	offset 256
	offset_end 511
}
nodes { 
	dir I
	width 128
	depth 256
	mode ap_memory
	offset 4096
	offset_end 8191
}
edges { 
	dir I
	width 64
	depth 4096
	mode ap_memory
	offset 32768
	offset_end 65535
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict BUS_A $port_BUS_A


