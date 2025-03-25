    .text
    .globl main
main:
    li $t0, 0x80000000  # Load MSB set
    srl $t1, $t0, 31    # Shift all the way
    # Expected: $t1 = 0x00000001
halt
