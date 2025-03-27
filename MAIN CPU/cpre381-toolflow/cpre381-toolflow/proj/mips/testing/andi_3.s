.text
.globl main
# Using a register loaded with all ones (0xFFFFFFFF) to ensure that the immediate is zero‐extended.
main:
    # Load 0xFFFFFFFF into $t0.
    lui    $t0, 0xFFFF        # $t0 = 0xFFFF0000
    addiu  $t0, $t0, 0xFFFF    # $t0 = 0xFFFFFFFF

    # Test 1: andi with 0x1234 should simply return 0x1234 (MSB is a 0).
    andi   $t1, $t0, 0x1234    # Expected $t1 = 0x00001234

    # Test 2: andi with 0x8000 should yield 0x8000 (MSB is a 1).
    andi   $t2, $t0, 0x8000    # Expected $t2 = 0x00008000

    # End of test.
halt
