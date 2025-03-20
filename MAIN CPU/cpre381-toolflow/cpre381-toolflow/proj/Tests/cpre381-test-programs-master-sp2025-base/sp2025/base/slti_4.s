# Test Case 1: test if less than then register is set to 1
# Basic test case to make sure slti works when the register value is less than the immediate

addi $t1, $0, 1     # Set register

slti $t2, $t1, 2    # $t1 < 2

halt
# $t2 should be set to 1