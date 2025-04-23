.text
main:

    # Test 3
    j test3
    li $t5, 50

  test3:
    j test4
    li $t6, 60

  test4:
    li $t7, 100 # Should be $s0 = 100 if the jump works
    
halt
