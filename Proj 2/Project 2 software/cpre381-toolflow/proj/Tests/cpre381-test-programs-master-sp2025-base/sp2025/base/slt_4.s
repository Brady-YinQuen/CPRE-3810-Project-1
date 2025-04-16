.data
.text
.globl main 
main: 
#inilize tests 
	#start tests. 
	#This tests a common case instruction. Just two basic psoitvie numbers. 
	
	addiu $8, $0, 0x8 #set $8 to a basic posivtive value of . 
	addiu $9, $0, 0x5 #set $9 to a basic positive value of 5. 

	#Test the instruction 
	slt $10, $8, $9 #$8 is greater than $9 so $10 should be 0. 
	
	#next revers the test. 
	slt $11, $9, $8 #$9 is less than $t8 so $11 should be 1. 
	
	#end program 
	halt 