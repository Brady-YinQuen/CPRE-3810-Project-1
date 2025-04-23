# Test 3: OR with All Bits Set
# This test ensures OR with all bits set results in all bits being set.

# Need to use addi to load some value in so it is a non-zero value (all one's in this case)
# Confirmed proper function of registers s0, s1, and zero reg again

addi $s0, $zero, 0xFFFFFFFF   # $t0 = 0xFFFFFFFF (all bits set)
or   $s1, $s0, $zero          # OR the value with all a register (all 0's in this case)
			      # Expect register output to be all ones: $t1 = 0xFFFFFFFF
halt
