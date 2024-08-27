.globl _start

.org 0x400
.data
    array: .ascii "lil"

.org 0x200
.text

_start:
    la a0, array
    li a1, 3
    jal ra, find_palindrom
    ebreak

# Function binary_search
# Input:    a0 - base addresse of the string
#           a1 - length

find_palindrom:
    add a1, a0, a1

Loop:
    addi a1, a1, -1
    lb t5, 0(a0)
    lb t6, 0(a1)
    bne t5, t6, not_palindrome
    addi a0, a0, 1
    blt a0, a1, Loop
    addi a0, x0, 1
    jalr x0 ra
    not_palindrome:
    mv a0, x0
    jalr ra
