.data
.text
.globl main
main:
    # Start Test		  This test checks slti's functionality near overflow boundaries
    addiu $t0, $0, 0
    lui $t0, 0x8000		# Load smallest int into $t0 to test for overflow depending on slti implementation
    slti $t1, $t0, 10
    slti $t1, $t0, -10		# Check positive and negative immediate value
    
    lui $t0, 0x7FFF	
    ori $t0, $t0, 0xFFFF	# Load largest int into $t0 to test for overflow depending on slti implementation
    slti $t1, $t0, 10
    slti $t1, $t0, -10		# Check positive and negative immediate value
    # End Test
    
    # End Program
    halt