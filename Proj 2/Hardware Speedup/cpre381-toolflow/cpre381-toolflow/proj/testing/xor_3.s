        .text
        .globl main
main:
        # Test 1: XOR highest negative with maximum positive value
        lui   $t0, 0x8000         # $t0 = 0x80000000
        lui   $t1, 0x7FFF         # $t1 = 0x7FFF0000
        addiu $t1, $t1, 0xFFFF     # $t1 = 0x7FFFFFFF
        xor   $t2, $t0, $t1        # $t2 = 0xFFFFFFFF

        # Test 2: XOR two arbitrary constants with varied bit patterns
        lui   $t3, 0x1234         # $t3 = 0x12340000
        addiu $t3, $t3, 0x5678     # $t3 = 0x12345678
        lui   $t4, 0x8765         # $t4 = 0x87650000
        addiu $t4, $t4, 0x4321     # $t4 = 0x87654321
        xor   $t5, $t3, $t4        # $t5 = 0x95511559

        # End of test program
halt
