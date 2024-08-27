.globl _start

.org 0x400
.data

binary_array: .byte -5, 0, 1, 9, 4, 1, 8  # Example binary array

.org 0x200
.text

_start:
    la a0, binary_array  # Pointer to array
    li a1, 7             # Length of array
    jal ra, bubblesort
    ebreak

# Function bubblesort
# Input: a0 - Pointer to the binary array
#        a1 - Length of the passed array
# Output:

bubblesort:
    li t0, 0            # i = 0
Loop_i:
    bge t0, a1, end     # if i >= length, end loop

    add t1, t0, zero    # j = i
Loop_j:
    sub t3, a1, t0      # t3 = length - i
    addi t3, t3, -1    # t3 = length - i - 1
    bge t1, t3, next_i  # if j >= length - i - 1, go to next i

    add t4, a0, t1      # t4 = base address + j
    lb t2, 0(t4)        # load arr[j]
    lb t5, 1(t4)        # load arr[j + 1]

    bge t2, t5, no_swap # if arr[j] <= arr[j + 1], no swap
    # Swap arr[j] and arr[j + 1]
    sb t5, 0(t4)        # store arr[j + 1] at arr[j]
    sb t2, 1(t4)        # store arr[j] at arr[j + 1]

no_swap:
    addi t1, t1, 1      # j++
    j Loop_j

next_i:
    addi t0, t0, 1      # i++
    j Loop_i

end:
    ret
