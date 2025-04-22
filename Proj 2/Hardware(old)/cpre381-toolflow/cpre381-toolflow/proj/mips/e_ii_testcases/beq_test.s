.data
    val1: .word 100
    val2: .word 100
    val3: .word 200

.text
.globl main

main:
    lw   $t0, val1        # $t0 = 100
    lw   $t1, val2        # $t1 = 100
    lw   $t2, val3        # $t2 = 200

    # --- Test 1: Branch Taken ---
    beq  $t0, $t1, label_equal       # Should branch (100 == 100)
    addi $s0, $zero, 1               # Skipped if branch taken
label_equal:
    nop

    # --- Test 2: Branch Not Taken ---
    beq  $t0, $t2, label_not_equal   # Should not branch (100 != 200)
    addi $s1, $zero, 2               # Executes if branch not taken
label_not_equal:
    nop

    # --- Test 3: Consecutive Branches ---
    beq  $t0, $t1, branch1           # Taken
    nop
branch1:
    beq  $t0, $t2, branch2           # Not taken
    addi $s2, $zero, 3
branch2:
    nop

    # --- Test 4: beq in loop (simulated short loop) ---
    addi $t3, $zero, 3         # Loop counter
loop_start:
    beq  $t3, $zero, loop_end  # Exit when $t3 == 0
    addi $t3, $t3, -1          # Decrement
    j    loop_start
loop_end:
    nop

    # --- Done ---
    halt