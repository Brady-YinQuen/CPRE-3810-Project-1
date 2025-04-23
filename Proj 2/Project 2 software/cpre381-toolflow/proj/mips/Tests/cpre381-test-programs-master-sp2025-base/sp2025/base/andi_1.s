        .text
        .globl main
        # This test checks basic functionality by loading a known value (0x12345678) and then testing basic cases.
main:
    # Load 0x12345678 into $t0 using pre-tested instructions:
    lui    $t0, 0x1234        # $t0 = 0x12340000
    addiu  $t0, $t0, 0x5678    # $t0 = 0x12345678

    # Test 1: andi with immediate 0 should yield 0.
    andi   $t1, $t0, 0x0000    # Expected $t1 = 0x00000000

    # Test 2: andi with 0xFFFF should mask off the upper half.
    andi   $t2, $t0, 0xFFFF    # Expected $t2 = 0x00005678

    # End of test.
halt
