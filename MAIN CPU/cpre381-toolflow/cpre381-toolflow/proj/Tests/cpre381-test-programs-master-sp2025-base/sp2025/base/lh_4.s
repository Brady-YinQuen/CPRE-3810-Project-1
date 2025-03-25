# This program tests whether lh correctly loads and sign-extends halfword values at the boundary of the representable range
# It ensures that negative values are properly extended and that special cases do not introduce errors

        .data
test_data:
        .half 0x7000  
        .half 0x7BCD   
        .half 0x0001      

        .text
        .globl main

main:
        lui   $t0, 0x1001    

        # Tests the smallest negative number to ensure correct sign extension
        lh    $t1, 0($t0)    # Expect 0xFFFF7000 
        
        # Tests arbitrary negative number to verify sign extension correctness
        lh    $t2, 2($t0)    # Expect 0xFFFF7BCD 
        
        # Ensures smallest positive value remains unchanged
        lh    $t3, 4($t0)    # Expect 0x00000001
halt
