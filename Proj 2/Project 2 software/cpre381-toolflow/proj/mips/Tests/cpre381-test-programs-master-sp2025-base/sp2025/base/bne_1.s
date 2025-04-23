# bne_danspr_test1
.data
.text
.globl main
main:				#This test case checks if the program does not branch when it isn't
				#supposed to. Registers $1 and $2 are equal, so the bne command should
				#not branch and proceed to the addi $3, $0, 1. If it branches and 
				#sets $3 to -1, the test case has failed.
    # Clear registers
    addi $1, $0, 5        # $1 = 5
    addi $2, $0, 5        # $2 = 5

    bne $1, $2, FAIL      # Should NOT branch
    addi $3, $0, 1        # $3 = 1 (success)

    halt                  # End of program

FAIL:
    addi $3, $0, -1       # $3 = -1 (failure)
    halt
