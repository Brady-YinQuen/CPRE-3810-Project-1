.data
	test_array: .word 0x12345678,0xDEADBEEF,0xCAFECAFE,0xFFFFFFFF
	
.text
.globl main

#This unit test verifies that the offsetting works properly. No iteration of base address Checks positive and negative offsetting

main:
	lui $t0, 0x1001 #Loads memory base address into $t0
	addiu $t0, $t0, 0x0000 #complated base address load	
	lw $s0, 0($t0) #$s0 should contain 0x12345678
	lw $s1, 4($t0) #$s1 should contain 0xDEADBEEF
	addiu $t0, $t0, 16 #offset the address to past the last element
	lw $s2, -8($t0) #$s2 should contain 0xCAFECAFE
	lw $s3, -4($t0) #$s3 should contain 0xFFFFFFFF

	
	halt