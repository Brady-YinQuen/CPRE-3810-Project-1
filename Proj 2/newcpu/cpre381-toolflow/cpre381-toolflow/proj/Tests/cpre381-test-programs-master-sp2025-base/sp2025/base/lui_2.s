# Test: Zero Extension and Overlap Test
.data
.text
.globl main
main:
    # Test zero extension behavior
    lui $t0, 0x8000      # Test a large negative value (0x80000000)
    lui $t1, 0x0001      # Test a small positive value (0x00010000)
    lui $t2, 0xFFFF      # Test maximum value (0xFFFF0000)

    # These tests ensure that the value loaded into the register is properly zero-extended
    # to 32 bits and that overlap between signed and unsigned values is handled correctly.
    # The immediate value 0x8000 represents a boundary condition where the value is large and negative in 2's complement,
    # and it should be correctly zero-extended.
    # The test with 0x0001 checks for proper handling of a small positive number, ensuring that it behaves correctly when the upper bits
    # are non-zero, but the lower 16 bits are cleared to 0.
    # The maximum value 0xFFFF checks for proper handling of the largest immediate value, ensuring that no sign extension occurs
    # and that the correct upper 16 bits are loaded.
    # This test will make sure that the `lui` instruction properly handles zero extension and avoids sign extension errors.


    halt
