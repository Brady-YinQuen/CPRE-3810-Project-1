.data
.text
.globl main
main:

lui $t0, 0x1234   # Expect $t0 = 0x12340000
lui $t0, 0xFFFF   # Expect $t0 = 0xFFFF0000

#Common case of lui, ensure 16 bit immediate is placed in upper sixteen bits, and bottom sixteen bits are set to zero

halt