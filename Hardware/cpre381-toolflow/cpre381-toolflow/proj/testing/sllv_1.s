# "sllv" Unit Test 1
# This test case covers the common case 
# where the shift amount is less than the word size.
.data
    .align 2
test_array: .word 0xFFFFFFFF, 0xAAAAAAAA, 0x55555555, 0x12345678, 0x87654321
result:     .word 0, 0, 0, 0, 0
.text
    .globl main
main:
    # Start Test
    la $t0, test_array
nop
nop
nop
nop
    la $t1, result
nop
nop
nop
nop
    lw $s0, 0($t0)      # s0 = 0xFFFFFFFF
nop
nop
nop
nop
    li $s1, 2            # s1 = 2 (shift amount)
    
nop
nop
nop
nop
    sllv $s2, $s0, $s1   # s2 = s0 << s1
nop
nop
nop
nop
    sw $s2, 0($t1)       # Store result
nop
nop
nop
nop

    # End Test

    # Exit Program
    halt
