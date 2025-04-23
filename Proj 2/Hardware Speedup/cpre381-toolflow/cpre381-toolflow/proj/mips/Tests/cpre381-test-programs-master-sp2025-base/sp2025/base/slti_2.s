.data
.text
.globl main
main:
    # Start Test		  This test checks slti's functionality when numbers are equal
    addiu $t0, $0, 1234
    slti $t1, $t0, 1234
    
    addiu $t0, $0, 0
    slti $t1, $t0, 0
    
    addiu $t0, $0, 0x7FFF
    slti $t1, $t0, 0x7FFF
    
    addiu $t0, $0, 0x7AAA
    slti $t1, $t0, 0x7AAA
    
    addiu $t0, $0, 0x7CAC
    slti $t1, $t0, 0x7CAC
    # End Test
    
    # End Program
    halt
