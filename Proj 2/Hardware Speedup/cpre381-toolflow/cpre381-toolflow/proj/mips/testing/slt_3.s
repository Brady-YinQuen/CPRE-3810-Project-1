.text

#Test case 2: small negative vs large positive, small negative vs small positive, -1 vs 0

#This is similar to the previous test cases, but does a more comprehensive test of sign extension/zero extension.  

#assignments
addi $t0, $0, 0
addi $t1, $0, 0xFFFFFFFF
addi $t2, $0, 0x00000001
addi $t3, $0, 0x7FFFFFFF
addi $t4, $0, 0x80000000

#small negative vs large positive, expect 1
slt $t5, $t4, $t3

#small negative vs small positive, expect 1
slt $t6, $t4, $t2 

#-1 vs 0, expect 1
slt $t7, $t1, $t0
halt
