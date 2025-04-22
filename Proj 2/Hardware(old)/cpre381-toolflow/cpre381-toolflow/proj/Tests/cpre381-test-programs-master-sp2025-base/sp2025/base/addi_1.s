.data
.text
.globl main
main:
addi $t0, $zero, 5 #Add 0 + 5 = 5

addi $t1, $t0, 10 #Add $t0(5) + 10 = 15

# Testing common case functionality of mips addi
# Using the $zero + immed register tests register innitalization
# Using temp reg value and immediate tests for arithmatic 

halt 