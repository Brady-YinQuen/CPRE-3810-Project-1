.data
.text
.globl main
main:
    # Start Test
    
    #srav Rd , Rt , Rs shift the value in Rt by Rs, then get the value in Rd

    addi $t3, $zero, 4
    lui $t2, 0xFFFF
    ori $t2, $t2, 0xFFE0
    
    srav $0, $t2, $t3     # verify that negative number sign extension works properly
    srav $1, $t2, $t3     # verify that negative number sign extension works properly
    srav $2, $t2, $t3     # verify that negative number sign extension works properly 
    srav $3, $t2, $t3     # verify that negative number sign extension works properly
    srav $4, $t2, $t3     # verify that negative number sign extension works properly
    srav $5, $t2, $t3     # verify that negative number sign extension works properly
    srav $6, $t2, $t3     # verify that negative number sign extension works properly
    srav $7, $t2, $t3     # verify that negative number sign extension works properly
    srav $8, $t2, $t3     # verify that negative number sign extension works properly
    srav $9, $t2, $t3     # verify that negative number sign extension works properly
    
    addi $t1, $zero, 4		#changes the RT and RS registers so that all registers are tested	
    lui $t0, 0xFFFF
    ori $t0, $t0, 0xFFE0
      
    srav $10, $t0, $t1     # verify that negative number sign extension works properly
    srav $11, $t0, $t1     # verify that negative number sign extension works properly
    srav $12, $t0, $t1     # verify that negative number sign extension works properly
    srav $13, $t0, $t1     # verify that negative number sign extension works properly
    srav $14, $t0, $t1     # verify that negative number sign extension works properly
    srav $15, $t0, $t1     # verify that negative number sign extension works properly
    srav $16, $t0, $t1     # verify that negative number sign extension works properly
    srav $17, $t0, $t1     # verify that negative number sign extension works properly
    srav $18, $t0, $t1     # verify that negative number sign extension works properly
    srav $19, $t0, $t1     # verify that negative number sign extension works properly
    srav $20, $t0, $t1     # verify that negative number sign extension works properly
    srav $21, $t0, $t1     # verify that negative number sign extension works properly
    srav $22, $t0, $t1     # verify that negative number sign extension works properly
    srav $23, $t0, $t1     # verify that negative number sign extension works properly
    srav $24, $t0, $t1     # verify that negative number sign extension works properly
    srav $25, $t0, $t1     # verify that negative number sign extension works properly
    srav $26, $t0, $t1     # verify that negative number sign extension works properly
    srav $27, $t0, $t1     # verify that negative number sign extension works properly
    srav $28, $t0, $t1     # verify that negative number sign extension works properly
    srav $29, $t0, $t1     # verify that negative number sign extension works properly
    srav $30, $t0, $t1     # verify that negative number sign extension works properly
    srav $31, $t0, $t1     # verify that negative number sign extension works properly
    # End Test

    # Exit program
    halt
