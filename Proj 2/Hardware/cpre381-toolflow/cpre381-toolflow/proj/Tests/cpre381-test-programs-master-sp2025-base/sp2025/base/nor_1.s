test1:
lui $s0, 0xAA55 # A = 1010, 5 = 0101
addi $s0, $s0, 0xAA55 # $s0 = AA55AA55
lui $s1, 0xAAAA
addi $s1, $s1, 0x5555 # $s1 = AAAA5555 

nor $t0, $s0, $s1 # Expecting: 0x550000AA
halt
