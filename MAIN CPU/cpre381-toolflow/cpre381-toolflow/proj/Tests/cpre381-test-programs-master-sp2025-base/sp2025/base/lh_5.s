# This program tests whether lh correctly loads data that spans memory word boundaries.
# It ensures that halfword loads do not incorrectly modify adjacent memory values.

        .data
test_data:
        .word 0x12345678  
        .word 0x9ABCDEF0  

        .text
        .globl main

main:
        lui   $t0, 0x1001    # Load base address of test_data

        # Load halfwords from aligned positions. 
        # Half words store right to left because of endianness 
        lh    $t1, 0($t0)    # Expect 0x5678 (second halfword)
        lh    $t2, 2($t0)    # Expect 0x1234 (first halfword)
        lh    $t3, 4($t0)    # Expect 0xDEF0 (fourth halfword)
        lh    $t4, 6($t0)    # Expect 0x9ABC (third halfword)
halt
