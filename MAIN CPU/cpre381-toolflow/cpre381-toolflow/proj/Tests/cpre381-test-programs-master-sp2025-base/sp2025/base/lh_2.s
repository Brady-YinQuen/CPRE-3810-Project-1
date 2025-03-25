.data
.align 2
vals: .half -32768, -1, 0, 1, 32767  # Edge-case values for signed 16-bit
.text
.globl main
main:
    # Start Test
    # This test is to check that the sign extension for signed values works correctly
    lui $t0, 0x1001		# load value for memory location where array vals is stored
    lh $t1, 0($t0)      # load -32768 	(0x10010000)
    lh $t2, 2($t0)      # load -1 		(0x10010002)
    lh $t3, 4($t0)      # load 0 		(0x10010004)
    lh $t4, 6($t0)      # load 1 		(0x10010006)
    lh $t5, 8($t0)      # load 32767 	(0x10010008)
    # End Test

    # Exit program
    halt