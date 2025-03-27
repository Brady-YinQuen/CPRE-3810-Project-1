.data
.text
.globl main
main:

    # Test basic functionality of SRAV instruction
    li $t0, 0x00000008  # Load positive value (8)
    li $t1, 2           # Shift by 2 bits
    srav $t2, $t0, $t1  # Expected result: 8 >> 2 = 2

    li $t0, -8          # Load negative value (-8)
    li $t1, 2           # Shift by 2 bits
    srav $t3, $t0, $t1  # Expected result: -8 >> 2 = -2 (sign-extended)

    # End program
    li $v0, 10
    halt
