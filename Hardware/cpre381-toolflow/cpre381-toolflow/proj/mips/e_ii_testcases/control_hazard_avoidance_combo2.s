.data
valA: .word 10
valB: .word 99

.text
.globl main

main:
    # Load different values into different registers
    lw   $a0, valA         # $a0 = 10
    lw   $a1, valA         # $a1 = 10
    lw   $a2, valB         # $a2 = 99

    # --- Test 1: bne NOT taken ---
    bne  $a0, $a1, label_bne_skip
    nop                   # Delay slot
    addi $s3, $zero, 4    # Should execute (bne not taken)

label_bne_skip:
    nop

    # --- Test 2: beq NOT taken ---
    beq  $a0, $a2, label_beq_skip
    nop
    addi $s4, $zero, 5    # Should execute (beq not taken)

label_beq_skip:
    nop

    # --- Test 3: Jump to subroutine ---
    jal  branch_subroutine
    nop

    # --- Test 4: beq taken ---
    beq  $a1, $a0, label_beq_taken
    nop
    addi $s5, $zero, 6    # Should be skipped

label_beq_taken:
    nop

    # --- End program ---
    j done
    nop

# --- Subroutine testing jr ---
branch_subroutine:
    addi $s6, $zero, 7    # Indicate subroutine was entered
    jr   $ra
    nop

done:
    halt
