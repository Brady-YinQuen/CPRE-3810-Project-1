.data
unaligned_data: .byte 0x12, 0x34, 0x56, 0x78  # Memory layout: 0x12 | 0x34 | 0x56 | 0x78

.text
.globl main
main:
    # Clears registers
    addi $1, $0, 0  
    addi $2, $0, 0  
    addi $3, $0, 0  

    # Loads address of unaligned_data into $2
    la $2, unaligned_data 

    # Loads second byte (0x34) using an unaligned address
    lb $3, 1($2)  

    # Stores result for verification
    sw $3, 4($2)

    # End Test
    halt

# This test verifies that lb correctly handles unaligned addresses and fetches the right byte.