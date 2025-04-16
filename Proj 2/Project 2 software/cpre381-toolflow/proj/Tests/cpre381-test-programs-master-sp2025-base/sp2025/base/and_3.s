.data
.text
.globl main
main:
#start test

#This test will test anding two alternate values being 0101.... 1010.... 
#This will test whether the reulrst behave as expected when alternating patterns overlap
#The expected results of this test will be all zeroes because the two numbers have nothing in common bitwise with eachother
#At this point it may seem like a small test, but the test beforehand have already verified that all of the registers as expected up to this point
#So simply testing two registers should give an accurate representation of the whole register file

    #intialize the registers with 0x55555555 or 01010101010101....
    addi $1, $0, 0x55555555
    
    #intialize the registers with 0xAAAAAAAA or 1010101010101010...
    addi $2, $0, 0xAAAAAAAA
    
    #add all ones into $3, and $4, after the and operation they should revert back to all zeroes
    addi $3, $0, 0xFFFFFFFF
    addi $4, $0, 0xFFFFFFFF
    
    #and the two cases 
    and $3, $1, $2
    and $4, $2, $1
    
    halt
    
