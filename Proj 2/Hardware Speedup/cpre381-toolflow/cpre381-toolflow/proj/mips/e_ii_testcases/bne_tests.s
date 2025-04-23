.data
    val1: .word 100
    val2: .word 200
    val3: .word 100

.text
.globl main

main:
    lw   $t0, val1        # $t0 = 100
    lw   $t1, val2        # $t1 = 200
    lw   $t2, val3        # $t2 = 100

    # --- Test 1: Branch Taken ---
    bne  $t0, $t1, label_diff       # Should branch (100 != 200)
    addi $s0, $zero, 1              # Skipped if branch taken
label_diff:
    nop

    # --- Test 2: Branch Not Taken ---
    bne  $t0, $t2, label_same       # Should NOT branch (100 == 100)
    addi $s1, $zero, 2              # Executes if branch not taken
label_same:
    nop

    # --- Test 3: Consecutive bne Branches ---
    bne  $t1, $t2, branch1          # Taken (200 != 100)
    nop
branch1:
    bne  $t0, $t2, branch2          # Not taken (100 == 100)
    addi $s2, $zero, 3              # Executes if branch not taken
branch2:
    nop

    # --- Test 4: bne in loop (simple loop) ---
    addi $t3, $zero, 3              # Loop counter = 3
loop_start:
    bne  $t3, $zero, loop_continue  # Branch while $t3 != 0
    j    loop_end                   # Exit loop
loop_continue:
    addi $t3, $t3, -1               # Decrement counter
    j    loop_start
loop_end:
    nop

    # --- Done ---
    halt
