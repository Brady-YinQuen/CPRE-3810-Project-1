        .text
        .globl main
main:
        # Test 1: XOR a register with itself (should yield 0)
        xor   $t0, $t0, $t0       # $t0 = 0

        # Test 2: XOR with zero
        lui   $t1, 0x1234         # $t1 = 0x12340000
        addiu $t1, $t1, 0x5678     # $t1 = 0x12345678
        xor   $t2, $t1, $zero      # $t2 = 0x12345678

        # Test 3: XOR two arbitrary constants
        lui   $t3, 0xAAAA         # $t3 = 0xAAAA0000
        addiu $t3, $t3, 0x5555     # $t3 = 0xAAAA5555
        lui   $t4, 0x5555         # $t4 = 0x55550000
        addiu $t4, $t4, 0xAAAA     # $t4 = 0x5555AAAA
        xor   $t5, $t3, $t4        # $t5 = 0xFFFFFFFF

        # End of test program
halt
