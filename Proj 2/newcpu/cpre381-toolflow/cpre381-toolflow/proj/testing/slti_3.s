.data
.text
.globl main
main:
    # Start Test		  This test checks slti's general functionality with 'normal' values
    addiu $t0, $0, 10
    slti $t1, $t0, 5		# 10 < 5
    
    addiu $t0, $0, 10
    slti $t1, $t0, 20		# 10 < 20
    
    addiu $t0, $0, 10
    slti $t1, $t0, -5		# 10 < -5
    
    addiu $t0, $0, 0x7FFF
    slti $t1, $t0, 0x7FFE	# 0x7FFF < 0x7FFE
    
    addiu $t0, $0, -10
    slti $t1, $t0, 5		# -10 < 5
    
    addiu $t0, $0, -15
    slti $t1, $t0, -5		# -15 < -5
    
    addiu $t0, $0, -15
    slti $t1, $t0, -20		# -15 < -20
    
    slti $t1, $0, -20		# Testing operation with $0 register
    slti $t1, $0, 20
    slti $t1, $0, 0
    slti $0, $0, 0		# NOP
    # End Test
    
    # End Program
    halt
