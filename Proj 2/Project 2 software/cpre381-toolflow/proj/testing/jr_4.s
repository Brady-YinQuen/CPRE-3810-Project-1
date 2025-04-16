.data
.text
.globl main
#The point of this test is to check that it can properly return to a callee function
#Start Test

main:
addi $a0, $zero, 1 #initalize a argument value
jal add #call the function to store an ra
j exit #jump to end of program

add:
addu $a0, $a0, 1 #increment just to show weve been here
jr $ra #return using jump to ra

#end test
exit:

#exit program
halt