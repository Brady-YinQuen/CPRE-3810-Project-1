#Test Case 1: Basic Jump Functionality
#Confirms j skips the next instruction and lands at the target label.

.text
.globl main
main:
li $t0, 1
j target_label
li $t0, 2
target_label:
li $t1, 3
li $v0, 10
halt
