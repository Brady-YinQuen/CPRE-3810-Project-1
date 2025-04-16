.data
.text
.global main

main:	

	#Test 2: Shifting with Minimum (0)
	#this is to test if the value would stay the same, this test is to test the minimum edge case
	#I am implementing this test to check for underflow and to see if a minimum value will still work with the instruction
	
	addi $t1, $t1, 16 #add 16 (0x00000010) to $t1 
	addi $t3, $t3, 32 #add 32 (0x00000100) to $t3
	addi $t4, $t4, 48 #add 48 (0x00001000) to $t4
	addi $t5, $t5, 64 #add 64 (0x00010000) to $t5
	addi $t6, $t6, 80 #add 80 (0x00100000) to $t6
	addi $t7, $t7, 96 #add 96 (0x01000000) to $t7
	addi $t8, $t8, 112 #add 64 (0x10000000) to $t8
	add $t2, $zero, $zero  #load shift value 0 into $t2
	srlv $t1, $t1, $t2 #shift $t1 right by $t2 bits
	srlv $t3, $t3, $t2 #shift $t3 right by $t2 bits
	srlv $t4, $t4, $t2 #shift $t4 right by $t2 bits
	srlv $t5, $t5, $t2 #shift $t5 right by $t2 bits
	srlv $t6, $t6, $t2 #shift $t6 right by $t2 bits
	srlv $t7, $t7, $t2 #shift $t7 right by $t2 bits
	srlv $t8, $t8, $t2 #shift $t8 right by $t2 bits
	#$t3 should remain the same
	
	halt
	