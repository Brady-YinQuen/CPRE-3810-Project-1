#Test Case 3: Jump and Execute Multiple Instructions
#Verifies execution continues after the jump.

.text
.globl main
main:
li $t0, 10
j continue_exec
li $t0, 20
continue_exec:
li $t1, 30
li $t2, 40

li $v0, 10
halt
