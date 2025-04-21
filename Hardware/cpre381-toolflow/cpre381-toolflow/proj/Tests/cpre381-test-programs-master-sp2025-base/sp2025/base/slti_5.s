# Test Case 1: test if greater than then register is set to 0
# Basic test case to make sure slti works when the register value is greater than the immediate

addi $t1, $0, 1     # Set register

slti $t2, $t1, 0    # $t1 < 0

halt
# $t2 should be set to 0