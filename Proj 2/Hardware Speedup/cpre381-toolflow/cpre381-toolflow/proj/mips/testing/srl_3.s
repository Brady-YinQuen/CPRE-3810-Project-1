    .text
    .globl main
main:
    li $t0, 0xFFFFFFFF  # -1 in signed, all 1s in unsigned
    srl $t1, $t0, 4     # Logical shift right by 4
halt
    # Expected: $t1 = 0x0FFFFFFF (fills with zero)
