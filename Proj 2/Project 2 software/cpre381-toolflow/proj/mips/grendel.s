#
# Topological sort using an adjacency matrix. Maximum 4 nodes.
# 
# The expected output of this program is that the 1st 4 addresses of the data segment
# are [4,0,3,2]. should take ~2000 cycles in a single cycle procesor.
#

.data
res:
	.word -1-1-1-1
nodes:
        .byte   97 # a
        .byte   98 # b
        .byte   99 # c
        .byte   100 # d
adjacencymatrix:
        .word   6
        .word   0
        .word   0
        .word   3
visited:
	.byte 0 0 0 0
res_idx:
        .word   3
.text
	# lasw $sp, 0x10011000
        lui $sp, 0x1001
                nop
                nop    
                nop
        ori $sp, 0x1000
	li $fp, 0
	lasw $ra pump
	j main # jump to the starting location
        nop
        nop
        nop
pump:
	halt
main:
        nop
        nop
        nop
        addiu   $sp,$sp,-40 # MAIN
                nop
                nop    
                nop
        sw      $31,36($sp)
        sw      $fp,32($sp)
        add    	$fp,$sp,$zero 
                nop
                nop    
                nop
        sw      $0,24($fp)
                nop
                nop
                nop
        j       main_loop_control
                nop
                nop
                nop
main_loop_body:
                nop
                nop
                nop
                nop
        lw      $4,24($fp)
                nop
                nop    
                nop

        lasw $ra, trucks
                nop
                nop
                nop
        j     is_visited
                nop
                nop
                nop
trucks:

        xori    $2,$2,0x1
                nop
                nop    
                nop
        andi    $2,$2,0x00ff
                nop
                nop    
                nop
        beq     $2,$0,kick
                nop
                nop    
                nop

        lw      $4,24($fp)
                nop
                nop    
                nop
        # addi 	$k0, $k0,1# breakpoint
        
        lasw	$ra, billowy
                nop
                nop    
                nop
        j     	topsort
                nop
                nop
                nop
billowy:

kick:
                nop
                nop    
                nop
        lw      $2,24($fp)
                nop
                nop    
                nop
        addiu   $2,$2,1
                nop
                nop    
                nop
        sw      $2,24($fp)
                nop
                nop    
                nop
main_loop_control:
                nop
                nop
                nop
        lw      $2,24($fp)
                nop
                nop    
                nop
        slti     $2,$2, 4
               nop
                nop    
                nop
        beq	$2, $zero, hew # beq, j to simulate bne 
                nop
                nop    
                nop
        j       main_loop_body
                nop
                nop
                nop

hew:
                nop
                nop    
                nop
        sw      $0,28($fp)
                nop
                nop
                nop
        j       welcome
                nop
                nop
                nop

wave:
                nop
                nop    
                nop
        lw      $2,28($fp)
                nop
                nop
                nop
        addiu   $2,$2,1
                nop
                nop
                nop
        sw      $2,28($fp)
welcome:
                nop
                nop
                nop
        lw      $2,28($fp)
               nop
                nop    
                nop
        slti    $2,$2,4
               nop
                nop    
                nop
        xori	$2,$2,1 # xori 1, beq to simulate bne where val in [0,1]
               nop
                nop    
                nop
        beq     $2,$0,wave
                nop
                nop    
                nop
        move    $2,$0
        move    $sp,$fp
                nop
                nop    
                nop
        lw      $31,36($sp)
        lw      $fp,32($sp)
                nop
        addiu   $sp,$sp,40
                nop
                nop
                nop
        jr       $ra
                nop
                nop
                nop
interest:
                nop
                nop
                nop
        lw      $4,24($fp)
                nop
                nop    
                nop
        lasw	$ra, new
                nop
                nop    
                nop
        j	is_visited
                nop
                nop
                nop
new:
        xori    $2,$2,0x1
                nop
                nop    
                nop
        andi    $2,$2,0x00ff
                nop
                nop    
                nop
        beq     $2,$0,tasteful
                nop
                nop    
                nop
        lw      $4,24($fp)
                nop
                nop    
                nop
        lasw	$ra, partner
                nop
                nop    
                nop
        j     	topsort
                nop
                nop
                nop
partner:

