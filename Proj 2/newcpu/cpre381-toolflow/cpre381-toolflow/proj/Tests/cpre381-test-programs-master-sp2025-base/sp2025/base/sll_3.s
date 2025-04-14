.data
.text
.globl main
#case 3: loading up with alternating 01's. this one is more to stress test it all the way - it gets carried across many registers.
main:
addiu $2, $0, 1
sll $3, $2, 2
addiu $4, $3, 1
sll $5, $4, 2
addiu $6, $5, 1
sll $7, $6, 2
addiu $8, $7, 1
sll $9, $8, 2
addiu $10, $9, 1
sll $11, $10, 2
addiu $12, $11, 1
sll $13, $12, 2
addiu $14, $13, 1
sll $15, $14, 2
addiu $16, $15, 1
sll $17, $16, 2
addiu $18, $17, 1
sll $19, $18, 2
addiu $20, $19, 1
sll $21, $20, 2
addiu $22, $21, 1
sll $23, $22, 2
addiu $24, $23, 1
sll $25, $24, 2
addiu $26, $25, 1
sll $27, $26, 2
addiu $28, $27, 1
sll $29, $28, 2
addiu $30, $29, 1
sll $31, $30, 2
addiu $1, $31, 1
#outcome: $1 = 0x55555555
halt
