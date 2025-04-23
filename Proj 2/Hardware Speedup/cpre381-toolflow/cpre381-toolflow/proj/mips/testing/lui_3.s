.data
.text
.globl main
main:

lui $t0, 0xFFFF   # Expect $t0 = 0xFFFF0000
lui $t1, 0x7FFF   # Expect $t1 = 0x7FFF0000 (maximum positive 16-bit value)
lui $t2, 0x8000   # Expect $t2 = 0x80000000 (smallest negative 16-bit value in signed interpretation)


#edge cases of lui, load all ones, smallest and largest values.

halt