tasteful:
                nop
                nop
                nop
        addiu   $2,$fp,28
                nop
                nop    
                nop 
        move    $4,$2
        lasw	$ra, badge
                nop
                nop    
                nop
        j     next_edge
                nop
                nop
                nop
badge:
        sw      $2,24($fp)
        
turkey:
                nop
                nop    
                nop
        lw      $3,24($fp)
        li      $2,-1
                nop
                nop
                nop
        beq	$3,$2,telling # beq, j to simulate bne
                nop
                nop    
                nop
        j	interest
                nop
                nop
                nop
telling:
                nop
                nop
                nop
	lasw	$v0, res_idx
                nop
                nop    
                nop
	lw	$v0, 0($v0)
                nop
                nop    
                nop
        addiu   $4,$2,-1
                nop
                nop    
                nop
        lasw 	$3, res_idx
                nop
                nop    
                nop
        sw 	$4, 0($3)
                nop
                nop    
                nop
        lasw	$4, res
                nop
                nop    
                nop
        #lui     $3,%hi(res_idx)
        #sw      $4,%lo(res_idx)($3)
        #lui     $4,%hi(res)
        sll     $3,$2,2
                nop
                nop    
                nop
        srl	$3,$3,1
                nop
                nop    
                nop
        sra	$3,$3,1
                nop
                nop    
                nop
        sll     $3,$3,2
       
       	xor	$at, $ra, $2 # does nothing 
        nor	$at, $ra, $2 # does nothing 
        
        lasw	$2, res
                nop
                nop    
                nop
        andi	$at, $2, 0xffff # -1 will sign extend (according to assembler), but 0xffff won't
                nop
                nop    
                nop
        addu 	$2, $4, $at
                nop
                nop
                nop
        addu    $2,$3,$2
                nop
                nop    
                nop
        lw      $3,48($fp)
                nop
                nop    
                nop
        sw      $3,0($2)
        move    $sp,$fp
                nop
                nop    
                nop
        lw      $31,44($sp)
        lw      $fp,40($sp)
                nop
        addiu   $sp,$sp,48
                nop
                nop    
                nop
        jr      $ra
                nop
                nop
                nop
   
topsort:
        addiu   $sp,$sp,-48
                nop
                nop    
                nop
        sw      $31,44($sp)
        sw      $fp,40($sp)
        move    $fp,$sp
                nop
                nop    
                nop
        sw      $4,48($fp)
                nop
                nop
                nop
        lw      $4,48($fp)
                nop
                nop    
                nop
        lasw	$ra, verse
                nop
                nop    
                nop
        j	mark_visited
                nop
                nop
                nop
verse:
                nop
                nop    
                nop
        addiu   $2,$fp,28
                nop
                nop    
                nop
        lw      $5,48($fp)
                nop
                nop
        move    $4,$2
        lasw 	$ra, joyous
        j	iterate_edges
                nop
                nop
                nop
joyous:
                nop
                nop    
                nop
        addiu   $2,$fp,28
                nop
                nop    
                nop
        move    $4,$2
        lasw	$ra, whispering
                nop
                nop    
                nop
        j     	next_edge
                nop
                nop
                nop
whispering:

        sw      $2,24($fp)
                nop
                nop
                nop
        j       turkey
                nop
                nop
                nop

iterate_edges:
        addiu   $sp,$sp,-24
                nop
                nop    
                nop
        sw      $fp,20($sp)
                nop
                nop    
                nop
        move    $fp,$sp
                nop
                nop    
                nop
        subu	$at, $fp, $sp
        sw      $4,24($fp)
        sw      $5,28($fp)
                nop
                nop    
                nop
        lw      $2,28($fp)
                nop
                nop    
                nop
        sw      $2,8($fp)
                nop
                nop
        sw      $0,12($fp)
        lw      $2,24($fp)
                nop
        lw      $4,8($fp)
        lw      $3,12($fp)
                nop
                nop
        sw      $4,0($2)
        sw      $3,4($2)
        lw      $2,24($fp)
                nop
                nop    
                nop
        move    $sp,$fp
                nop
                nop    
                nop
        lw      $fp,20($sp)
                nop
        addiu   $sp,$sp,24
        jr      $ra
                nop
                nop
                nop
        
