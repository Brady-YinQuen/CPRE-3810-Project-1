.data
.text
.globl main
# This test is just to test the basic functionality of jr. The PC should update properly after the jr. 
#Start Test

main:
la $t0, endtest #load an address to jump to

jr $t0 #check standard functionality to see if it jumped to proper place

endtest:

#exit program
halt