.data
.text
.globl main
main:
# Edge Case, Add two values to overflow to 0
# important edge case, as we do not want the trigger an exception after overflow
# First we will write 0xFFFFFFFF to all the registers, then add 1 to each one, expecting a 0 across all registers, except 1

# set up, $1 = 0xFFFFFFFF 
lui $3, 0xFFFF
addiu $2, $0, 0xFFFF
addu $3 $3, $2
addu $1, $3, $0

# set up, $t1 = 0x00000001
addiu $2, $0, 0x01

# Set all registers to 0xFFFFFFFF
addu $3, $1, $0    # Set register to 0xFFFFFFFF
addu $4, $1, $0    # Set register to 0xFFFFFFFF
addu $5, $1, $0    # Set register to 0xFFFFFFFF
addu $6, $1, $0    # Set register to 0xFFFFFFFF
addu $7, $1, $0    # Set register to 0xFFFFFFFF
addu $8, $1, $0    # Set register to 0xFFFFFFFF
addu $9, $1, $0    # Set register to 0xFFFFFFFF
addu $10, $1, $0    # Set register to 0xFFFFFFFF
addu $11, $1, $0    # Set register to 0xFFFFFFFF
addu $12, $1, $0    # Set register to 0xFFFFFFFF
addu $13, $1, $0    # Set register to 0xFFFFFFFF
addu $14, $1, $0    # Set register to 0xFFFFFFFF
addu $15, $1, $0    # Set register to 0xFFFFFFFF
addu $16, $1, $0    # Set register to 0xFFFFFFFF
addu $17, $1, $0    # Set register to 0xFFFFFFFF
addu $18, $1, $0    # Set register to 0xFFFFFFFF
addu $19, $1, $0    # Set register to 0xFFFFFFFF
addu $20, $1, $0    # Set register to 0xFFFFFFFF
addu $21, $1, $0    # Set register to 0xFFFFFFFF
addu $21, $1, $0    # Set register to 0xFFFFFFFF
addu $23, $1, $0   # Set register to 0xFFFFFFFF
addu $24, $1, $0    # Set register to 0xFFFFFFFF
addu $25, $1, $0    # Set register to 0xFFFFFFFF
addu $26, $1, $0    # Set register to 0xFFFFFFFF
addu $27, $1, $0    # Set register to 0xFFFFFFFF
addu $28, $1, $0    # Set register to 0xFFFFFFFF
addu $29, $1, $0    # Set register to 0xFFFFFFFF
addu $30, $1, $0    # Set register to 0xFFFFFFFF
addu $31, $1, $0    # Set register to 0xFFFFFFFF

#Test overflow

addu $1, $2, $1    # Set register to 0xFFFFFFFF
addu $3, $2, $3    # Set register to 0xFFFFFFFF
addu $4, $2, $4    # Set register to 0xFFFFFFFF
addu $5, $2, $5    # Set register to 0xFFFFFFFF
addu $6, $2, $6    # Set register to 0xFFFFFFFF
addu $7, $2, $7    # Set register to 0xFFFFFFFF
addu $8, $2, $8    # Set register to 0xFFFFFFFF
addu $9, $2, $9    # Set register to 0xFFFFFFFF
addu $10, $2, $10    # Set register to 0xFFFFFFFF
addu $11, $2, $11    # Set register to 0xFFFFFFFF
addu $12 $2, $12    # Set register to 0xFFFFFFFF
addu $13, $2, $13    # Set register to 0xFFFFFFFF
addu $14, $2, $14    # Set register to 0xFFFFFFFF
addu $15, $2, $15    # Set register to 0xFFFFFFFF
addu $16, $2, $16    # Set register to 0xFFFFFFFF
addu $17, $2, $17    # Set register to 0xFFFFFFFF
addu $18, $2, $18    # Set register to 0xFFFFFFFF
addu $19, $2, $19    # Set register to 0xFFFFFFFF
addu $20, $2, $20    # Set register to 0xFFFFFFFF
addu $21, $2, $21    # Set register to 0xFFFFFFFF
addu $21, $2, $21    # Set register to 0xFFFFFFFF
addu $23, $2, $23    # Set register to 0xFFFFFFFF
addu $24, $2, $24    # Set register to 0xFFFFFFFF
addu $25, $2, $25    # Set register to 0xFFFFFFFF
addu $26, $2, $26    # Set register to 0xFFFFFFFF
addu $27, $2, $27    # Set register to 0xFFFFFFFF
addu $28, $2, $28    # Set register to 0xFFFFFFFF
addu $29, $2, $29    # Set register to 0xFFFFFFFF
addu $30, $2, $30    # Set register to 0xFFFFFFFF
addu $31, $2, $31    # Set register to 0xFFFFFFFF

# Result => $2 = 0x00000001, all others => 0x00000000

halt #end program
