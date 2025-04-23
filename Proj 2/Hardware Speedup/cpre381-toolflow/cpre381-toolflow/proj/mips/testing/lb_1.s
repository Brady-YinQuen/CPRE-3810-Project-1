.data
byte_data: .byte 0x7F  # 127 in decimal

.text
.globl main
main:
    # Clears registers
    addi $1, $0, 0   
    addi $2, $0, 0  
    addi $3, $0, 0  

    # Loads address of byte_data into $2
    la $2, byte_data 

    # Loads the byte into $3 
    lb $3, 0($2)  

    # Stores result in memory for inspection
    sw $3, 4($2)

    # End Test
    halt

#This test ensures lb correctly loads a single byte (0x7F) from memory and sign-extends it.