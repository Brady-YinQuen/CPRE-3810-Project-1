.data
array: .word 7, 3, 9, 1, 5  # Example array
size: .word 5               # Number of elements in array

.text
.globl main

main:
    lw $t0, size           # Load size of array into $t0
    lasw $t1, array          # Load base address of array into $t1

    jal BubbleSort         # Call BubbleSort function
 nop
nop
nop

exit:
    li $v0, 10             # Exit program
 nop
nop
nop
	
    halt
    syscall

# ============================
# Function: BubbleSort
# Sorts the array in ascending order
# ============================
BubbleSort:
    #lw $t0, size          # Load size of array
nop
nop
nop
lasw $t0, size
nop
nop
nop
lw $t0,0($t0)
nop
nop
nop

    lasw $t1, array         # Load base address of array
    nop
    addi $t0, $t0, -1     # N-1 iterations

outer_loop:
    li $t2, 0             # i = 0
    beq $t0, $zero, done  # If n-1 == 0, sorting is done

inner_loop:
nop
nop
nop
    sll $t3, $t2, 2       # Offset = i * 4
    nop
    nop
    nop
    add $t4, $t1, $t3     # Address = base + offset
    nop
    nop
nop
    lw $t5, 0($t4)        # Load array[i]
    lw $t6, 4($t4)        # Load array[i+1]
    nop
    nop
nop
    slt $t7, $t6, $t5     # If array[i+1] < array[i]
    nop
    nop
nop
    beq $t7, $zero, skip_swap # Skip if already sorted
nop
nop
    
    # Swap elements
    sw $t6, 0($t4)        # Store array[i+1] in array[i]
    sw $t5, 4($t4)        # Store array[i] in array[i+1]
    
skip_swap:
    addi $t2, $t2, 1      # i++
    nop
nop
    nop
    bne $t2, $t0, inner_loop # If i < N-1, continue
nop
nop
nop
    
    addi $t0, $t0, -1     # Reduce outer loop count
    j outer_loop
    nop
done:
    jr $ra               # Return to caller
nop
nop
nop
halt
