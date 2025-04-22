.data
    val1: .word 10

.text
.globl main

main:
    # --- Setup ---
    lw    $t0, val1        # $t0 = 10

    # --- Test 1: Simple jal and return ---
    jal   func1            # Jump to func1, save return addr in $ra
    addi  $s0, $zero, 1    # Delay slot: should execute before jumping
    nop                    # After return

    # --- Test 2: Consecutive jal calls ---
    jal   func2
    addi  $s1, $zero, 2    # Delay slot for second jal
    nop

    # --- End ---
    halt

# --- Subroutine 1 ---
func1:
    addi $t1, $t0, 5       # Modify register (not observable in output)
    jr   $ra               # Return to caller
    nop                    # Delay slot after jr

# --- Subroutine 2 ---
func2:
    add  $t2, $t0, $t0     # $t2 = $t0 * 2
    jr   $ra               # Return to caller
    nop
halt