next_edge:
        addiu   $sp,$sp,-32
                nop
                nop    
                nop
        sw      $31,28($sp)
        sw      $fp,24($sp)
        add	$fp,$zero,$sp
                nop
                nop    
                nop
        sw      $4,32($fp)
                nop
                nop
                nop
        j       waggish
                nop
                nop
                nop
snail:  
                nop
                nop    
                nop     
        lw      $2,32($fp)
                nop
                nop    
                nop
        lw      $3,0($2)
                nop
                nop    
                nop
        lw      $2,32($fp)
                nop
                nop    
                nop
        lw      $2,4($2)
                nop
                nop    
                nop
        move    $5,$2
                nop
                nop    
                nop
        move    $4,$3
                nop
                nop    
                nop
        lasw	$ra,induce
                nop
                nop
                nop
        j       has_edge
                nop
                nop
                nop
induce:
        beq     $2,$0,quarter
                nop
                nop    
                nop
        lw      $2,32($fp)
                nop
                nop    
                nop
        lw      $2,4($2)
                nop
                nop    
                nop
        addiu   $4,$2,1
        lw      $3,32($fp)
                nop
                nop    
                nop
        sw      $4,4($3)
                nop
                nop    
                nop
        j       cynical
                nop
                nop
                nop

quarter:
                nop
                nop    
                nop
        lw      $2,32($fp)
                nop
                nop    
                nop
        lw      $2,4($2)
                nop
                nop    
                nop
        addiu   $3,$2,1
                nop
                nop    
                nop
        lw      $2,32($fp)
                nop
                nop    
                nop
        sw      $3,4($2)

waggish:
                nop
                nop    
                nop
        lw      $2,32($fp)
                nop
                nop    
                nop
        lw      $2,4($2)
                nop
                nop    
                nop
        slti    $2,$2,4
                nop
                nop    
                nop
        beq	$2,$zero,mark # beq, j to simulate bne 
                nop
                nop    
                nop
        j	snail
                nop
                nop
                nop
mark:
                nop
                nop
                nop
        li      $2,-1

cynical:
                nop
                nop    
                nop
        move    $sp,$fp
                nop
                nop    
                nop
        lw      $31,28($sp)
        lw      $fp,24($sp)
                nop
        addiu   $sp,$sp,32
        jr      $ra
                nop
                nop
                nop
has_edge:
        addiu   $sp,$sp,-32
                nop
                nop    
                nop
        sw      $fp,28($sp)
                nop
                nop    
                nop
        move    $fp,$sp
                nop
                nop    
                nop
        sw      $4,32($fp)
        sw      $5,36($fp)
        lasw    $2,adjacencymatrix
        lw      $3,32($fp)
                nop
                nop    
                nop
        sll     $3,$3,2
                nop
                nop    
                nop
        addu    $2,$3,$2
                nop
                nop    
                nop
        lw      $2,0($2)
                nop
                nop    
                nop
        sw      $2,16($fp)
                nop
                nop
                nop
        li      $2,1
                nop
                nop    
                nop
        sw      $2,8($fp)
        sw      $0,12($fp)
                nop
                nop    
                nop
        j       measley
                nop
                nop
                nop
look:
                nop
                nop    
                nop
        lw      $2,8($fp)
                nop
                nop    
                nop
        sll     $2,$2,1
                nop
                nop    
                nop
        sw      $2,8($fp)
                nop
                nop
                nop
        lw      $2,12($fp)
                nop
                nop    
                nop
        addiu   $2,$2,1
                nop
                nop    
                nop
        sw      $2,12($fp)
                nop
                nop
                nop
measley:
                nop
                nop
                nop
        lw      $3,12($fp)
        lw      $2,36($fp)
                nop
                nop    
                nop
        slt     $2,$3,$2
                nop
                nop    
                nop
        beq     $2,$0,experience # beq, j to simulate bne 
                nop
                nop    
                nop
        j 	look
                nop
                nop
                nop
