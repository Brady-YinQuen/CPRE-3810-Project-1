.data
.text
.globl main1
main1:
#Start Tests: This test will make sure that the andi instruction can preserve the bottom half a register
# The main point of this is to check that the andi operation works in the ALU and all registers are hooked up correctly
#this test only makes use of 2 instructions, addi and andi, making sure that as few false errors are thrown.

    # Initilalize registers to all 1's
    addi $1, $0, 0xFFFF        
    addi $2, $0, 0xFFFF       
    addi $3, $0, 0xFFFF       
    addi $4, $0, 0xFFFF    
    addi $5, $0, 0xFFFF       
    addi $6, $0, 0xFFFF       
    addi $7, $0, 0xFFFF      
    addi $8, $0, 0xFFFF       
    addi $9, $0, 0xFFFF      
    addi $10, $0, 0xFFFF       
    addi $11, $0, 0xFFFF       
    addi $12, $0, 0xFFFF       
    addi $13, $0, 0xFFFF     
    addi $14, $0, 0xFFFF     
    addi $15, $0, 0xFFFF        
    addi $16, $0, 0xFFFF       
    addi $17, $0, 0xFFFF       
    addi $18, $0, 0xFFFF       
    addi $19, $0, 0xFFFF       
    addi $20, $0, 0xFFFF      
    addi $21, $0, 0xFFFF     
    addi $22, $0, 0xFFFF      
    addi $23, $0, 0xFFFF       
    addi $24, $0, 0xFFFF     
    addi $25, $0, 0xFFFF      
    addi $26, $0, 0xFFFF       
    addi $27, $0, 0xFFFF       
    addi $28, $0, 0xFFFF     
    addi $29, $0, 0xFFFF       
    addi $30, $0, 0xFFFF      
    addi $31, $0, 0xFFFF       
    # End Initialization
    
    #Start Tests
    andi $0, $0, 0xFFFF #makes sure that $0 register remains zero after the test
    andi $1, $1, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $2, $2, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $3, $3, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $4, $4, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $5, $5, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $6, $6, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $7, $7, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $8, $8, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $9, $9, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $10, $10, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $11, $11, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $12, $12, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $13, $13, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $14, $14, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $15, $15, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $16, $16, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $17, $17, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $18, $18, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $19, $19, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $20, $20, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $21, $21, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $22, $22, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $23, $23, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $24, $24, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $25, $25, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $26, $26, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $27, $27, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu

    andi $29, $29, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $30, $30, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $31, $31, 0xFFFF #makes sure bits are preserved and that AND(1,1) works in the alu
    #End Test
    
    # Exit program
halt
    halt


