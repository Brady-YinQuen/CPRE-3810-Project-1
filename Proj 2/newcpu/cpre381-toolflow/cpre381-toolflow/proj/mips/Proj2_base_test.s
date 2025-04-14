# Project 1 - Part 2 - Simple Test (All Instructions supportd) 
# Laith Al Sairafi


jal func # Does not write back (1)
nop
 
halt # End The Program 

func:

addiu $t1, $zero, 10 	# $t1 = 0x0000000A (2)
addiu $t2, $zero, 20	# $t1 = 0x00000014 (2)

cond:

nop
nop
nop
slt $t2, $t1, $t2	# $t2 = 0x00000001 (3)

nop
nop
nop
beq $t2, $zero, else	# Does not write back (4)
nop

body:

add $t1, $zero, $zero 	# $t1 = 0x00000000 (5)
addi $t1, $zero, 2 	# $t1 = 0x00000002 (6)
nop
nop
nop
addu $t2, $t1, $t1 	# $t2 = 0x00000004 (7)
and $t3, $t1, $t1	# $t3 = 0x00000002 (8)
andi $t4, $t1, 3	# $t4 = 0x00000002 (9)
nor $t5, $t1, $zero	# $t5 = 0xFFFFFFFD (10)
xor $t6, $t1, $zero	# $t6 = 0x00000002 (11)
xori $t7, $t1, 0x000F	# $t1 = 0x0000000D (12)
or $t1, $t2, $t3	# $t1 = 0x00000006 (13)
nop
nop
nop
ori $t1, $t1, 0x0003	# $t1 = 0x00000007 (14)
nop
nop
nop
sll $t1, $t1, 31	# $t1 = 0x80000000 (15)
nop
nop
nop
srl $t2, $t1, 31	# $t2 = 0x00000001 (16)
sra $t3, $t1, 31	# $t3 = 0xFFFFFFFF (17)
sub $t1, $t1, $zero	# $t1 = 0x80000000 (18)
nop
subu $t2, $t2, $zero	# $t2 = 0x00000001 (19)
nop
nop
nop
lui $s0, 0x1001	# $s0 = 0x01010000 (20)
sllv $t4, $t1, $t2	# $t4 = 0x00000000 (21)
srlv $t5, $t1, $t3	# $t5 = 0x00000001 (22)
srav $t6, $t1, $t2	# $t6 = 0xC0000000 (23)
sw $t2, 0($s0)	# M[0x01010000] = 0x00000001 (23)
lb $a0, 0($s0)	# $a0 = 0x00000001 (24)
lbu $a1, 0($s0)	# $a1 = 0x00000001 (25)
lh $a2, 0($s0)	# $a2 = 0x00000001 (26)
lhu $a3, 0($s0)	# $a3 = 0x00000001 (27)
lw $s1, 0($s0)	# $s1 = 0x00000001 (28)
slti $t1, $t4, 0	# $t1 = 0x00000000 (29)
nop
nop
nop
bne  $t1, $zero, else 	# Does not write back (30)
nop
j exit	# Does not write back (31)
nop

halt

else:

# Nothing

exit:

jr $ra	# Does not write back (32)
nop
