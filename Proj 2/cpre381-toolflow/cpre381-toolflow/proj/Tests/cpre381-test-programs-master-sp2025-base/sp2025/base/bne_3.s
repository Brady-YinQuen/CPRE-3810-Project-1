# bne_danspr_test3
.data
.text
.globl main
main:                     #This test case tests the edge case of if it equals zero or not.
			   #If $9 contains -1 at the end, the test case has failed. If it contains 
			   #1 at the end, the test case has passed because it branched when it was 
			   #supposed to.
    # Clear registers
    addi $9, $0, 0        # $9 = 0
    addi $10, $0, 1       # $10 = 1

    bne $9, $10, PASS     # Should branch
    addi $11, $0, -1      # $11 = -1 (failure)

    halt                  # End of program

PASS:
    addi $11, $0, 1       # $11 = 1 (success)
    halt
