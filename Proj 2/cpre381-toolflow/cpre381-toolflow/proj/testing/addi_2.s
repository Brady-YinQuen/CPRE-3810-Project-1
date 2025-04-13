.data
.text
.globl main
main:
addi $t0, $zero, -5 #Add 0 + (-5) = -5

addi $t1, $t0, -10 #Add (-5) + (-10)

# Test common case of adding negatives
# Tests uses #zero + negative for initalization
# Testing using reg value and immediate tests for arithmetic 

halt
