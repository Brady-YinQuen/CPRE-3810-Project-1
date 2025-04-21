.data
array: .word 7, 3, 9, 1, 5  # Example array
size: .word 5               # Number of elements in array
newline: .asciiz "\n"
space: .asciiz " "
msg_unsorted: .asciiz "Unsorted Array:\n"
msg_sorted: .asciiz "Sorted Array:\n"

.text
.globl main

main:
    lw $t0, size           # Load size of array into $t0
    la $t1, array          # Load base address of array into $t1

    # Print message: Unsorted Array
    li $v0, 4
    la $a0, msg_unsorted
    syscall

    jal PrintArray         # Print the unsorted array

    jal BubbleSort         # Call BubbleSort function

    # Print message: Sorted Array
    li $v0, 4
    la $a0, msg_sorted
    syscall

    jal PrintArray         # Print the sorted array

exit:
    li $v0, 10             # Exit program
nop
nop
nop
    halt
   # syscall

# ============================
# Function: PrintArray
# Prints the array elements
# ============================
PrintArray:
    lw $t0, size           # Load size of array into $t0
    la $t1, array          # Load base address of array into $t1
    li $t2, 0              # Loop counter i = 0

print_loop:
    beq $t2, $t0, print_done # If i == size, exit
    sll $t3, $t2, 2       # Offset = i * 4
    add $t4, $t1, $t3     # Address = base + offset
    lw $a0, 0($t4)        # Load array[i] into $a0
    li $v0, 1
 #   syscall               # Print integer
    
    # Print space
    li $v0, 4
    la $a0, space
 #   syscall

    addi $t2, $t2, 1      # i++
    j print_loop

print_done:
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    jr $ra

# ============================
# Function: BubbleSort
# Sorts the array in ascending order
# ============================
BubbleSort:
    lw $t0, size          # Load size of array
    la $t1, array         # Load base address of array
    addi $t0, $t0, -1     # N-1 iterations

outer_loop:
    li $t2, 0             # i = 0
    beq $t0, $zero, done  # If n-1 == 0, sorting is done

inner_loop:
    sll $t3, $t2, 2       # Offset = i * 4
    add $t4, $t1, $t3     # Address = base + offset
    lw $t5, 0($t4)        # Load array[i]
    lw $t6, 4($t4)        # Load array[i+1]
    
    slt $t7, $t6, $t5     # If array[i+1] < array[i]
    beq $t7, $zero, skip_swap # Skip if already sorted
    
    # Swap elements
    sw $t6, 0($t4)        # Store array[i+1] in array[i]
    sw $t5, 4($t4)        # Store array[i] in array[i+1]
    
skip_swap:
    addi $t2, $t2, 1      # i++
    bne $t2, $t0, inner_loop # If i < N-1, continue
    
    addi $t0, $t0, -1     # Reduce outer loop count
    j outer_loop

done:
    jr $ra               # Return to caller

halt
