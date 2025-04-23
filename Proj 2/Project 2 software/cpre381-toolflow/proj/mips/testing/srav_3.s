.data
.text
.globl main
main:

    # Test exceptional and boundary cases for SRAV instruction
    li $t0, 0           # Shift 0 should remain 0
    li $t1, 5           # Shift by 5 bits
    srav $t2, $t0, $t1  # Expected result: 0

    li $t0, -12345678   # Load a large negative number
    li $t1, 4           # Shift by 4 bits
    srav $t3, $t0, $t1  # Expected result: sign-extended right shift

    # End program
    li $v0, 10
    halt
