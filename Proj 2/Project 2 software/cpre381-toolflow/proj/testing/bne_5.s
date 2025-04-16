.data
.text
.globl main
main:
# We will test branching with equal and nonequal negative values, in 
# which case it is expected that branching depends on the condition of each case. Flags
# will be set to 1 if the program erroniously continues to the next instruction. Flags 
# (initialized as set to 1) will be cleared if the program correctly continues to the next instruction. 

    # Start Test
    # We will be using $t9 as our "flag" of erroneously not branching conditions.
    
    # Two negatives
    addi $t1, $0, -1     # Initialize t1 to -1   
    addi $t2, $0, -1     # Initialize t2 to -1
    addi $t9, $0, 1     # Initialize t9 "flag" to 1  
    bne	$t1, $t2, NEXT
    addi $t9, $0, 0     # Set t9 "flag" to 0 if correctly doesn't branch. 
    
    # Negative and positive
    NEXT:
    addi $t1, $0, -1     # Initialize t1 to -1   
    addi $t2, $0, 1     # Initialize t2 to 1
    bne	$t1, $t2, NEXT2
    addi $t9, $0, 1     # Set t9 "flag" to 1 if incorrectly doesn't branch. 
    
    # Negative and zero
    NEXT2:
    addi $t1, $0, 0     # Initialize t1 to 0   
    addi $t2, $0, -90     # Initialize t2 to 90
    bne	$t1, $t2, EXIT
    addi $t9, $0, 1     # Set t9 "flag" to 1 if incorrectly doesn't branch. 
    
    EXIT:
    # End Test

    # Exit program
    halt
