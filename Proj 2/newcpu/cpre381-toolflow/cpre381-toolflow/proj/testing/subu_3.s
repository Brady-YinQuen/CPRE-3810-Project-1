.data
.text
.globl main
main:

# This test focuses on subu edge cases, such as wraparound behavior.

# Load values into registers
    lui     $1,     0x8000          # Load 0x80000000 (smallest signed integer)
    lui     $2,     0x7FFF          # Load 0x7FFF0000
    ori     $2,     $2,     0xFFFF  # (largest signed integer)
    addiu   $3,     $0,     -1      # Load -1 into $3
    addiu   $4,     $0,     1       # Load 1 into $4
    addiu   $5,     $0,     -1      # Load -1 into $5
    lui     $6,     0x0001          # Load 0x00010000 into $6
    addiu   $7,     $0,     0       # Load zero into $7

# 1. Testing wraparound when subtracting a larger value
    subu    $8,     $4,     $3      # 1 - 0xFFFFFFFF = 0x00000002 (wraparound)

# 2. Testing subtraction of the smallest signed integer from itself
    subu    $9,     $1,     $1      # 0x80000000 - 0x80000000 = 0x00000000

# 3. Testing subtraction of the maximum unsigned value from itself
    subu    $10,    $3,     $3      # 0xFFFFFFFF - 0xFFFFFFFF = 0x00000000

# 4. Subtracting zero should not change the value
    subu    $11,    $2,     $0      # 0x7FFFFFFF - 0 = 0x7FFFFFFF

# 5. Testing subtraction of a large value from a small value
    subu    $12,    $4,     $6      # 1 - 0x00010000 = 0xFFFF0001 (wraparound)

# Exit program
    halt    
