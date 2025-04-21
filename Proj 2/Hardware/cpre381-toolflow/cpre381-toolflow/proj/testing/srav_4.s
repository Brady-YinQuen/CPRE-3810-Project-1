.data
.text
.globl main
main:
    # Start Test
    
    #srav Rd , Rt , Rs shift the value in Rt by Rs, then get the value in Rd
    
    addi $t3, $zero, 0
    lui $t2, 0xFFFF
    ori $t2, $t2, 0xFFE0
    
    srav $0, $t2, $t3     # verify that one can right by 0, this should not change the value in register  
    srav $1, $t2, $t3     # verify that one can right by 0, this should not change the value in register     
    srav $2, $t2, $t3     # verify that one can right by 0, this should not change the value in register  
    srav $3, $t2, $t3     # verify that one can right by 0, this should not change the value in register  
    srav $4, $t2, $t3     # verify that one can right by 0, this should not change the value in register  
    srav $5, $t2, $t3     # verify that one can right by 0, this should not change the value in register  
    srav $6, $t2, $t3     # verify that one can right by 0, this should not change the value in register  
    srav $7, $t2, $t3     # verify that one can right by 0, this should not change the value in register  
    srav $8, $t2, $t3     # verify that one can right by 0, this should not change the value in register  
    srav $9, $t2, $t3     # verify that one can right by 0, this should not change the value in register
    
    addi $t1, $zero, 0		#changes the RT and RS registers so that all registers are tested	
    lui $t0, 0xFFFF
    ori $t0, $t0, 0xFFE0
        
    srav $10, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $11, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $12, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $13, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $14, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $15, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $16, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $17, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $18, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $19, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $20, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $21, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $22, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $23, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $24, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $25, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $26, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $27, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $28, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $29, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $30, $t0, $t1     # verify that one can right by 0, this should not change the value in register  
    srav $31, $t0, $t1     # verify that one can right by 0, this should not change the value in register  

    # Exit program
    halt
