.text
.globl main
main:
	#ORI Test: Check if overflow occurs
	
	li $t0, 0x7FFFFFFF #Maximum positive integer (32-bit)
	ori $t1, $t0, 0x80000000 # OR with highest bit set -> Expected result: 0xFFFFFFFF (should work correctly)

    	li $t2, 0xFFFFFFFF       # All bits set (negative -1)
    	ori $t3, $t2, 0x00000000 # OR with 0 -> Value should remain unchanged (0xFFFFFFFF)

    halt