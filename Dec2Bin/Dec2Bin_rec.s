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
# temporaries
## t0 = a0
# t1 = i = 0

addi t0, zero, a0
li   t1, 0

div_loop:
    # t2 = t0 / 2
    # t3 = t0 % 2
    srli t2, t0, 2
    rem  t3, t0, 2 
    sw   t3, 0(a1)
    addi t4, a1 , 1
    bne  t2, zero, div_loop
    li t0, 2        #end sign
    sw t0, 0(a1)

# t2 = a0
add t2, zero, a0
addi t4, t4, -1 #move backward

reverse_loop:
    beq t2, t4, end_rev
    lw  t5, 0(t4)
    lw  t6, 0(t2)
    sw  t2, 0(t5)
    sw  t4, 0(t6)

    addi t4, t4, -1 #move backward
    addi t2, t2, 1  #move froward
    j reverse_loop

end_rev:
    jalr zero, 0(ra)

