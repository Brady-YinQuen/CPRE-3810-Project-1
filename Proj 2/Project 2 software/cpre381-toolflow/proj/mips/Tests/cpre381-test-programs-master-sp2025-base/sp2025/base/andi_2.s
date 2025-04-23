        .text
        .globl main
        # This test stresses the instruction with a “patterned” operand to have all 4 and table cases tested.
main:
    # Load 0xA5A5A5A5 into $t0.
    lui    $t0, 0xA5A5        # $t0 = 0xA5A50000
    addiu  $t0, $t0, 0xA5A5    # $t0 = 0xA5A5A5A5

    # Test 1: andi with 0xFF00.
    andi   $t1, $t0, 0xFF00    # Expected $t1 = (0xA5A5 & 0xFF00) = 0xA500

    # Test 2: andi with 0x00FF to get the lower 8 bits.
    andi   $t2, $t0, 0x00FF    # Expected $t2 = 0x00A5

    # End of test.
halt
