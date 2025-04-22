.data
val1: .word 42
val2: .word 100

.text
.globl main

main:
    # Load values
    lw   $t0, val1         # $t0 = 42
    lw   $t1, val1         # $t1 = 42
    lw   $t2, val2         # $t2 = 100

    # --- Test 1: beq taken ---
    beq  $t0, $t1, label_beq_taken
    nop                   # Delay slot
    addi $s0, $zero, 1    # Should be skipped if beq is taken

label_beq_taken:
    nop

    # --- Test 2: bne taken ---
    bne  $t0, $t2, label_bne_taken
    nop                   # Delay slot
    addi $s1, $zero, 2    # Should be skipped if bne is taken

label_bne_taken:
    nop

    # --- Test 3: jal to subroutine ---
    jal  my_subroutine
    nop                   # Delay slot

    # --- End program ---
    j end_program
    nop

# --- Subroutine with jr ---
my_subroutine:
    addi $s2, $zero, 3    # Mark that subroutine ran
    jr   $ra
    nop                   # Delay slot

end_program:
    halt                  # Clean program termination
