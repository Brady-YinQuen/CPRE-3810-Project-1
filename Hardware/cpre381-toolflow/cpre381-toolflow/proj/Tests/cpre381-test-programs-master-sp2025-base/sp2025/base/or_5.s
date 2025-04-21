.data
.text
.globl main
main:
    # Start Test
    addi $1, $0, 0xFFFF     	# ADD all 1's to the lower nibble of $1
    lui $1, 0xFFFF          	# LOAD all 1's to the upper nibble of $1      $1 = 0xFFFFFFFF
    # $1 = 0xFFFFFFFF
    
    addi $3, $0, 0xAAAA     	# ADD all 1's to the lower nibble of $1
    lui $3, 0x5555          	# LOAD all 1's to the upper nibble of $1      $1 = 0xFFFFFFFF
    # $3 = 0x5555AAAA
    
    addi $4, $0, 0x0000     	# ADD all 1's to the lower nibble of $1
    lui $4, 0x1234          	# LOAD all 1's to the upper nibble of $1      $1 = 0xFFFFFFFF
    # $4 = 0x12340000
    
        
    or $2, $1, $0           	# Verify that all 1's OR all 0's results in all 1's
    or $2, $1, $1           	# Verify that all 1's OR all 1's results in all 1's
    
    or $2, $3, $4           	# Verify that 0x5555AAAAA | 0x12340000   =   0x5775AAAA
    or $2, $4, $3            	# Verify that $3, $4    provides same value as   $4, $3   
    
    or $2, $2, $4            	# Verify that $2 stays consistent since its performing OR on itself and previous OR value $4
    or $2, $2, $1 		# Verify that $2 becomes all 1's after performing OR with itself and 0xFFFFFFFF
    
    # End Test

    # Exit program
    halt
