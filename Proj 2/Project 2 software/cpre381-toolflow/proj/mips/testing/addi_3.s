.data
.text
.globl main
main:
addi $t0, $zero, 0x7FFFFFFF
addi $t0, $t0, 1 # triggers overflow

addi $t1, $zero, 0x80000000
addi $t1, $t1, -1 # triggers overflow

# Tests edge case of overflows
# Tests largest possible positive 0x7FFFFFFF + 1 to cause overflow
# Tests smallest possible negative 0x80000000 - 1 to cause overflow

 halt 

