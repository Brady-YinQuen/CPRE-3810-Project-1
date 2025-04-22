.data
val1: .word 42
val2: .word 17
val3: .word 99

.text
.globl main
main:

#### --- Test 1: Load-use hazard (requires stall if no forwarding)
    lw   $t0, val1       # Load 42 into $t0
    add  $t1, $t0, $zero # Use $t0 immediately (hazard!)
    nop

#### --- Test 2: Load, one instruction delay (forward from MEM/WB)
    lw   $t2, val2
    nop                 # Delay slot
    add  $t3, $t2, $zero # Should work with MEM/WB forwarding

#### --- Test 3: Load, multiple delay instructions (no hazard)
    lw   $t4, val3
    nop
    nop
    nop
    add  $t5, $t4, $zero # Safe — no hazard

#### --- Test 4: Load followed by store to same register (check if store waits)
    lw   $t6, val1
    sw   $t6, 0($sp)     # May need stall or forward

#### --- Done
done:
    nop
halt