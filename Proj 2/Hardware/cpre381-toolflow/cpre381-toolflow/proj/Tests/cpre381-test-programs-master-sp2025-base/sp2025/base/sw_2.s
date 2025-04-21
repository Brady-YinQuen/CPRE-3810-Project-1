# Unit Testing Store Word - sw
# Test 2
# Tests overwriting at the same address
.data
test_value: .word 0

.text
main:
addi $t1, $t1, 100
sw $t1, test_value # Store first value

addi $t1, $t1, 200
sw $t1, test_value # Overwrite with new value

halt