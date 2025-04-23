.data
.text
.globl main
#case 1: simple shift from bit pos 0 to bit pos 1 - as common of a case as it gets
main:
lui $t0, 0x0000
ori $t0, $t0, 0x0001 
sll $t0, $t0, 1
#outcome: $t0 should be 0x00000002.
halt