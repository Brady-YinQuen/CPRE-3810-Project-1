.data
.text
.globl main
#The point of this test is to check that the it can jump between different portions of the code that is not sequential and use multiple types of registers to jump
#Start Test

main:
la $s1, first #load into s register
la $t1, second #load into t register
la $ra, third #load into return address register
la $a0, fourth #load into agrument register
la $v0, exit #load into result register
jr $t1 #jump to second label

first:
jr $a0 #jump to fourth label

second:
jr $s1 #jump to first label


third:
jr $v0 #jump to exit

fourth:
jr $ra #jump to third label


#end test
exit:

#exit program
halt