.data
.text
.globl main
main:

	# This test file ensures that subu can correctly 0 out all registers.
	# This test also includes subu $0, $0, $0, to ensure $0 remains
	# unchanged.  
	
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
	addiu $30, $0, 30 # Load the registers number into the register
	addiu $31, $0, 31 # Load the registers number into the register
	
	# Start test
	
	# The following test ensures that subu can be used to clear every register.
	subu $0, $0, $0 # Ensures $0 doesnt get updated.
	# You never know when someone's processor might accidentally write to the 0 reg with a subu instruction.
        subu $1, $1, $1 # Clears the cooresponding register.
        subu $2, $2, $2 # Clears the cooresponding register.
        subu $3, $3, $3 # Clears the cooresponding register.
        subu $4, $4, $4 # Clears the cooresponding register.
        subu $5, $5, $5 # Clears the cooresponding register.
        subu $6, $6, $6 # Clears the cooresponding register.
        subu $7, $7, $7 # Clears the cooresponding register.
        subu $8, $8, $8 # Clears the cooresponding register.
        subu $9, $9, $9 # Clears the cooresponding register.
        subu $10, $10, $10 # Clears the cooresponding register.
        subu $11, $11, $11 # Clears the cooresponding register.
        subu $12, $12, $12 # Clears the cooresponding register.
        subu $13, $13, $13 # Clears the cooresponding register.
        subu $14, $14, $14 # Clears the cooresponding register.
        subu $15, $15, $15 # Clears the cooresponding register.
        subu $16, $16, $16 # Clears the cooresponding register.
        subu $17, $17, $17 # Clears the cooresponding register.
        subu $18, $18, $18 # Clears the cooresponding register.
        subu $19, $19, $19 # Clears the cooresponding register.
        subu $20, $20, $20 # Clears the cooresponding register.
        subu $21, $21, $21 # Clears the cooresponding register.
        subu $22, $22, $22 # Clears the cooresponding register.
        subu $23, $23, $23 # Clears the cooresponding register.
        subu $24, $24, $24 # Clears the cooresponding register.
        subu $25, $25, $25 # Clears the cooresponding register.
        subu $26, $26, $26 # Clears the cooresponding register.
        subu $27, $27, $27 # Clears the cooresponding register.
        subu $28, $28, $28 # Clears the cooresponding register.
        subu $29, $29, $29 # Clears the cooresponding register.
        subu $30, $30, $30 # Clears the cooresponding register.
        subu $31, $31, $31 # Clears the cooresponding register.
	# After this test, every register should hold 0x00000000
	
	# Exit program
	halt
