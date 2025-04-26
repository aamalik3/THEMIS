# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
SEQA { 
	dir I
	width 8
	depth 128
	mode ap_memory
	offset 128
	offset_end 255
}
SEQB { 
	dir I
	width 8
	depth 128
	mode ap_memory
	offset 256
	offset_end 383
}
alignedA { 
	dir O
	width 8
	depth 256
	mode ap_memory
	offset 512
	offset_end 767
}
alignedB { 
	dir O
	width 8
	depth 256
	mode ap_memory
	offset 768
	offset_end 1023
}
ptr { 
	dir IO
	width 8
	depth 16641
	mode ap_memory
	offset 32768
	offset_end 65535
}
M { 
	dir IO
	width 32
	depth 16641
	mode ap_memory
	offset 131072
	offset_end 262143
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict BUS_A $port_BUS_A


