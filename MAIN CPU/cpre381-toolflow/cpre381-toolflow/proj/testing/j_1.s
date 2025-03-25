.text
main:
    # Test 1
    j test1
    addi $t1, $zero, 1 # all of the addi functions will execute if the jump function does not work.

test1:
    li $t2, 42 # Should be $t2 = 42 if the jump works
    halt
