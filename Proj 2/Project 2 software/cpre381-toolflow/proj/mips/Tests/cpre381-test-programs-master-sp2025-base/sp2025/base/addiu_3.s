.data
.text
.globl main
main:
#Start test
#Testing adding a large positive number to a small negative number for overflow
addiu $1, $0, 0xFFFF    #0-1 into t1
addiu $1, $1, 0x0065    #(-1)+101 into t1
#End test

#Exit program
halt
