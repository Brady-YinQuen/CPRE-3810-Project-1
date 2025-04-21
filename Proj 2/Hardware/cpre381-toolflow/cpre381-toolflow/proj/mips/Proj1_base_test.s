# Proj1_base_test.s
# MIPS Assembly Test Application - Covers all required arithmetic/logical instructions.

.data
    num1: .word 42
    num2: .word 17
    byteVal: .byte 100
    halfVal: .half 32000
    str: .asciiz "Hello, MIPS!"
    msg1:   .asciiz "Branch was equal\n"
    msg2:   .asciiz "Branch was not equal\n"
    msg3:   .asciiz "Function executed\n"

.text
.globl main

main:
    # Arithmetic and Logical Instructions
    addi  $t0, $zero, 5     # Immediate addition: t0 = 0 + 5
    add   $t1, $t0, $t0     # Addition: t1 = t0 + t0
    addiu $t2, $t1, 10      # Unsigned immediate addition: t2 = t1 + 10
    addu  $t3, $t1, $t2     # Unsigned addition: t3 = t1 + t2

    and   $t4, $t1, $t2     # Bitwise AND: t4 = t1 & t2
    andi  $t5, $t1, 0xF0F0  # Bitwise AND with immediate
    or    $t6, $t1, $t2     # Bitwise OR
    ori   $t7, $t1, 0x0F0F  # Bitwise OR with immediate
    xor   $s0, $t1, $t2     # Bitwise XOR
    xori  $s1, $t1, 0xAAAA  # Bitwise XOR with immediate
    nor   $s2, $t1, $t2     # Bitwise NOR

    slt   $s3, $t1, $t2     # Set if less than (signed)
    slti  $s4, $t1, 10      # Set if less than immediate (signed)

    sub   $s5, $t2, $t1     # Subtraction
    subu  $s6, $t2, $t1     # Unsigned subtraction

    # Shift Instructions
    sll   $s7, $t1, 2       # Logical shift left by 2
    srl   $t8, $t1, 2       # Logical shift right by 2
    sra   $t9, $t1, 2       # Arithmetic shift right by 2
    sllv  $t0, $t1, $t2     # Variable shift left
    srlv  $t1, $t2, $t3     # Variable shift right logical
    srav  $t2, $t3, $t1     # Variable shift right arithmetic

    # Load/Store Instructions
    lui   $s0, 0x1001       # Load upper immediate (0x10010000)
    lw    $s1, num1         # Load word
    sw    $s1, num2         # Store word
    lb    $s2, byteVal      # Load byte
    lbu   $s3, byteVal      # Load byte unsigned
    lh    $s4, halfVal      # Load halfword
    lhu   $s5, halfVal      # Load halfword unsigned

    # Initialize registers
    li    $t0, 5       # Load 5 into $t0
    li    $t1, 5       # Load 5 into $t1
    li    $t2, 10      # Load 10 into $t2

    # Branching Instructions
    beq   $t0, $t1, equal    # If $t0 == $t1, go to 'equal'
    bne   $t0, $t2, notequal # If $t0 != $t2, go to 'notequal'

    j     proceed            # Skip branching section

equal:
    li    $v0, 4             # Syscall to print string
    la    $a0, msg1
#    syscall
    j     proceed            # Jump to next part

notequal:
    li    $v0, 4             # Syscall to print string
    la    $a0, msg2
#    syscall

proceed:
    # Function Call
    jal   my_function        # Jump and link (save return address)

    # Exit Program
    li    $v0, 10            # Syscall for exit
    j exit
   # syscall

# Function definition
my_function:
    li    $v0, 4             # Syscall to print string
    la    $a0, msg3
 #   syscall

    jr    $ra                # Return to caller
exit: 
nop
nop
nop
halt
