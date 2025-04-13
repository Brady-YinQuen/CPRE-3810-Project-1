#ori with a large number in reg and in imeadiate
# This case covers proper output given two ones as input
addi $s0, $zero, 0xFFFFFFFF # in order to 
ori $s1, $s0, 0xFFFFFFFF
halt
