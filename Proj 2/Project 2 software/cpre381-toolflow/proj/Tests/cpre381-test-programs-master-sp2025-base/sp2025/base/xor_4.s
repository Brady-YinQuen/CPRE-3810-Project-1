.data
.text
.globl main
main:

#This test will load x0000FFFF into both and test if it will 
#Correctly xor to 0x0,
#After that it will test the functionallity of it to xor 
#0xFFFF and 0x0000 which should keep 0xFFFF. 
#for both cases 1 and 2 it does it with s0, s1 and then s1, s0 in order
#To see if it correctly works for each order inputs.
# The last case is to see if it can load -1 and correctly
#use it as if it was 0xFFFFFFFF which is what we expect from loading -1. 

addiu $s0, $zero, 0xFFFF #Load 0xFFFF
addiu $s1, $zero, 0xFFFF #Load 0xFFFF
xor $s3, $s0, $s1 # Testing it. Expect 0x0000
xor $s4, $s1, $s0 #Flip the order and make sure it works too
addiu $s0, $zero, 0x0000 #Load 0xFFFF
xor $s3, $s1, $s0 #Expect FFFF => $s3
xor $s4, $s1, $s0 #Expect FFFF => $s4

addi $s0, $s0, -1 #Expect 0xFFFFFFFF
addiu $s1, $zero, 0xBBBB #Load 0x0000BBBB
xor $s5, $s1, $s0 #Expect 0xFFFF4444 => $s5

halt
