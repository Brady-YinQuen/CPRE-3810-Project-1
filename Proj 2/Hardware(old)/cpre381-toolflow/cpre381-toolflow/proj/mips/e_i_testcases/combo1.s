.data
test: .word 42

.text
.globl main
main:
    # ---- Load-use hazard ----
    lw   $t0, test         # Load from memory
    add  $t1, $t0, $t2     # Use loaded value (load-use hazard)

    # ---- I-type hazard with beq ----
    add  $t6, $t7, $t8
    beq  $t6, $zero, label1

    # ---- J-type hazard with jal ----
    add  $t9, $s1, $s2
    jal  subroutine
    nop

    # ---- More load-use ----
    lw   $s3, 4($s0)       # Load
    sub  $s4, $s3, $s5

    # ---- R-type hazard with jr ----
    lui  $t3, 0x0040       # Upper bits of address (0x00400000)
    ori  $t3, $t3, 0x0060  # Full address (e.g., 0x00400060 -> 'end' label)
    add  $t3, $t3, $zero   # R-type instruction writes to $t3
    jr   $t3               # Immediately use $t3 (hazard)

label1:
    addi $s6, $zero, 42
    j   end

subroutine:
    add  $s7, $t9, $t1
    jr   $ra

end:
    nop
    halt
