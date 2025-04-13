.data
.align 2
vals: .half 1, 2, 3		# Define halfword-aligned values

.text
.globl main
main:
    # Start Test
	# This test ensures that using a negative offset behaves correctly.
    lui $t0, 0x1001          # Load base address of vals
    addi $t0, $t0, 6        # Move pointer to an address in vals
    lh $t1, -2($t0)         # Load from two bytes before (should be third value: 3)
    lh $t2, -4($t0)         # Load from four bytes before (should be second value: 2)
    lh $t3, -6($t0)         # Load from six bytes before (should be first value: 1)
    
    # Exit program
    halt
