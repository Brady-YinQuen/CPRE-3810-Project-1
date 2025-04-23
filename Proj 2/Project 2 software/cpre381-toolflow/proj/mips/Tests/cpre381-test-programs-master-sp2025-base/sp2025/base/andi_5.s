.data
.text
.globl main2
main2:
#Start Tests: This test will make sure that the andi instruction can clear the bottom half a register
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
    andi $0, $0, 0x0000 #makes sure that $0 register remains zero after the test
    andi $1, $1, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $2, $2, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $3, $3, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $4, $4, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $5, $5, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $6, $6, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $7, $7, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $8, $8, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $9, $9, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $10, $10, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $11, $11, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $12, $12, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $13, $13, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $14, $14, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $15, $15, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $16, $16, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $17, $17, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $18, $18, 0x0000 #makes sure bits are preserved and that AND(1,1) works in the alu
    andi $19, $19, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $20, $20, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $21, $21, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $22, $22, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $23, $23, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $24, $24, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $25, $25, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $26, $26, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $27, $27, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $28, $28, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $29, $29, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $30, $30, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    andi $31, $31, 0x0000 #makes sure bits are cleared and that AND(1,0) works in the alu
    #End Test
    
    # Exit program
halt
    halt


