
#Small shift amounts tested on positive and negative numbers.
# Expected Behavior: Negative numbers should maintain their sign bit

    .text
    .globl main

main:
    # Load positive and negative numbers
    li $t0, 0x00000020       # 32 (0x00000020)
    li $t1, -32              #  -32 (0xFFFFFFE0)
    
    # Test 1: Shift right by 1 bit
    sra $t2, $t0, 1          #  (Expected: 0x00000010, which is 16)
    sra $t3, $t1, 1          #  (Expected: 0xFFFFFFF0, which is -16, preserves sign)
    
    # Test 2: Shift right by 2 bits
    sra $t4, $t0, 2          # (Expected: 0x00000008, which is 8)
    sra $t5, $t1, 2          # (Expected: 0xFFFFFFF8, which is -8, preserves sign)
    
    # Test 3: Shift right by 3 bits
    sra $t6, $t0, 3          # (Expected: 0x00000004, which is 4)
    sra $t7, $t1, 3          # (Expected: 0xFFFFFFFC, which is -4, preserves sign)
    
    # Test 4: Shift right by 4 bits
    sra $t8, $t0, 4          # (Expected: 0x00000002, which is 2)
    sra $t9, $t1, 4          # (Expected: 0xFFFFFFFE, which is -2, preserves sign)
    
    # End program
    halt
