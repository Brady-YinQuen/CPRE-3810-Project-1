
#Testing with maximum shift amounts and edge cases.
# Expected Behavior: Shifting by 31 should retain sign for negatives

    .text
    .globl main
main:
    li $t0, 0x7FFFFFFF   # Largest positive int (Expect: shift preserves values)
    li $t1, 0x80000000   # Smallest negative int (Expect: stays negative)
    
    sra $t2, $t0, 31     # Expected: 0x00000000 (all bits shift out)
    sra $t3, $t1, 31     # Expected: 0xFFFFFFFF (preserves sign)
    
    li $t4, 0xFFFFFFFF   # 
    sra $t5, $t4, 1      # Expected: 0xFFFFFFFF (should stay -1)
    
    # End program
    halt
