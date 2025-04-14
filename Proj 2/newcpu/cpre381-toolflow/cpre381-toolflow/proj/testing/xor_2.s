        .text
        .globl main
main:
        # Test 1: Load full ones (0xFFFFFFFF)
        lui   $t0, 0xFFFF         # $t0 = 0xFFFF0000
        addiu $t0, $t0, 0xFFFF     # $t0 = 0xFFFFFFFF

        # Test 2: XOR a register with itself (should yield 0)
        xor   $t1, $t0, $t0        # $t1 = 0x00000000

        # Test 3: XOR a patterned constant with full ones.
        lui   $t2, 0xAAAA         # $t2 = 0xAAAA0000
        addiu $t2, $t2, 0xAAAA     # $t2 = 0xAAAAAAAA
        xor   $t3, $t0, $t2        # $t3 = 0x55555555

        # End of test program
halt
