# lbu (load byte unsigned) Test File 1 - Common Case
# R[rt] = {24'b0, M[R[rs]+SignExtImm](7:0)} - I-type
# opcode $rt, 16-bitImmediate($rs)

.data
.align 0
vals: .byte 0x78 0x56 0x34 0x12
.text
.globl main
main:
    # Initialization
    lui $s0, 0x1001
    
    # Start Test
    lbu $t0, 0($s0) # verify that $t0 holds 0x00000078
    lbu $t1, 1($s0) # verify that $t1 holds 0x00000056
    lbu $t2, 2($s0) # verify that $t2 holds 0x00000034
    lbu $t3, 3($s0) # verify that $t3 holds 0x00000012
    
    # End Test

    # Exit program
    halt
