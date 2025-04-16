.data
	word_data: .word 0x44332211 # store word 0x44332211 in memory
.align 2
.text
.globl main
main:
    # Start Test
    # Assuming word_data is placed at 0x10010000
    lui $t0, 0x1001 # $t0 = 0x10010000
    lb $t1, 0($t0) # Load byte at offset 0 ($t1 = 0x11)
    lb $t2, 1($t0) # Load byte at offset 1 ($t2 = 0x22)
    lb $t3, 2($t0) # Load byte at offset 2 ($t3 = 0x33)
    lb $t4, 3($t0) # Load byte at offset 3 ($t4 = 0x44)

    halt

    
    # Expected outcome: $t1 = 0x11, $t2 = 0x22, $t3 = 0x33, $t4 = 0x44
    
    # This test is made for testing
    # the offset functionality for lb
    # making sure that it loads the correct
    # value based on a different offset
