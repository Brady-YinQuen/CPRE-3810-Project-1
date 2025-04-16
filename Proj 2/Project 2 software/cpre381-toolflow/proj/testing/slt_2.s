.text

#Test case 2: zero vs positive, zero vs negative, large positive vs small negative 

#These test cases verify that slt correctly handles comparisons involving zero and extreme signed integer values. 
#Tests can also be used to verify that sign extension modules are working correctly. 

#assignments
addi $t0, $0, 0
addi $t1, $0, 15
addi $t2, $0, -15
addi $t3, $0, 0x7FFFFFFF
addi $t4, $0, 0x80000000

#zero vs positive, expect 1 in $t5
slt $t5, $t0, $t1

#zero vs negative, expect 0 in $t6
slt $t6, $t0, $t2 

#large positive vs small negative, expect 0 in $t7
slt $t7, $t3, $t4
halt
