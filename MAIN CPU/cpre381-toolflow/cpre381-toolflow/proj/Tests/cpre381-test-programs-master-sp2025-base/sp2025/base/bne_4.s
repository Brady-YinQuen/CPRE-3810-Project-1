.data
.text
.globl main
main:
# We will test registers not being equal (positive numbers), in which case
# it is expected that branching does occur. The program should not continue to the next 
# instruction which will set a designated register to 1 as an “error flag.”


    # Start Test
    # We will be using $t9 as our "flag" of erroneously not branching conditions.
    
    #Test small difference, one is zero
    addi $t1, $0, 0     # Initialize t1 to 0   
    addi $t2, $0, 1     # Initialize t2 to 1
    addi $t9, $0, 0     # Initialize t9 "flag" to 0  
    bne	$t1, $t2, NEXT
    addi $t9, $0, 1     # Set t9 "flag" to 1 if incorrectly doesn't branch. 
    
    #Test moderate difference, no zeros
    NEXT:
    addi $t1, $0, 1     # Initialize t1 to 1   
    addi $t2, $0, 50     # Initialize t2 to 50
    bne	$t1, $t2, NEXT2
    addi $t9, $0, 1     # Set t9 "flag" to 1 if incorrectly doesn't branch. 
    
    #Test large difference, one is zero
    NEXT2:
    addi $t1, $0, 90     # Initialize t1 to 90   
    addi $t2, $0, 0     # Initialize t2 to 0
    bne	$t1, $t2, EXIT
    addi $t9, $0, 1     # Set t9 "flag" to 1 if incorrectly doesn't branch. 
    
    EXIT:
    # End Test

    # Exit program
    halt
