.data
.align 2
vals: .half 1 2 3 4 5 6 7 8 9
.text
.globl main
main:
    # Start Test
    # This test is mainly for checking that the offset works correctly
    lui $t0, 0x1001       # load value for memory location where array vals is stored
    lh $t1, 0($t0)        # load first halfword value from memory address of vals into $t1
    lh $t2, 2($t0)        # load second halfword value from memory address of vals into $t2
    lh $t3, 4($t0)        # load third halfword value from memory address of vals into $t3
    lh $t4, 6($t0)        # load fourth halfword value from memory address of vals into $t4
    lh $t5, 8($t0)        # load fifth halfword value from memory address of vals into $t5
    lh $t6, 10($t0)       # load sixth halfword value from memory address of vals into $t6
    lh $t7, 12($t0)       # load seventh halfword value from memory address of vals into $t7
    lh $t8, 14($t0)       # load eighth halfword value from memory address of vals into $t8
    lh $t9, 16($t0)       # load ninth halfword value from memory address of vals into $t9
    # End Test

    # Exit program
    halt
