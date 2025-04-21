.data
.text
.globl main
main:
# Solid Normal case, adding the previous number with itself => next register
# This will be a good overall test for testing the adder as it scales up exponentially, starting at 0x4 => overflowing to 0x00000000 exactly at $31

# set up, $1 = 0x4
addi $1, $0, 0x4


# Add registers together
addu $2, $1, $1    
addu $3, $2, $2    
addu $4, $3, $3    
addu $5, $4, $4    
addu $6, $5, $5    
addu $7, $6, $6    
addu $8, $7, $7    
addu $9, $8, $8    
addu $10, $9, $9    
addu $11, $10, $10    
addu $12, $11, $11    
addu $13, $12, $12    
addu $14, $13, $13    
addu $15, $14, $14    
addu $16, $15, $15    
addu $17, $16, $16    
addu $18, $17, $17    
addu $19, $18, $18    
addu $20, $19, $19    
addu $21, $20, $20    
addu $22, $21, $21    
addu $23, $22, $22   
addu $24, $23, $23    
addu $25, $24, $24    
addu $26, $25, $25    
addu $27, $26, $26    
addu $28, $27, $27    
addu $29, $28, $28    
addu $30, $29, $29    
addu $31, $30, $30   


# Result => $n = $(n-1) + $(n-1)
# 31 will be 0x00000000 after overflowing.

halt #end program

