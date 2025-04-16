.data
.text
.globl main 
main: 
#inilize tests 
	#start tests. 
	#This tests a common case instruction. It test a negative and a positive the make sure the negaive is not being read as higher. 
	 
	
	addiu $8, $0, 0x8 #set $8 to a basic posivtive value of 8. 
	lui $9, 0xFFFF #set upper bits of $9 to a negative number. 
	ori $9, $9, 0xFFF8 #set $9 to a negative value of -8. 

	#Test the instruction 
	slt $10, $8, $9 #$8 is greater than $9 so $10 should be 0. 
	
	#next revers the test. 
	slt $11, $9, $8 #$9 is less than $t8 so $11 should be 1. 
	
	#end program 
	halt 