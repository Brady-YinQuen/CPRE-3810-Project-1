.data
.text
.globl main
main:
#start test

#This test will be testing anding all 1's with all register 0-31
#register $16 will first be addi with all 1's
#The first half of the registers will have 0xFFFFFFFF the second half will be all zeros 
#The expected reults will that the first halk of the registers 1-15 will contain all ones 0xFFFFFFFF (except for $0 as this is the zero register)
#And the last half of the registers 17-31 will have all zeroes 

    #add all ones to register 17
    addi $16, $0, 0xFFFFFFFF
    
    #initialize 0-15 with all ones
    addi $0, $0, 0xFFFFFFFF #register is zero register and should remain zero, I guess this test that as well. 
    addi $1, $0, 0xFFFFFFFF
    addi $2, $0, 0xFFFFFFFF
    addi $3, $0, 0xFFFFFFFF
    addi $4, $0, 0xFFFFFFFF
    addi $5, $0, 0xFFFFFFFF
    addi $6, $0, 0xFFFFFFFF
    addi $7, $0, 0xFFFFFFFF
    addi $8, $0, 0xFFFFFFFF
    addi $9, $0, 0xFFFFFFFF
    addi $10, $0, 0xFFFFFFFF
    addi $11, $0, 0xFFFFFFFF
    addi $12, $0, 0xFFFFFFFF
    addi $13, $0, 0xFFFFFFFF
    addi $14, $0, 0xFFFFFFFF
    addi $15, $0, 0xFFFFFFFF
    
    #and all 1's with these registers
    and $1, $1, $16
    and $2, $2, $16
    and $3, $3, $16
    and $4, $4, $16
    and $5, $5, $16
    and $6, $6, $16
    and $7, $7, $16
    and $8, $8, $16
    and $9, $9, $16
    and $10, $10, $16
    and $11, $11, $16
    and $12, $12, $16
    and $13, $13, $16
    and $14, $14, $16
    and $15, $15, $16
    
    #Second half anding registers with all zeros with all ones expected registers will remain with all 0's
    and $17, $17, $16
    and $18, $18, $16
    and $19, $19, $16
    and $20, $20, $16
    and $21, $21, $16
    and $22, $22, $16
    and $23, $23, $16
    and $24, $24, $16
    and $25, $25, $16
    and $26, $26, $16
    and $27, $27, $16

    and $29, $29, $16
    and $30, $30, $16
    and $31, $31, $16
    
    halt



