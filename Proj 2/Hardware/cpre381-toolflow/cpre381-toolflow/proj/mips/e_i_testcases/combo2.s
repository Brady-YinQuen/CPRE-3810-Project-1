.data
val1: .word 100
val2: .word 200
val3: .word 300

.text
.globl main
main:
    # ---- J-type hazard with jal ----
    add  $a0, $a1, $a2       # $a0 will be used in helper
    jal  helper              # Should forward $a0 correctly
    nop

    # ---- Load-use hazard ----
    lw   $t2, val1           # Load word
    sub  $t3, $t2, $t1       # Immediate use (should cause stall or forward)

    lw   $t4, val2
    add  $t5, $t4, $t6       # Another load-use hazard

    # ---- I-type hazard with bne ----
    add  $s0, $s1, $s2
    bne  $s0, $zero, altpath2  # Branch on newly written value

    nop                      # Delay slot (optional depending on simulator)

altpath2:
    addi $s3, $zero, 123
    beq  $s3, $zero, done     # beq that won’t be taken
    nop

    # ---- R-type hazard with jr ----
    la   $t7, done            # Load address of done
    add  $t7, $t7, $zero      # Simulate result writeback
    jr   $t7                  # Immediate use of written register (hazard)

helper:
    add  $a3, $a0, $t0        # Use $a0 from before jal
    lw   $t9, val3
    add  $t8, $t9, $t1        # Load-use hazard in subroutine
    jr   $ra

done:
    nop
    halt
