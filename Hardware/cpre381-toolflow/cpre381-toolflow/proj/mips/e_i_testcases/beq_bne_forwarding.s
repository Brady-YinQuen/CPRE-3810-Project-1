.text
.globl main
main:

#### --- Test 1: Forward to BEQ from EX/MEM
    add $t0, $zero, $zero     # $t0 = 0
    addi $t1, $zero, 5        # $t1 = 5
    add $t2, $t1, $zero       # $t2 = $t1 = 5 (value being written)
    beq $t1, $t2, beq_target1 # Forward $t2 (EX/MEM)
    nop
    j skip1
beq_target1:
    j done1
skip1:

#### --- Test 2: Forward to BEQ from MEM/WB
    add $t3, $zero, $zero     # $t3 = 0
    addi $t4, $zero, 10       # $t4 = 10
    add $t5, $t4, $zero       # $t5 = 10
    nop                       # Delay to push $t5 into MEM/WB
    beq $t4, $t5, beq_target2 # Forward from MEM/WB
    nop
    j skip2
beq_target2:
    j done2
skip2:

#### --- Test 3: No hazard (registers ready long before)
    addi $s0, $zero, 20
    addi $s1, $zero, 20
    nop
    nop
    beq $s0, $s1, beq_target3
    nop
    j skip3
beq_target3:
    j done3
skip3:

#### --- Test 4: Forward to BNE from EX/MEM
    addi $t6, $zero, 7
    add $t7, $t6, $zero       # $t7 = 7 (EX/MEM)
    bne $t6, $t7, skip4       # Should not branch
    nop
    j done4
skip4:

#### --- Test 5: Forward to BNE from MEM/WB
    addi $a0, $zero, 8
    add $a1, $a0, $zero       # $a1 = 8 (MEM/WB)
    nop
    bne $a0, $a1, skip5       # Should not branch
    nop
    j done5
skip5:

#### --- Test 6: BNE actually taken
    addi $a2, $zero, 1
    addi $a3, $zero, 2
    bne $a2, $a3, bne_taken   # Should take branch
    nop
    j skip6
bne_taken:
    j done6
skip6:

#### --- End of tests
done1:
done2:
done3:
done4:
done5:
done6:
done:
    nop
halt