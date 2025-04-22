.data
    val1: .word 100         # Data to be used by jr instructions
    val2: .word 200         # Data to be used by jr instructions

.text
.globl main

main:
    # Initialize some registers with addresses for jumps
    addi  $t0, $zero, 0x00400000  # Set $t0 to some address (used for jr)
    addi  $t1, $zero, 0x00400004  # Set $t1 to another address
    addi  $t2, $zero, 0x00400008  # Set $t2 to another address

    # ---- Test 1: Jump to address in $t0 using jr ----
    jr    $t0            # Jump to address in $t0 (control hazard)
    nop                  # Delay slot for the jump

    # ---- Test 2: Jump to address in $t1 using jr ----
    jr    $t1            # Jump to address in $t1 (control hazard)
    nop                  # Delay slot for the jump

    # ---- Test 3: Jump to address in $t2 using jr ----
    jr    $t2            # Jump to address in $t2 (control hazard)
    nop                  # Delay slot for the jump

    # ---- Test 4: Conditional jump, then jump to $t0 ----
    addi  $t3, $zero, 5    # Set $t3 to a non-zero value
    beq   $t3, $zero, skip_test  # This branch will not be taken
    jr    $t0              # Jump to $t0 if branch not taken (control hazard)
    nop                    # Delay slot for the jump
skip_test:
    nop                    # Continue execution after the conditional branch

    # ---- Test 5: Conditional jump, then jump to $t1 ----
    addi  $t4, $zero, 0    # Set $t4 to zero
    bne   $t4, $zero, skip_test_2  # This branch will not be taken
    jr    $t1              # Jump to $t1 if branch not taken (control hazard)
    nop                    # Delay slot for the jump
skip_test_2:
    nop                    # Continue execution after the conditional branch

    # ---- Test 6: Jump back to the start (creating a loop) using jr ----
    addi  $t5, $zero, 0x00400000  # Set $t5 to start address
loop_start:
    jr    $t5              # Jump to start (control hazard)
    nop                    # Delay slot for the jump

    # ---- Test 7: Simulate an infinite loop using jr ----
    jr    $t5              # Jump to $t5 indefinitely
    nop                    # Delay slot for the jump

    # ---- Test 8: Jump to the next instruction after a function call ----
    jal   subroutine       # Jump and link to subroutine
    nop                    # Delay slot for the jump

    j     end              # Jump to end of program to avoid infinite loop

subroutine:
    addi  $t6, $zero, 42   # Set a value in $t6 to simulate function execution
    jr    $ra              # Return from subroutine using $ra
    nop                    # Delay slot for the jump

end:
    nop                    # End of program, halt or no-op to end
    halt                   # Program termination
