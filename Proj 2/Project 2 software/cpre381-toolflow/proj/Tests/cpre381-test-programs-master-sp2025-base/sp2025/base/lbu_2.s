# lbu (load byte unsigned) Test File 1 - Leading 1's Case
# R[rt] = {24'b0, M[R[rs]+SignExtImm](7:0)} - I-type
# opcode $rt, 16-bitImmediate($rs)

.data
.align 0
vals: .byte 0x7F 0x7F 0x7F 0x7F
.text
.globl main
main:
    # Initialization
    lui $s0, 0x1001
    
    # Start Test
    lbu $t0, 0($s0) # verify that $t0 holds 0x0000007F
    lbu $t1, 1($s0) # verify that $t1 holds 0x0000007F
    lbu $t2, 2($s0) # verify that $t2 holds 0x0000007F
    lbu $t3, 3($s0) # verify that $t3 holds 0x0000007F
    
    # End Test

    # Exit program
    halt
