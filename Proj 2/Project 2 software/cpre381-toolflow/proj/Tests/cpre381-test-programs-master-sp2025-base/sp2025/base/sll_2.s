.data
.text
.globl main
#case 2: shift a register by 0. then, shift a register of all 1's by 31 into a different register that is preloaded with another value, then shift again by 31 into a different register.
#this case tests maxing out shamt, minning (?) out shamt, and performing sll across registers. also ensures that their architecture's barrel shifter is clearing and not cycling here.
main:
#load initial register with all 1's
lui $t0, 0xFFFF
ori $t0, $t0, 0xFFFF
#load end register with a different value
lui $t1, 0x3810
ori $t1, $t1, 0x3810
#sll original register by 31, the maximum value available with shamt.
sll $t0, $t0, 0
#at this point, $t0 should be 0xFFFFFFFF. now, shift again by 31 and store in $t1.
sll $t1, $t0, 31
#now, $t1 should be 0x80000000. shift again into $t2
sll $t2, $t1, 31
#outcome: $t0 = 0xFFFFFFFF, $t1 = 0x80000000, $t2 = 0x00000000
halt