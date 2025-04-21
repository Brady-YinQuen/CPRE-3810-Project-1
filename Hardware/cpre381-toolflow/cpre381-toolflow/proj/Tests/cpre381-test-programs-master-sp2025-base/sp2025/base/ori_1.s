.text
.globl main
main:
	#ORI Test: Verify bitwise OR operation across different values
	li $t0, 0x00000000 #All bits 0(minimum value)
	ori $t1, $t0, 0xFFFFFFFF #OR with all 1s -> Expected result: 0xFFFFFFFF
	
	li $t2, 0x80000000 #Only the highest bit set (sign bit)
	ori  $t3, $t2, 0x7FFFFFFF #OR with lower 31 bits set -> Expected result : 0xFFFFFFFF
	
	li $t4, 0x0000FFFF #Lower 16 bitys set
	ori $t5, $t4, 0xFFFF0000 #OR with upper 16 bits set -> Expected result : 0xFFFFFFFF
	
	halt