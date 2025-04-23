# Test 1: Basic OR operation
# This test checks a simple OR between two registers with non-zero values.

# I have to use addi to initalize the registers with values for them to be non-zero
# Confirmed proper function of registers a0, a1, v0

addi $a0, $zero, 0xAA   # $t0 = 0xAA
addi $a1, $zero, 0xCC   # $t1 = 0xCC
or   $v0, $a0, $a1      # $t2 should be 11101110 which is 0xEE
halt
