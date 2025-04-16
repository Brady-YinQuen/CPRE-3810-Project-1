# bne_danspr_test2
.data
.text
.globl main
main:				#This test case tests a general use case testing if the program branches
				#when it is supposed to. $4 and $5 are not equal, so the program
				#should branch to PASS. If it does not, the program has failed.
    # Clear registers
    addi $4, $0, 10       # $4 = 10
    addi $5, $0, 20       # $5 = 20

    bne $4, $5, PASS      # Should branch
    addi $6, $0, -1       # $6 = -1 (failure)

    halt                  # End of program

PASS:
    addi $6, $0, 1        # $6 = 1 (success)
    halt
