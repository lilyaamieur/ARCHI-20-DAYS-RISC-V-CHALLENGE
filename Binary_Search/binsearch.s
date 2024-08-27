.globl _start

.org 0x400
.data
    array: .word -100, 0, 100, 2100, 3800

.org 0x200
.text

_start:
    li a0, 3800
    la a1, array
    addi a2, a1, 20  # array consists of 5 elements, each one being 4 bytes big
    jal ra, binary_search
    ebreak

# Function binary_search
# Input:    a0 - Value to find
#           a1 - Start address of search interval
#           a2 - End address of search interval
# Output:   a0 - Address of the found element in the original array, or -1 if not found

binary_search:
    li t2, 4  # Word size (4 bytes)

Loop:
    bge a1, a2, isnotthere  # If start >= end, not found

    sub t0, a2, a1          # t0 = end - start
    srai t0, t0, 1          # t0 = (end - start) / 2
    slli t0, t0, 2          # t0 = middle index * word size
    add t0, t0, a1          # t0 = start + (middle index * word size)

    lw t1, 0(t0)            # Load the middle element into t1

    bgt t1, a0, isleft      # If middle > target, search left
    blt t1, a0, isright     # If middle < target, search right
    beq t1, a0, isthere     # If middle == target, found

isright:
    add a1, t0, t2          # Start = middle + 1 (move to right half)
    j Loop

isleft:
    sub a2, t0, t2          # End = middle - 1 (move to left half)
    j Loop

isthere:
    add a0, t0, zero        # Return the address of the found element
    ret

isnotthere:
    li a0, -1               # Return -1 if not found
    ret
