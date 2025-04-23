.text
.globl main

main:
    # First jr test
    jal target_return   # Store return address (after jal) in $ra
    nop                 # Delay slot

    add $t0, $ra, $zero # Copy return address to $t0
    jr $t0              # Jump to target_return using jr
    nop                 # Delay slot

target_return:
    addi $s0, $zero, 1  # Confirm arrival at target_return

    # Second jr test
    jal second_target   # Store address of second_target in $ra
    nop

    add $t1, $ra, $zero # Copy address to $t1
    jr $t1              # Jump to second_target using jr
    nop

second_target:
    addi $s1, $zero, 2  # Confirm arrival at second_target

end:
    halt
