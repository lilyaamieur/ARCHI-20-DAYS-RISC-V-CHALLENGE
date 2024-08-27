.globl _start

.org 0x400

.data
binary_array: .byte 32
binary_rep: .byte 0, 0, 0, 0, 0, 0

.org 0x200
.text

_start:
    li a0, 98452           # Load the decimal number into a0
    la a1, binary_array    # Load the address of binary_array into a1
    jal ra, decimal_to_binary # Call the decimal_to_binary function
    ebreak

# Function decimal_to_binary
# Input:    a0 - 4 byte unsigned decimal value to convert
#           a1 - Pointer to reserved memory for binary string
# Output:   a0 - Pointer to the binary string

decimal_to_binary:
    add t0, zero, zero     # t0 will hold the current bit position
    add t1, zero, zero     # t1 will be used for storing the current bit value
    add t2, zero, zero     # t2 is used as a temporary register

process_string:
    srli t2, a0, 1         # Shift the number right by 1 bit
    and t1, a0, 1          # Get the least significant bit (LSB)
    sb t1, 0(a1)           # Store the bit in binary_array
    addi a1, a1, 1         # Move to the next position in binary_array
    mv a0, t2              # Update the value of a0 to the shifted result
    bnez a0, process_string # Repeat the loop until a0 is zero

end:
    ret                    # Return from the function
