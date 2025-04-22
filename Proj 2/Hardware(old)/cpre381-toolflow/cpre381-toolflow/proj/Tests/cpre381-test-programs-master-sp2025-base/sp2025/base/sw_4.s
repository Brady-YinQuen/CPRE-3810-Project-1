# this file is for testing all sorts of edge cases, edges in the memory and in the values being stored
#It is important to be able to store all numbers in all available locations 

#----------Load Values-------------

#first load the very first memory location 0x1001_0000
lui $t0, 0x1001

#load the last memory location 0x1001_01E0
lui $t1, 0x1001
addiu $t1, $t1, 0x01E0

#load The max positive value into a register
lui $t2, 0x7FFF
addiu $t2, $t2, 0xFFFF

#load the max negative value into a register
lui $t3, 0x8000

#load a register with all bits set
lui $t4, 0xFFFF
addiu $t4, $t4, 0xFFFF

#--------Begin Storing-------------

#Store the max positive value into memory location 1
sw $t2, 0($t0)

#Store the max negative value into the last  memory location
sw $t3, 0x1c($t1)

#Store the zero value to a negative offset
sw $zero, -4($t1)

#store a value with all bits set to a negative offset
sw $t4, -12($t1)

#try to store outside a scope -- SHOULD CAUSE EXCEPTION/Not Execute
sw $t2, -4($t0)

halt
