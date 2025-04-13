# Test 4: OR with Itself and store into $zero
# This test checks if a register ORed with something that it does not write over he $zero register

# Must use addi to load in some value so the register is non zero
# Confirming or does not overwrite the $zero regiser

addi $t0, $zero, 0xABCD          # $t0 = 0xABCD
or   $zero, $t0, $t0             # $zero should be unchanged (all 0's)
halt
