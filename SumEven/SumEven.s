.globl _start

.org 0x400
.data

array_data: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  ; Example array

.org 0x200
.text

_start:
    la a0, array_data  ; Pointer to the start of the array
    li a1, 10          ; Length of the array
    jal ra, sum_even_numbers ; Result in a0 -> 30 = 0x1e
    ebreak

# Function sum_even_numbers
# Input:
#   a0: Pointer to the array
#   a1: Length of the array
# Output:
#   a0: Sum of the even numbers in the array

sum_even_numbers:
# t0 = a0
# t1 = a1
# t2 = sum
# t3 = i

addi t0, zero, a0
addi t1, zero, a1

li t2, zero
li t3, zero

loop:
    beq  t3, t1, end
    addi t3, t3, 1
    lb   t4, 0(t0)
    rem  t5, t4, 2
    beq  t5, zero, is_true

    is_true:
        add t2, t4, t2

    j loop
end:
    add a0, zero, t2
