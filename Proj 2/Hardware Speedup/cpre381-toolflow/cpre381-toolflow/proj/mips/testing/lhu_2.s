#Template taken from "addi_duwe_0.s"

.data

halfwordDataEchelons:
.half 0x0000, 0xFFFF

.text
.globl main

#Test Case 2: This test case tests our boundaries for lhu. We ensure that we are able to load the highest value (0xFFFF), aswell as the lowest
# value (0x0000). In theory, if we are able to load the upper and lower echelons, we should be able to load any/all value(s) inbetween.

# Start Test
main:

lui $t0, 0x1001				#load base addy
addiu $t0, $t0, 0x0000			
lhu $t1, 0($t0)				#load lower echelon (0x0000)
lhu $t2, 2($t0)				#load upper echelon (0xFFFF)
# End Test

#After the above instructions execute, we expect register $t1 to contain the value 0x00000000, and register $t2 to contain the value 0x0000FFFF


# Exit Program
halt
