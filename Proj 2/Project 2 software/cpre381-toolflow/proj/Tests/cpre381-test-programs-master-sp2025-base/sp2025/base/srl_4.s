# srl_mcdaniel_0
.data
.text
.globl main
main:

	# Test
	
	# Setup registers
	lui $t0 0xA9
	lui $t1 0xFFFF
	lui $t2 0xA9
	lui $t3 0xA9
	lui $t4 0xA9
	lui $t5 0xA9
	
	srl $t0, $t0, 0		# Verify that zero shifting does nothing
	srl $t1, $t1, 31		# Verify that shifting the max amount works correctly
	# Test a few arbitrary shift lengths
	srl $t2, $t2, 13
	srl $t3, $t3, 30
	srl $t4, $t4, 1
	srl $t5, $t5, 27
	
	halt
