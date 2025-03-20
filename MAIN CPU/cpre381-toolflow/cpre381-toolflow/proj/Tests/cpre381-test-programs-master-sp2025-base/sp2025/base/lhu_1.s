#Template taken from "addi_duwe_0.s"

.data

halfwordData:
.half 0x4474

.text
.globl main

#Test Case 1: Basic test case to test if the basic functionality of lhu works. This case loads a halfword from memory into a register.
# This case enures that the upper 16-bits of the register (getting the halfword loaded into it), are cleared (since lhu is unsigned).

# Start Test
main:
lui $t0, 0x1001
addiu $t0, $t0, 0x0000
lhu $t1, 0($t0)
# End Test

#After the above instructions execute, we expect register $t1 to contain the value 0x00004474


# Exit Program
halt
    
