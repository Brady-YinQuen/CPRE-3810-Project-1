#Template taken from "addi_duwe_0.s"

.data

halfwordsData:
.half 0x2865, 0x5EFB, 0x4ACF, 0x1960, 0x55555

.text
.globl main

#Test Case 3: This tes case ensures we are able to consecutivly load different halfwords into different registers. At the end, we also test that
# we are able to switch/replace and previously loaded value.

# Start Test
main:

la $t0, halfwordsData			

lhu $t1, 0($t0)
lhu $t2, 2($t0)
lhu $t3, 4($t0)
lhu $t4, 6($t0)

lhu $t2, 8($t0)				
# End Test

#After the above instructions execute, we expect the following values in the following registers:
#t1 = 0x2865
#t2 = 0xDEFB --> 0x5555
#t3 = 0xAACF
#t4 = 0x1960

# Exit Program
halt
