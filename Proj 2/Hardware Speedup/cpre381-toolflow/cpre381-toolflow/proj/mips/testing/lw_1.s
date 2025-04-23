    .data
value:  .word 0x12345678  # A known value in memory

    .text
    .globl main
main:
    la $t0, value         # Loads the address of 'value' into $t0
    lw $t1, 0($t0)        # Loads the word at address $t0 into $t1
    # $t1 should now contain 0x12345678

    li $v0, 10            # halt: exit
    halt


# Justification:
# Checks the basic functionality of the lw instruction. 
# It ensures that the instruction can correctly load a word from a # valid memory address into a register (i.e. a known working base case)

# Run in MARS, and working as expected. $t1 is set to 0x12345678
