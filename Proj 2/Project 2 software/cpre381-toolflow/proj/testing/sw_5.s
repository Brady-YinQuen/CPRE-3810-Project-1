 #this file is for testing that overwrriting the values causes no exceptions or errors
 #this is important because you need to store and overwrite values due to storage limits

#----------Load Values-------------

#first load the very first memory location 0x1001_0000
lui $t0, 0x1001


#load The value into a register
lui $t2, 0xFFFF
addiu $t2, $t2, 0xFFFF

#load another value
lui $t3, 0xF00F
addiu $t3, $t3, 0xF00F


#--------Begin Storing-------------

#Store the first val into memory
sw $t2, 0($t0)

#overwrite the val with 0
sw $zero, 0($t0)

#overwrite the value again
sw $t3, 0($t0)

halt
