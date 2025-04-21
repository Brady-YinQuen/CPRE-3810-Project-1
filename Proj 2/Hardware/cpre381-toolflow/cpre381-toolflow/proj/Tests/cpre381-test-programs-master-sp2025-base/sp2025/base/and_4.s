.data
.text
.globl main
main:
	#What am I testing:
	#Test 2 ensures that any value in a register anded with another register
	#containing all 0's, will result in 0.
	
	#Start Test
	
	#Sets $t0 = 0xFFFFFFFF (all 1's)
	lui $t0, 0xFFFF
	addi $t0, $t0, 0xFFFF
	
	#Sets $t1 = 0x00000000 (all 0's)
	lui $t1, 0x0000
	addi $t1, $t1, 0x0000
	
	#Ensure that $t2 is all 0's
	and $t2, $t1, $t0
	
	# End Test

	# Exit program
	halt