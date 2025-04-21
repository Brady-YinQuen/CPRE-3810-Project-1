.data
.text
.globl main
#The point of this test is to check that multiple jr registers can be performed on the same reigster that just gets overwritten.
#Start Test

main:

la $t1, second #load address to label second
jr $t1 #jump to second

second:

la $t1, third #load address to label third
jr $t1 #jump to third


third:
la $t1, exit #load adress for exit
jr $t1 #jump to exit

#end test
exit:

#exit program
halt