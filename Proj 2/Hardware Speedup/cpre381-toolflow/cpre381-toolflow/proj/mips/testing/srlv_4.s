.data

.text

.globl main

main:

    # Start Test
    addi $1, $zero, 1 # shift amount in 1 = 1

    lui $2, 0x0001 # should get shifted down throughout the registers
 
    srlv $3, $2, $1    #verify bit is shifted in each register 

    srlv $4, $3, $1    # until it is gone

    srlv $5, $4, $1    

    srlv $6, $5, $1    

    srlv $7, $6, $1    

    srlv $8, $7, $1    

    srlv $9, $8, $1    

    srlv $10, $9, $1    

    srlv $11, $10, $1    

    srlv $12, $11, $1    

    srlv $13, $12, $1    

    srlv $14, $13, $1    # make sure no wierd stuff happens

    srlv $15, $14, $1    # everyone gets a shift.

    srlv $16, $15, $1    

    srlv $17, $16, $1    

    srlv $18, $17, $1   

    srlv $19, $18, $1   

    srlv $20, $19, $1   

    srlv $21, $20, $1   

    srlv $22, $21, $1   

    srlv $23, $22, $1   

    srlv $24, $23, $1   

    srlv $25, $24, $1   

    # End Test


    # Exit program

    halt

