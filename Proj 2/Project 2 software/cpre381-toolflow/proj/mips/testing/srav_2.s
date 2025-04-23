.data
.text
.globl main
main:

    # Test edge cases for SRAV instruction
    li $t0, -1          # Load -1 (all 1s )
    li $t1, 31          # Shift by 31 bits
    srav $t2, $t0, $t1  # Expected result: -1 (sign-extended)

    li $t0, 0x40000000  # Load large positive number
    li $t1, 31          # Shift by 31 bits
    srav $t3, $t0, $t1  # Expected result: 0

    li $t0, 0x80000000  # Load smallest negative number (sign bit set)
    li $t1, 1           # Shift by 1 bit
    srav $t4, $t0, $t1  # Expected result: 0xC0000000 (sign extended right shift)

    # End program
    li $v0, 10
    halt
