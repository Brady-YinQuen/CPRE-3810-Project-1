.data
.text
.global main

main:	

	#Test 3: Shift right by the maximum (32)
	# this is edge case test for the maximum value
	#I am implementing this test to check if overflow works and to make sure instrucctions work for the highest value
	
	addi $t1, $t1, 0x10101010 #add 0xF0F0F0F0 to $t1 
	addi $t3, $t3, 0x00001111 #add 0xF0F0F0F0 to $t3
	addi $t4, $t4, 0x11111111 #add 0xF0F0F0F0 to $t4
	addi $t5, $t5, 0x11111111 #add 0xF0F0F0F0 to $t5
	addi $t6, $t6, 0x10101010 #add 0xF0F0F0F0 to $t6
	addi $t7, $t7, 0x11111111 #add 0xF0F0F0F0 to $t7
	addi $t8, $t8, 0x01010101 #add 0xF0F0F0F0 to $t8
	addi $t2, $zero, 0xFFFFFFFF # load shift value of 32 into $t2
	srlv $t1, $t1, $t2 #shift $t1 right by $t2 bits
	srlv $t3, $t3, $t2 #shift $t3 right by $t2 bits
	srlv $t4, $t4, $t2 #shift $t4 right by $t2 bits
	srlv $t5, $t5, $t2 #shift $t5 right by $t2 bits
	srlv $t6, $t6, $t2 #shift $t6 right by $t2 bits
	srlv $t7, $t7, $t2 #shift $t7 right by $t2 bits
	srlv $t8, $t8, $t2 #shift $t8 right by $t2 bits
	#t4 should be 0x00000000 because it is shifting beyond the register size
	
	halt