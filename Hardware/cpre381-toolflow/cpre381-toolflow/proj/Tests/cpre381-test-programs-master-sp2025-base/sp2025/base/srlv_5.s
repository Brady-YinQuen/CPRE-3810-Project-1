.data

.text

.globl main

main:

    # Start Test
    addi $1, $zero, 1 # shift amount 1 to initialize some registers with srlv

    lui $2, 0x0010    # should get shifted down throughout the registers
 
    srlv $3, $2, $1    # most registers get a bit that we will later clear

    srlv $4, $3, $1    # to verify we can easily clear 

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
    
    # after loading vals into registers with srlv we will use srlv to clear them
    
    addi $1, $zero, 31 # shift amount 31 to shift out all registers

    srlv $2, $2, $1 
 
    srlv $3, $2, $1    

    srlv $4, $3, $1    

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

    srlv $15, $14, $1    # everyone gets cleared

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
    
    srlv $1, $1, $1   
    
    #all registers are now zero
    
    

    # End Test



    # Exit program

    halt

