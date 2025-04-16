test2:
lui $s0, 0x0 # $s0 = 0x00000001
addi $s0, $s1, 0x0001 
lui $s1, 0xFFFF # $s1 = 0xFFFFFFFE
addi $s1, $s1, 0xFFFE

nor $t0, $s1, $s0 # Expected = 0
halt
