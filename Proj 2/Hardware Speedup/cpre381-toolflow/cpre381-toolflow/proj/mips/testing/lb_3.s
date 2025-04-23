.data
neg_byte: .byte 0x80  # -128 in decimal (signed)

.text
.globl main
main:
    # Clears registers
    addi $1, $0, 0  
    addi $2, $0, 0  
    addi $3, $0, 0  

    # Loads address of neg_byte into $2
    la $2, neg_byte 

    # Loads byte into $3 (should be sign-extended to -128)
    lb $3, 0($2)  

    # Stores result for verification
    sw $3, 4($2)

    # End Test
    halt

# This test ensures that lb properly sign-extends negative byte values.