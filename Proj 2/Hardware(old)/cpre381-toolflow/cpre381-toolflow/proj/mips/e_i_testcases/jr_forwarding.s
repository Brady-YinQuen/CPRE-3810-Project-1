.text
.globl main
main:

# --- Test 1: Forward from EX/MEM (jr uses $ra written in previous instruction)
    jal jr_target1                # $ra = address of jr_target1
    add $ra, $ra, $zero           # dummy op
    jr $ra                        # Forward from EX/MEM
    nop

jr_target1:
    j done                        # End test cleanly

# --- Test 2: Forward from MEM/WB (1 instruction between write and jr)
end1:
    jal jr_target2
    nop
    jr $ra                        # Forward from MEM/WB
    nop

jr_target2:
    j done

# --- Test 3: No hazard (value in $ra written long before jr)
end2:
    jal jr_target3
    nop
    nop
    nop
    jr $ra                        # No hazard
    nop

jr_target3:
    j done

# --- Test 4: Forward from EX/MEM to jr using $t1 instead of $ra
end3:
    jal jr_target4
    add $t1, $ra, $zero
    jr $t1                        # Forward from EX/MEM
    nop

jr_target4:
    j done

# --- Test 5: Forward from MEM/WB to jr using $t2 instead of $ra
end4:
    jal jr_target5
    nop
    add $t2, $ra, $zero
    jr $t2                        # Forward from MEM/WB
    nop

jr_target5:
    j done

# --- Test 6: jr immediately after jal (testing if $ra written in ID works)
end5:
    jal jr_target6
    jr $ra                        # Use $ra immediately
    nop

jr_target6:
    j done

# --- End of all tests
end6:
done:
    # Halt simulation cleanly (MARS stops when it runs out of instructions)
    nop
halt