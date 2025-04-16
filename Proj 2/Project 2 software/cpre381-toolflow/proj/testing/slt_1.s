.text

#Test case 1: slt on equal values, negative vs positive, positive vs negative

#These test cases are designed to verify the correct 
#functionality of slt by testing edge cases such as comparing equal values and signed numbers with different signs.

#assignments
addi $t0, $0, 15
addi $t1, $0, 15
addi $t2, $0, -15

#equal values, expect 0 in $t3
slt $t3, $t1, $t2

#negative vs positive, expect 1 in $t4
slt $t4, $t2, $t1 

#positive vs negative, expect 0 in $t5
slt $t5, $t1, $t2
halt