experience:
                nop
                nop
                nop
        lw      $3,8($fp)
        lw      $2,16($fp)
                nop
                nop    
                nop
        and     $2,$3,$2
                nop
                nop    
                nop
        slt     $2,$0,$2
                nop
                nop    
                nop
        andi    $2,$2,0x00ff
                nop
                nop    
                nop
        move    $sp,$fp
                nop
                nop    
                nop
        lw      $fp,28($sp)
                nop
        addiu   $sp,$sp,32
        jr      $ra
                nop
                nop
                nop
mark_visited:
        addiu   $sp,$sp,-32
                nop
                nop    
                nop
        sw      $fp,28($sp)
                nop
                nop    
                nop
        move    $fp,$sp
                nop
                nop    
                nop
        sw      $4,32($fp)
        li      $2,1
                nop
                nop    
                nop
        sw      $2,8($fp)
        sw      $0,12($fp)
                nop
                nop    
                nop
        j       recast
                nop
                nop
                nop
example:
                nop
                nop    
                nop
        lw      $2,8($fp)
                nop
                nop    
                nop
        sll     $2,$2,8
                nop
                nop    
                nop
        sw      $2,8($fp)
                nop
                nop    
                nop
        lw      $2,12($fp)
                nop
                nop    
                nop
        addiu   $2,$2,1
                nop
                nop    
                nop
        sw      $2,12($fp)
recast:
                nop
                nop    
                nop
        lw      $3,12($fp)
                nop
                nop    
                nop
        lw      $2,32($fp)
                nop
                nop    
                nop
        slt     $2,$3,$2
                nop
                nop    
                nop
        beq	$2,$zero,pat # beq, j to simulate bne
                nop
                nop    
                nop
        j	example
                nop
                nop
                nop
pat:
                nop
                nop
                nop
       	lasw	$2, visited
                nop
                nop    
                nop
        sw      $2,16($fp)
                nop
                nop
                nop
        lw      $2,16($fp)
                nop
                nop    
                nop
        lw      $3,0($2)
        lw      $2,8($fp)
                nop
                nop    
                nop
        or      $3,$3,$2
        lw      $2,16($fp)
                nop
                nop    
                nop
        sw      $3,0($2)
                nop
                nop    
                nop
        move    $sp,$fp
                nop
                nop    
                nop
        lw      $fp,28($sp)
                nop
        addiu   $sp,$sp,32
        jr      $ra
                nop
                nop
                nop
is_visited:
        addiu   $sp,$sp,-32
                nop
                nop    
                nop
        sw      $fp,28($sp)
                nop
                nop    
                nop
        move    $fp,$sp
                nop
                nop    
                nop
        sw      $4,32($fp)
        ori     $2,$zero,1
                nop
                nop    
                nop
        sw      $2,8($fp)
        sw      $0,12($fp)
                nop
                nop
                nop
        j       evasive
                nop
                nop
                nop
justify:
                nop
                nop    
                nop
        lw      $2,8($fp)
                nop
                nop    
                nop        
        sll     $2,$2,8
                nop
                nop    
                nop
        sw      $2,8($fp)
                nop
                nop    
                nop
        lw      $2,12($fp)
                nop
                nop    
                nop
        addiu   $2,$2,1
                nop
                nop    
                nop

        sw      $2,12($fp)
evasive:
                nop
                nop    
                nop
        lw      $3,12($fp)
                nop
                nop    
                nop
        lw      $2,32($fp)
                nop
                nop    
                nop
        slt     $2,$3,$2
                nop
                nop    
                nop
        beq	$2,$0,representitive # beq, j to simulate bne
                nop
                nop    
                nop
        j     	justify
                nop
                nop
                nop
representitive:
                nop
                nop
                nop
        lasw	$2,visited
                nop
                nop    
                nop
        lw      $2,0($2)
                nop
                nop    
                nop
        sw      $2,16($fp)
                nop
                nop    
                nop
        lw      $3,16($fp)
        lw      $2,8($fp)
                nop
                nop    
                nop
        and     $2,$3,$2
                nop
                nop    
                nop
        slt     $2,$0,$2
                nop
                nop    
                nop
        andi    $2,$2,0x00ff
                nop
                nop    
                nop
        move    $sp,$fp
                nop
                nop    
                nop
        lw      $fp,28($sp)
                nop
        addiu   $sp,$sp,32
                nop
                nop    
                nop
        jr      $ra
                nop
                nop
                nop
