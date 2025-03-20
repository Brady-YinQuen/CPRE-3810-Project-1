.data
.text
.globl main

main:
    # Start Test 3
    
    
    # Testing Maximum and Minimum values for both positive and negative on each register, including zero (Basically testing all possible edge cases)
    lui $0, 0x0000    # Test with zero value (result: 0x00000000)
    lui $0, 0x0001    # Test with min positive (result: 0x00000000)
    lui $0, 0x7FFF    # Test with max positive (result: 0x00000000)
    lui $0, 0x8000    # Test with min negative (result: 0x00000000)
    lui $0, 0xFFFF    # Test with max negative (result: 0x00000000)
    
    lui $1, 0x0000    # Test with zero value (result: 0x00000000)
    lui $1, 0x0001    # Test with min positive (result: 0x00010000)
    lui $1, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $1, 0x8000    # Test with min negative (result: 0x80000000)
    lui $1, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $2, 0x0000    # Test with zero value (result: 0x00000000)
    lui $2, 0x0001    # Test with min positive (result: 0x00010000)
    lui $2, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $2, 0x8000    # Test with min negative (result: 0x80000000)
    lui $2, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $3, 0x0000    # Test with zero value (result: 0x00000000)
    lui $3, 0x0001    # Test with min positive (result: 0x00010000)
    lui $3, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $3, 0x8000    # Test with min negative (result: 0x80000000)
    lui $3, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $4, 0x0000    # Test with zero value (result: 0x00000000)
    lui $4, 0x0001    # Test with min positive (result: 0x00010000)
    lui $4, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $4, 0x8000    # Test with min negative (result: 0x80000000)
    lui $4, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $5, 0x0000    # Test with zero value (result: 0x00000000)
    lui $5, 0x0001    # Test with min positive (result: 0x00010000)
    lui $5, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $5, 0x8000    # Test with min negative (result: 0x80000000)
    lui $5, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $6, 0x0000    # Test with zero value (result: 0x00000000)
    lui $6, 0x0001    # Test with min positive (result: 0x00010000)
    lui $6, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $6, 0x8000    # Test with min negative (result: 0x80000000)
    lui $6, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $7, 0x0000    # Test with zero value (result: 0x00000000)
    lui $7, 0x0001    # Test with min positive (result: 0x00010000)
    lui $7, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $7, 0x8000    # Test with min negative (result: 0x80000000)
    lui $7, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $8, 0x0000    # Test with zero value (result: 0x00000000)
    lui $8, 0x0001    # Test with min positive (result: 0x00010000)
    lui $8, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $8, 0x8000    # Test with min negative (result: 0x80000000)
    lui $8, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $9, 0x0000    # Test with zero value (result: 0x00000000)
    lui $9, 0x0001    # Test with min positive (result: 0x00010000)
    lui $9, 0x7FFF    # Test with max positive (result: 0x7FFF0000)
    lui $9, 0x8000    # Test with min negative (result: 0x80000000)
    lui $9, 0xFFFF    # Test with max negative (result: 0xFFFF0000)
    
    lui $10, 0x0000   # Test with zero value (result: 0x00000000)
    lui $10, 0x0001   # Test with min positive (result: 0x00010000)
    lui $10, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $10, 0x8000   # Test with min negative (result: 0x80000000)
    lui $10, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $11, 0x0000   # Test with zero value (result: 0x00000000)
    lui $11, 0x0001   # Test with min positive (result: 0x00010000)
    lui $11, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $11, 0x8000   # Test with min negative (result: 0x80000000)
    lui $11, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $12, 0x0000   # Test with zero value (result: 0x00000000)
    lui $12, 0x0001   # Test with min positive (result: 0x00010000)
    lui $12, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $12, 0x8000   # Test with min negative (result: 0x80000000)
    lui $12, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $13, 0x0000   # Test with zero value (result: 0x00000000)
    lui $13, 0x0001   # Test with min positive (result: 0x00010000)
    lui $13, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $13, 0x8000   # Test with min negative (result: 0x80000000)
    lui $13, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $14, 0x0000   # Test with zero value (result: 0x00000000)
    lui $14, 0x0001   # Test with min positive (result: 0x00010000)
    lui $14, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $14, 0x8000   # Test with min negative (result: 0x80000000)
    lui $14, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $15, 0x0000   # Test with zero value (result: 0x00000000)
    lui $15, 0x0001   # Test with min positive (result: 0x00010000)
    lui $15, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $15, 0x8000   # Test with min negative (result: 0x80000000)
    lui $15, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $16, 0x0000   # Test with zero value (result: 0x00000000)
    lui $16, 0x0001   # Test with min positive (result: 0x00010000)
    lui $16, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $16, 0x8000   # Test with min negative (result: 0x80000000)
    lui $16, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $17, 0x0000   # Test with zero value (result: 0x00000000)
    lui $17, 0x0001   # Test with min positive (result: 0x00010000)
    lui $17, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $17, 0x8000   # Test with min negative (result: 0x80000000)
    lui $17, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $18, 0x0000   # Test with zero value (result: 0x00000000)
    lui $18, 0x0001   # Test with min positive (result: 0x00010000)
    lui $18, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $18, 0x8000   # Test with min negative (result: 0x80000000)
    lui $18, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $19, 0x0000   # Test with zero value (result: 0x00000000)
    lui $19, 0x0001   # Test with min positive (result: 0x00010000)
    lui $19, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $19, 0x8000   # Test with min negative (result: 0x80000000)
    lui $19, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $20, 0x0000   # Test with zero value (result: 0x00000000)
    lui $20, 0x0001   # Test with min positive (result: 0x00010000)
    lui $20, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $20, 0x8000   # Test with min negative (result: 0x80000000)
    lui $20, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $21, 0x0000   # Test with zero value (result: 0x00000000)
    lui $21, 0x0001   # Test with min positive (result: 0x00010000)
    lui $21, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $21, 0x8000   # Test with min negative (result: 0x80000000)
    lui $21, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $22, 0x0000   # Test with zero value (result: 0x00000000)
    lui $22, 0x0001   # Test with min positive (result: 0x00010000)
    lui $22, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $22, 0x8000   # Test with min negative (result: 0x80000000)
    lui $22, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $23, 0x0000   # Test with zero value (result: 0x00000000)
    lui $23, 0x0001   # Test with min positive (result: 0x00010000)
    lui $23, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $23, 0x8000   # Test with min negative (result: 0x80000000)
    lui $23, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $24, 0x0000   # Test with zero value (result: 0x00000000)
    lui $24, 0x0001   # Test with min positive (result: 0x00010000)
    lui $24, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $24, 0x8000   # Test with min negative (result: 0x80000000)
    lui $24, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $25, 0x0000   # Test with zero value (result: 0x00000000)
    lui $25, 0x0001   # Test with min positive (result: 0x00010000)
    lui $25, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $25, 0x8000   # Test with min negative (result: 0x80000000)
    lui $25, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $26, 0x0000   # Test with zero value (result: 0x00000000)
    lui $26, 0x0001   # Test with min positive (result: 0x00010000)
    lui $26, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $26, 0x8000   # Test with min negative (result: 0x80000000)
    lui $26, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $27, 0x0000   # Test with zero value (result: 0x00000000)
    lui $27, 0x0001   # Test with min positive (result: 0x00010000)
    lui $27, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $27, 0x8000   # Test with min negative (result: 0x80000000)
    lui $27, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $28, 0x0000   # Test with zero value (result: 0x00000000)
    lui $28, 0x0001   # Test with min positive (result: 0x00010000)
    lui $28, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $28, 0x8000   # Test with min negative (result: 0x80000000)
    lui $28, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $29, 0x0000   # Test with zero value (result: 0x00000000)
    lui $29, 0x0001   # Test with min positive (result: 0x00010000)
    lui $29, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $29, 0x8000   # Test with min negative (result: 0x80000000)
    lui $29, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $30, 0x0000   # Test with zero value (result: 0x00000000)
    lui $30, 0x0001   # Test with min positive (result: 0x00010000)
    lui $30, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $30, 0x8000   # Test with min negative (result: 0x80000000)
    lui $30, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    lui $31, 0x0000   # Test with zero value (result: 0x00000000)
    lui $31, 0x0001   # Test with min positive (result: 0x00010000)
    lui $31, 0x7FFF   # Test with max positive (result: 0x7FFF0000)
    lui $31, 0x8000   # Test with min negative (result: 0x80000000)
    lui $31, 0xFFFF   # Test with max negative (result: 0xFFFF0000)
    
    # End Test 3
    
    # Exit program
    halt