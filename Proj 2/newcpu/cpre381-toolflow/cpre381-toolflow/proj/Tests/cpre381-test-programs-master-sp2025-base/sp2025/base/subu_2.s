.data
.text
.globl main
main:
	
	# This test file ensures that subtracting a register by 0 does not affect 
	# the value stored in the register.
	# By testing all registers, the test ensures that subu does not introduce any 
	# register-specific errors.
 
	
	# Load values into registers
	# addiu is above subu in the list, making it acceptable to use to load values into registers
	addiu $1, $0, 1 # Load the registers number into the register
	addiu $2, $0, 2 # Load the registers number into the register
	addiu $3, $0, 3 # Load the registers number into the register
	addiu $4, $0, 4 # Load the registers number into the register
	addiu $5, $0, 5 # Load the registers number into the register
	addiu $6, $0, 6 # Load the registers number into the register
	addiu $7, $0, 7 # Load the registers number into the register
	addiu $8, $0, 8 # Load the registers number into the register
	addiu $9, $0, 9 # Load the registers number into the register
	addiu $10, $0, 10 # Load the registers number into the register
	addiu $11, $0, 11 # Load the registers number into the register
	addiu $12, $0, 12 # Load the registers number into the register
	addiu $13, $0, 13 # Load the registers number into the register
	addiu $14, $0, 14 # Load the registers number into the register
	addiu $15, $0, 15 # Load the registers number into the register
	addiu $16, $0, 16 # Load the registers number into the register
	addiu $17, $0, 17 # Load the registers number into the register
	addiu $18, $0, 18 # Load the registers number into the register
	addiu $19, $0, 19 # Load the registers number into the register
	addiu $20, $0, 20 # Load the registers number into the register
	addiu $21, $0, 21 # Load the registers number into the register
	addiu $22, $0, 22 # Load the registers number into the register
	addiu $23, $0, 23 # Load the registers number into the register
	addiu $24, $0, 24 # Load the registers number into the register
	addiu $25, $0, 25 # Load the registers number into the register
	addiu $26, $0, 26 # Load the registers number into the register
	addiu $27, $0, 27 # Load the registers number into the register
	addiu $28, $0, 28 # Load the registers number into the register
	addiu $29, $0, 29 # Load the registers number into the register
	addiu $30, $0, 0xFFFFFFFF # Loads -1 into the register
	lui $31, 0x8000 # Loads the smallest signed number into register 31
	
	# Start test

        # These tests ensure that subtraction by 0 does not affect register value
        subu $0, $0, $0 
        subu $1, $1, $0
        subu $2, $2, $0
        subu $3, $3, $0
        subu $4, $4, $0
        subu $5, $5, $0
        subu $6, $6, $0
        subu $7, $7, $0
        subu $8, $8, $0
        subu $9, $9, $0
        subu $10, $10, $0
        subu $11, $11, $0
        subu $12, $12, $0
        subu $13, $13, $0
        subu $14, $14, $0
        subu $15, $15, $0
        subu $16, $16, $0
        subu $17, $17, $0
        subu $18, $18, $0
        subu $19, $19, $0
        subu $20, $20, $0
        subu $21, $21, $0
        subu $22, $22, $0
        subu $23, $23, $0
        subu $24, $24, $0
        subu $25, $25, $0
        subu $26, $26, $0
        subu $27, $27, $0
        subu $28, $28, $0
        subu $29, $29, $0
        subu $30, $30, $0
        subu $31, $31, $0
        # After these tests, each register's value should not change.
        
	# Exit program
	halt
