.globl _start

.data
array_data: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  # Example array

.text
_start:
    la a0, array_data      # Pointer to the start of the array
    li a1, 10              # Length of the array
    jal ra, sum_even_numbers  # Call function, result in a0 (expected: 30)

    # Exit program
    li a7, 10
    ecall

# Function: sum_even_numbers
# ---------------------------
# Input:
#   a0: Pointer to the array
#   a1: Length of the array
# Output:
#   a0: Sum of the even numbers in the array
sum_even_numbers:
    addi t0, a0, 0   # t0 = array pointer
    addi t1, a1, 0   # t1 = length of array
    li t2, 0         # t2 = sum
    li t3, 0         # t3 = loop counter i

loop:
    beq  t3, t1, end  # if i == array_length, exit loop
    slli t6, t3, 2    # offset = i * 4 (word size)
    add  t6, t6, t0   # t6 = address of array[i]
    lw   t4, 0(t6)    # t4 = array[i]

    andi t6, t4, 1    # Check if even (t6 = 0 if even, 1 if odd)
    bne  t6, zero, skip_even  # If odd, skip addition

    add  t2, t4, t2   # Sum even number

skip_even:
    addi t3, t3, 1    # Increment loop counter
    j loop

end:
    mv a0, t2         # Return sum in a0
    ret               # Return to caller
