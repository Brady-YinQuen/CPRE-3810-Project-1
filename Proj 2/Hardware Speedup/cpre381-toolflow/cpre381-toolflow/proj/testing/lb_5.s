.data
	test_data: .byte 0x80 # store 0x80 = -128 in memory
.text
.globl main
main:
    # Start Test
    lui $t0, 0x1001 # $t0 = 0x10010000
    lb $t1, 0($t0) # Load negative byte from memory assuming test_data is placed at 0x10010000
    
    # Expected outcome: $t1 = 0xFFFFFF80 (-128) sign extended

    halt
    
    # This test is made for testing
    # the sign extending function of
    # the lb command, making sure the
    # negative byte extends the first byte
    # to the rest of the register
