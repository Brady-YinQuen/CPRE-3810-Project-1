.data
.text
.globl main
main:
 
#tests adding largest positive and negative immediate, will test 0
addi $1, $0, 0x7FFF
addi $2, $1, -32768

addi $3, $0, 0


    halt
