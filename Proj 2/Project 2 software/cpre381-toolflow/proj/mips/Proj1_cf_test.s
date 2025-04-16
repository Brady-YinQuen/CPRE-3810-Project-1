.data
message: .asciiz "Final result: "

.text
.globl main

main:
    # Call the first function in the chain
    jal level1
    
    # Print the result message
    li $v0, 4
    la $a0, message
#    syscall
    
    # Print the final result
    move $a0, $v0
    li $v0, 1
 #   syscall
    
    # Exit program
    li $v0, 10
    halt
#SSSS    syscall

level1:
    addiu $sp, $sp, -8   # Allocate stack space
    sw $ra, 4($sp)       # Save return address
    sw $a0, 0($sp)       # Save argument
    
    li $a0, 1            # Dummy value
    jal level2           # Call next function
    
    lw $a0, 0($sp)       # Restore argument
    lw $ra, 4($sp)       # Restore return address
    addiu $sp, $sp, 8    # Deallocate stack space
    jr $ra               # Return

level2:
    addiu $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    
    li $a0, 2
    jal level3
    
    lw $a0, 0($sp)
    lw $ra, 4($sp)
    addiu $sp, $sp, 8
    jr $ra

level3:
    addiu $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    
    li $a0, 3
    jal level4
    
    lw $a0, 0($sp)
    lw $ra, 4($sp)
    addiu $sp, $sp, 8
    jr $ra

level4:
    addiu $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    
    li $a0, 4
    jal level5
    
    lw $a0, 0($sp)
    lw $ra, 4($sp)
    addiu $sp, $sp, 8
    jr $ra

level5:
    addiu $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    
    li $a0, 5  # Base computation
    beq $a0, 5, compute
    bne $a0, 6, compute
    j compute

compute:
    addi $v0, $a0, 10  # Compute something
    lw $a0, 0($sp)
    lw $ra, 4($sp)
    addiu $sp, $sp, 8
    jr $ra

halt
