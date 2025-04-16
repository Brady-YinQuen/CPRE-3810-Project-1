test3:
and $s0, $s0, $zero # Ensure $s0 = 0
and $s1, $s1, $zero # Ensure $s1 = 0

nor $t0, $s0, $s1 # Expected = 0xFFFFFFFF
halt
