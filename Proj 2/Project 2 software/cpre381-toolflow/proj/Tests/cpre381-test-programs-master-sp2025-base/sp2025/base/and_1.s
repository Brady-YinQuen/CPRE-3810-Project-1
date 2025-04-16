.data
.text
.globl main
main:
#start test

#this test will be testing and anding all 0 - 31 pf the registers with 0 
#the registers will be unitialized from memory so this will also test what happens when you and an empty register
#the expected results is that each register will be 0 

    and $0, $0, $0      
    and $1, $1, $0      
    and $2, $2, $0      
    and $3, $3, $0      
    and $4, $4, $0     
    and $5, $5, $0    
    and $6, $6, $0    
    and $7, $7, $0    
    and $8, $8, $0     
    and $9, $9, $0     
    and $10, $10, $0    
    and $11, $11, $0    
    and $12, $12, $0  
    and $13, $13, $0   
    and $14, $14, $0   
    and $15, $15, $0    
    and $16, $16, $0    
    and $17, $17, $0   
    and $18, $18, $0   
    and $19, $19, $0    
    and $20, $20, $0   
    and $21, $21, $0   
    and $22, $22, $0    
    and $23, $23, $0   
    and $24, $24, $0    
    and $25, $25, $0    
    and $26, $26, $0  
    and $27, $27, $0  
    and $28, $28, $0   
    and $29, $29, $0   
    and $30, $30, $0   
    and $31, $31, $0   
#end test 

    halt
