.data
array: .word 0x11111111, 0x22222222, 0x33333333, 0x44444444
.text
.globl main
main:
	#justification: verification that loading the registers using memory addresses works and referencing them in different ways works
	#loading memory address locations into first 4 registers
	la $1, array    #load memory address into $1
	la $2, array+4  #load memory address starting at bit 4 into $2
	la $3, array+8  #load memory address starting at bit 8 into $3
	la $4, array+12 #load memory address starting at bit 12 into $4
	#loading information from one register with whole memory address into registers 5-8
	lw $5, 0($1)    #load the contents of register at memory address in $1 to $5
	lw $6, 4($1)    #load the contents of register at memory address in $1 starting at bit 4 to $6
	lw $7, 8($1)    #load the contents of register at memory address in $1 starting at bit 8 to $7
	lw $8, 12($1)   #load the contents of register at memory address in $1 starting at bit 12 to $8
	#loading information from different resgisters with different parts of the original address into registers 9-12
	lw $9, 0($1)    #load the contents of register at memory address in $1 to $9
	lw $10, 0($2)   #load the contents of register at memory address in $2 to $10
	lw $11, 0($3)   #load the contents of register at memory address in $3 to $11
	lw $12, 0($4)   #load the contents of register at memory address in $4 to $12
	halt
	#$1 = 0x10010000
	#$2 = 0x10010004
	#$3 = 0x10010008
	#$4 = 0x1001000C
	#$5 = 0x11111111
	#$6 = 0x22222222
	#$7 = 0x33333333
	#$8 = 0x44444444
	#$9 = 0x11111111
	#$10= 0x22222222
	#$11= 0x33333333
	#$12= 0x44444444