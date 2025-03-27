.data
.text
.globl main
main:
# Normal case, addu two numbers together
# This case will ensure that adding two numbers from two registers works as intending
# Using the $0 register will help simulate copying numbers across all registers (except 0)

# set up, $t1 = 0x20044002
lui $1, 0x2004
addiu $1, $1, 0x4002

# set up, $t2 = 0x0AA2380D
lui $2, 0x0AA2
addiu $2, $2, 0x380D


    # Start Test
    addu $3, $1, $2     # Write the result 0x2AA6_780F, confirming ALU works for register $3
    addu $3, $0, $3     # Confirm that adding register Zero doesnt change value
    addu $4, $3, $0     # Write 0x2AA6_780F to register $4
    addu $5, $4, $0     # Write 0x2AA6_780F to register 
    addu $6, $5, $0     # Write 0x2AA6_780F to register 
    addu $7, $6, $0     # Write 0x2AA6_780F to register 
    addu $8, $7, $0     # Write 0x2AA6_780F to register 
    addu $9, $8, $0     # Write 0x2AA6_780F to register 
    addu $10, $9, $0     # Write 0x2AA6_780F to register 
    addu $11, $10, $0     # Write 0x2AA6_780F to register 
    addu $12, $11, $0     # Write 0x2AA6_780F to register 
    addu $13, $12, $0     # Write 0x2AA6_780F to register 
    addu $14, $13, $0     # Write 0x2AA6_780F to register 
    addu $15, $14, $0     # Write 0x2AA6_780F to register 
    addu $16, $15, $0     # Write 0x2AA6_780F to register 
    addu $17, $16, $0     # Write 0x2AA6_780F to register 
    addu $18, $17, $0     # Write 0x2AA6_780F to register 
    addu $19, $18, $0     # Write 0x2AA6_780F to register 
    addu $20, $19, $0     # Write 0x2AA6_780F to register 
    addu $21, $20, $0     # Write 0x2AA6_780F to register 
    addu $22, $21, $0     # Write 0x2AA6_780F to register 
    addu $23, $22, $0     # Write 0x2AA6_780F to register 
    addu $24, $23, $0     # Write 0x2AA6_780F to register 
    addu $25, $24, $0     # Write 0x2AA6_780F to register 
    addu $26, $25, $0     # Write 0x2AA6_780F to register 
    addu $27, $26, $0     # Write 0x2AA6_780F to register
    addu $28, $27, $0     # Write 0x2AA6_780F to register
    addu $29, $28, $0     # Write 0x2AA6_780F to register
    addu $30, $29, $0     # Write 0x2AA6_780F to register
    addu $31, $30, $0     # Write 0x2AA6_780F to register
       
    # End Test

    # Exit program
    halt
