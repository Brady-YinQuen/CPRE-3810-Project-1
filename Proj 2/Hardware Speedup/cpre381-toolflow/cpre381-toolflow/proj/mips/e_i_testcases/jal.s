.text
.globl main
main:

#### --- Test 1: Use $ra immediately after jal (forward from ID)
    jal target1         # $ra = PC + 4
    add $t0, $ra, $zero # Use $ra immediately (forwarding from ID)
    j done1

target1:
    jr $ra
    nop
done1:

#### --- Test 2: Use $ra after a nop (forward from MEM/WB)
    jal target2
    nop
    add $t1, $ra, $zero # $ra used after 1 delay (forward from MEM/WB)
    j done2

target2:
    jr $ra
    nop
done2:

#### --- Test 3: Use $ra far after jal (no hazard)
    jal target3
    nop
    nop
    nop
    add $t2, $ra, $zero # Long after jal; no hazard
    j done3

target3:
    jr $ra
    nop
done3:

#### --- Final nop to halt cleanly
done:
    nop
halt