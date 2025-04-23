.data
.text
.globl main
main:

lui $t0, 0x0111

addiu $t0, $t0, 0x0111 # test shows adding an immediate to the same register with upper immediate. Expected $t0 = 0x01110111

halt # end