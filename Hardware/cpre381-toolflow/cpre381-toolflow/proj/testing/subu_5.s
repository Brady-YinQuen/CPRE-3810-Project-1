.data
.text
.globl main
main:

	# This file tests the usage of subu to negate a register.

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
	
	# Testing the neg (Negate) pseudoinstruction.
	# neg does use sub instead of subu, meaning 0x80000000 would give an
	# overflow, however using subu instead should not result in this. 
	# These tests ensures this works as intended.
	subu $0, $0, $0 # Negates the following register.
        subu $1, $0, $1 # Negates the following register.
        subu $2, $0, $2 # Negates the following register.
        subu $3, $0, $3 # Negates the following register.
        subu $4, $0, $4 # Negates the following register.
        subu $5, $0, $5 # Negates the following register.
        subu $6, $0, $6 # Negates the following register.
        subu $7, $0, $7 # Negates the following register.
        subu $8, $0, $8 # Negates the following register.
        subu $9, $0, $9 # Negates the following register.
        subu $10, $0, $10 # Negates the following register.
        subu $11, $0, $11 # Negates the following register.
        subu $12, $0, $12 # Negates the following register.
        subu $13, $0, $13 # Negates the following register.
        subu $14, $0, $14 # Negates the following register.
        subu $15, $0, $15 # Negates the following register.
        subu $16, $0, $16 # Negates the following register.
        subu $17, $0, $17 # Negates the following register.
        subu $18, $0, $18 # Negates the following register.
        subu $19, $0, $19 # Negates the following register.
        subu $20, $0, $20 # Negates the following register.
        subu $21, $0, $21 # Negates the following register.
        subu $22, $0, $22 # Negates the following register.
        subu $23, $0, $23 # Negates the following register.
        subu $24, $0, $24 # Negates the following register.
        subu $25, $0, $25 # Negates the following register.
        subu $26, $0, $26 # Negates the following register.
        subu $27, $0, $27 # Negates the following register.
        subu $28, $0, $28 # Negates the following register.
        subu $29, $0, $29 # Negates the following register.
        subu $30, $0, $30 # Negates the following register.
        subu $31, $0, $31 # Should remain unchanged, as subu does not have overflow.
        # After these tests, all registers should have flipped their sign, except for 31, 
        # which does not have a positive equivalent as a 32 bit int.
	
	# Exit program
	halt