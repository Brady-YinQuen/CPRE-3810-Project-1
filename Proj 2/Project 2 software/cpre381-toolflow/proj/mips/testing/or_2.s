# Test 2: OR with Zero
# This test verifies OR with zero produces the original value.

# Must use addi to set a non-zero value for the test.
# Confirmed proper function of registers t0, t1, zero reg

addi $t0, $zero, 0x12345678   # Load some random value
or   $t1, $t0, $zero          # OR with zero, expected $t1 = $t0 (0x12345678)
halt
