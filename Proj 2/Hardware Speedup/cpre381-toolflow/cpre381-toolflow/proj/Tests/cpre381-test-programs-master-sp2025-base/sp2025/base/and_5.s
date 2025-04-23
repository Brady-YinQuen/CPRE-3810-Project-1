.data
.text
.globl main
main:
	#What am I testing:
	#Test 3 ensures that any value in a register anded with the same value in another
	#register will simply result in the same value.
	
	#Start Test
	
	#Sets $t0 = 0x12345678
	lui $t0, 0x1234
	addi $t0, $t0, 0x5678
	
	#Sets $t1 = 0x12345678
	lui $t1, 0x1234
	addi $t1, $t1, 0x5678
	
	#Ensure that $t2 is 0x12345678
	and $t2, $t0, $t1
	
	# End Test

	# Exit program
	halt