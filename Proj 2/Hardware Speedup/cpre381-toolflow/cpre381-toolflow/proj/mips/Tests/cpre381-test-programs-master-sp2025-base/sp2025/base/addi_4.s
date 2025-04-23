.data
.text
.globl main
main:
#GOAL: each odd register (starting at register 3) increments by 4, each even register decrements by 5 

#start
addi $1, $0, -1 #initializes register 1 as -1
addi $2, $1, -5
addi $3, $2, 4
addi $4, $3, -5
addi $5, $4, 4
addi $6, $5, -5

    halt
