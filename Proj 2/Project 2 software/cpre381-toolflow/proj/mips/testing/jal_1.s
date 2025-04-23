.data
.text
.globl main
main:
    # Start Test
    #Make sure jal updates $ra correctly
    
    jal Label #$ra should now point to the instruction below this
nop
nop
nop
nop

    addiu $0, $0, 0 #No-op / spacer
nop
nop
nop
nop

    Label:     addiu $t1, $ra, 0 #Store the $ra set by jal into $t1
nop
nop
nop
nop

    jal Label2 #$ra should now point to the instruction below this
nop
nop
nop
nop

    Label2:    addiu $t2, $ra, 0 #Store the new $ra set by jal into $t2
nop
nop
nop
nop

    addiu $t1, $t1, 12	#The second stored $ra is 3 words away from the original
nop
nop
nop
nop
    beq $t1, $t2, CORRECT
nop
nop
nop
nop

    j Exit
nop
nop
nop
nop


    CORRECT: addiu $t0, $0, 1 #Set $t0 to 1 when $ra is stored correctly by jal
nop
nop
nop
nop

    
    Exit:
    # End Test
    # Exit program
    halt

    
