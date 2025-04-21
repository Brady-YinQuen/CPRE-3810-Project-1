.data
.text
.globl main
main:

lui $t0, 0x7FFF
addi $t0, $t0, 0x7FFF # put largest 32-bit 2's comp number into $t0 - 0x7FFF_FFFF
addi $t0, $t0, 0x7FFF # do this because for some reason MARs keeps turning it into li psudo-instrution probably to do with
addi $t0, $t0, 1      # sign extention. Doesn't really matter since this is just addi.


addiu $t1, $t0, 1 # test shows how overflow sould be ingnored and reg value should be looped around.
				   # Expected: $t0 = 0x7FFFFFFF = 2147483647
				   #		   $t1 = 0x80000000 = -2147483648


halt # end