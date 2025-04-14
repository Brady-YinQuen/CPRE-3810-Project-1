.data
value: .word 0x12345678
.text
.globl main
main:
#justification: verifying that an immediate value can be loaded into a register using the lw instruction
#loads the same value 0x12345678 into each register, check to make sure each register reads 0x12345678, except $0, that should remain 0x0
	lw $1, value #loads value 0x12345678 into register $1
	lw $2, value #loads value 0x12345678 into register $2
	lw $3, value #loads value 0x12345678 into register $3
	lw $4, value #loads value 0x12345678 into register $4
	lw $5, value #loads value 0x12345678 into register $5
	lw $6, value #loads value 0x12345678 into register $6
	lw $7, value #loads value 0x12345678 into register $7
	lw $8, value #loads value 0x12345678 into register $8
	lw $9, value #loads value 0x12345678 into register $9
	lw $10, value #loads value 0x12345678 into register $10
	lw $11, value #loads value 0x12345678 into register $11
	lw $12, value #loads value 0x12345678 into register $12
	lw $13, value #loads value 0x12345678 into register $13
	lw $14, value #loads value 0x12345678 into register $14
	lw $15, value #loads value 0x12345678 into register $15
	lw $16, value #loads value 0x12345678 into register $16
	lw $17, value #loads value 0x12345678 into register $17
	lw $18, value #loads value 0x12345678 into register $18
	lw $19, value #loads value 0x12345678 into register $19
	lw $20, value #loads value 0x12345678 into register $20
	lw $21, value #loads value 0x12345678 into register $21
	lw $22, value #loads value 0x12345678 into register $22
	lw $23, value #loads value 0x12345678 into register $23
	lw $24, value #loads value 0x12345678 into register $24
	lw $25, value #loads value 0x12345678 into register $25
	lw $26, value #loads value 0x12345678 into register $26
	lw $27, value #loads value 0x12345678 into register $27
	lw $28, value #loads value 0x12345678 into register $28
	lw $29, value #loads value 0x12345678 into register $29
	lw $30, value #loads value 0x12345678 into register $30
	lw $31, value #loads value 0x12345678 into register $31
	
	halt
