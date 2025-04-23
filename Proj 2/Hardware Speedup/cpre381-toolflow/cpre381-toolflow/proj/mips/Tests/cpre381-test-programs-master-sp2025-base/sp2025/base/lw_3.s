.data
array: .word 0x11111111, 0x22222222, 0x33333333, 0x44444444
.text
.globl main
main:
#justification: verification that loading different parts of an array of words using the second part of the instruction
#loads different values of an array to each register, ensuring that offset part of instruction works
	lw $1, array      #value in $1 should be 0x11111111
	lw $2, array+4    #value in $2 should be 0x22222222
	lw $3, array+8    #value in $3 should be 0x33333333
	lw $4, array+12   #value in $4 should be 0x44444444
	lw $5, array      #value in $5 should be 0x11111111
	lw $6, array+4    #value in $6 should be 0x22222222
	lw $7, array+8    #value in $7 should be 0x33333333
	lw $8, array+12   #value in $8 should be 0x44444444
	lw $9, array      #value in $9 should be 0x11111111
	lw $10, array+4   #value in $10 should be 0x22222222
	lw $11, array+8   #value in $11 should be 0x33333333
	lw $12, array+12  #value in $12 should be 0x44444444
	lw $13, array     #value in $13 should be 0x11111111
	lw $14, array+4   #value in $14 should be 0x22222222
	lw $15, array+8   #value in $15 should be 0x33333333
	lw $16, array+12  #value in $16 should be 0x44444444
	lw $17, array     #value in $17 should be 0x11111111
	lw $18, array+4   #value in $18 should be 0x22222222
	lw $19, array+8   #value in $19 should be 0x33333333
	lw $20, array+12  #value in $20 should be 0x44444444
	lw $21, array     #value in $21 should be 0x11111111
	lw $22, array+4   #value in $22 should be 0x22222222
	lw $23, array+8   #value in $23 should be 0x33333333
	lw $24, array+12  #value in $24 should be 0x44444444
	lw $25, array     #value in $25 should be 0x11111111
	lw $26, array+4   #value in $26 should be 0x22222222
	lw $27, array+8   #value in $27 should be 0x33333333
	lw $28, array+12  #value in $28 should be 0x44444444
	lw $29, array     #value in $29 should be 0x11111111
	lw $30, array+4   #value in $30 should be 0x22222222
	lw $31, array+8   #value in $31 should be 0x33333333
	
	halt
