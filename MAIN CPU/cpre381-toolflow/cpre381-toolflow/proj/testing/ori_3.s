.text
.globl main
main:
    # ORI Test: Edge cases and special input patterns

    li $t0, 0xAAAAAAAA      # 1010 1010 1010 1010 1010 1010 1010 1010
    ori $t1, $t0, 0x55555555 # 0101 0101 0101 0101 0101 0101 0101 0101
    # Expected result: 0xFFFFFFFF (all bits set)

    li $t2, 0xF0F0F0F0      # 1111 0000 1111 0000 1111 0000 1111 0000
    ori $t3, $t2, 0x0F0F0F0F # 0000 1111 0000 1111 0000 1111 0000 1111
    # Expected result: 0xFFFFFFFF (all bits set)

    halt