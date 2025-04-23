.data
.text
.globl main
main:

# Normal Case Test File for subu instruction.
# This test ensures that subu correctly performs normal subtraction.

# Load values into registers
    addiu   $1,     $0, 10      # Load 10 into $1
    addiu   $2,     $0, 5       # Load 5 into $2
    addiu   $3,     $0, 20      # Load 20 into $3
    addiu   $4,     $0, 15      # Load 15 into $4
    addiu   $5,     $0, 0       # Load 0 into $5
    addiu   $6,     $0, 100     # Load 100 into $6
    addiu   $7,     $0, 30      # Load 30 into $7

# Basic subtraction
    subu    $8,     $1, $2      # 10 - 5 = 5
    subu    $9,     $3, $4      # 20 - 15 = 5
    subu    $10,    $6, $7      # 100 - 30 = 70
    subu    $11,    $1, $5      # 10 - 0 = 10
    subu    $12,    $5, $1      # 0 - 10 = 0xFFFFFFF6 (since subu is unsigned)

# Exit program
    halt    
