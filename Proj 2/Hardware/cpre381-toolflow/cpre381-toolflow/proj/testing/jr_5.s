.text
.globl main

main:
    la   $t0, target1 
    la   $t1, target2   
    la   $t2, target3   
    la   $t3, target4  
    addiu $t6, $zero, 2
    addu  $s0, $zero,  $t0      

jump_loop:
    jr   $s0            
    nop               

target1:
    addu $s0, $zero, $t1      
    jr   $s0          
    nop

target2:
    addu $s0, $zero $t2
    jr   $s0
    nop

target3:
    addu $s0, $zero, $t3
    jr   $s0
    nop

target4:
    addu $s0, $zero $t0       # Loop back to target1
    addiu $t5, $t5, 1
    
    beq $t5, $t6, exit
    jr   $s0
    nop
    
exit: 
halt      
