# Purpose: Test SRA with 0 shift and 1-bit values
# Expected Behavior: No shift if shift amount is 0; small values should divide correctly

    .text
    .globl main

main:
    # Load small positive and negative numbers
    li $t0, 0x00000003       # Small positive number (3)
    li $t1, 0xFFFFFFFD       # Small negative number (-3 in two’s complement)
    
    # Test 1: Shift right by 0 bits (no shift)
    sra $t2, $t0, 0          # Expected: 0x00000003 (no change)
    sra $t3, $t1, 0          # Expected: 0xFFFFFFFD (no change)
    
    # Test 2: Shift right by 1 bit
    sra $t4, $t0, 1          # Expected: 0x00000001 (3 / 2 = 1.5, rounds down to 1)
    sra $t5, $t1, 1          # Expected: 0xFFFFFFFE (-3 / 2 = -1.5, rounds down to -2)
    
    # Test 3: Shift right by 1 bit with different numbers
    li $t6, 0x00000005       # Small positive number (5)
    li $t7, 0xFFFFFFFB       # Small negative number (-5 in two’s complement)
    
    sra $t8, $t6, 1          # Expected: 0x00000002 (5 / 2 = 2.5, rounds down to 2)
    sra $t9, $t7, 1          # Expected: 0xFFFFFFFD (-5 / 2 = -2.5, rounds down to -3)
    
    # End program
    halt
