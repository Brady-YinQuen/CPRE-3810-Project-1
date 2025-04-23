#srl_mcdaniel_1
.data
.text
.globl main
main:

	# Test
	
	# Setup registers
	lui $t0, 0xA9
	lui $t1, 0xFFFF
	lui $t2, 0xA9
	lui $t3, 0xA9
	lui $t4, 0xA9
	lui $t5, 0xA9
	
	
	# test incremental shifting
	srl $t0, $t0, 0
	srl $t1, $t1, 1
	srl $t2, $t2, 2
	srl $t3, $t3, 3
	srl $t4, $t4, 4
	srl $t5, $t5, 5
	
	halt
