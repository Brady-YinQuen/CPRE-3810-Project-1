.data
.text
.globl main
main:
#this will test that every register can do a comparison correctly
addi $t1, $0, 1
Loop: #this will cause a loop if any register matches $t1
beq $t1, $zero, Loop
beq $t1, $at, Loop
beq $t1, $v0, Loop
beq $t1, $a0, Loop
beq $t1, $a1, Loop
beq $t1, $a2, Loop
beq $t1, $a3, Loop
beq $t1, $t0, Loop
beq $t1, $t2, Loop
beq $t1, $t3, Loop
beq $t1, $t4, Loop
beq $t1, $t5, Loop
beq $t1, $t6, Loop
beq $t1, $t7, Loop
beq $t1, $s0, Loop
beq $t1, $s1, Loop
beq $t1, $s2, Loop
beq $t1, $s3, Loop
beq $t1, $s4, Loop
beq $t1, $s5, Loop
beq $t1, $s6, Loop
beq $t1, $s7, Loop
beq $t1, $t8, Loop
beq $t1, $t9, Loop
beq $t1, $k0, Loop
beq $t1, $k1, Loop
beq $t1, $gp, Loop
beq $t1, $sp, Loop
beq $t1, $fp, Loop
beq $t1, $ra, Loop
beq $t1, $t1, exit
addi $t1, $t1, 1 #$t1 will end with 2 as a value if comparing to itself doesn't work

exit:

halt

