.text
main:

    # Test 2
    j test2
    li $t3, 88

test2:
    li $t4, 99 # Should be $t4 = 99 if the jump works
    halt
