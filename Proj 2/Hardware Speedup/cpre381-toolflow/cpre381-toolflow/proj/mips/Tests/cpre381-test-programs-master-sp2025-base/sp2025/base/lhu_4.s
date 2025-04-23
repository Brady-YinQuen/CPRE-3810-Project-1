#Template taken from "addi_duwe_0.s"

.data

negativeHalfwordData:
.half -34177

.text
.globl main

#Test Case 4: This case enures the lhu instruction properly handles negative values. We are testing to make sure lhu does not sign-extend the
# value (-34177), but rather loads it as an usigned value. This is testing that lhu will load our value without sign-extension.

# Start Test
main:

la $t1, negativeHalfwordData			
lhu $t0, 0($t1)
# End Test

#After the following instructions execute we expect that register $t0 will contain the value 0x7A7F (the 16-bit signed representation of -34177.
# This is calculated by 1) converting 34177 to decimal, 2) invert all bits and finally 3) converting back to hex (from binary). 


# Exit Program
halt
