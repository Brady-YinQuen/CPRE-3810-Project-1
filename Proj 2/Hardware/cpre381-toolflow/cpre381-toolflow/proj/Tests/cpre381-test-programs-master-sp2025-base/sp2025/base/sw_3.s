# Unit Testing Store Word - sw
# Test 3
# Test upper and lower bounds of sw
# PS 2^16 is -32,768 - 32,767 But the max is not word-aligned (multiple of 4)
.data
memory: .space 65536   # Reserve 64KB (bigger than max offset range)
newline: .asciiz "\n"

.text
main:
lui $s0, 0x1001     # Load base address of memory into $s0

# Test storing at max positive offset (that is still word aligned)
addi $t1, $t1, 1234       
sw $t1, 32764($s0) # Store value at base + 32764

# Test storing at max negative offset
addi $t2, $t2, 5678       
sw $t2, -32768($s0) # Store at base - 32768

halt