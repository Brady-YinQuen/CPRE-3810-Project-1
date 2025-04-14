.data
.text
.globl main
main:

#This will test if XOR works correctly on its own register
#This should result in all the S registers being reset to 0x0
#I preload them with random values.
#Load random vals
addiu $s0, $zero, 0xFFFF
addiu $s1, $zero, 0x0001
addiu $s2, $zero, 0x1001
addiu $s3, $zero, 0xFAB1
addiu $s4, $zero, 0xAF1B
lui $s5, 0x1234 #Load upper for one of the examples
addiu $s5, $zero, 0x5677
addiu $s6, $zero, 0x9999
addiu $s7, $zero, 0x4535

#Test XOR with itself (Should clear a register)
xor $s0, $s0, $s0 #Expecting => 0x0
xor $s1, $s1, $s1 #Expecting => 0x0
xor $s2, $s2, $s2 #Expecting => 0x0
xor $s3, $s3, $s3 #Expecting => 0x0
xor $s4, $s4, $s4 #Expecting => 0x0
xor $s5, $s5, $s5 #Expecting => 0x0
xor $s6, $s6, $s6 #Expecting => 0x0
xor $s7, $s7, $s7 #Expecting => 0x0

halt
