.globl _start

.org 0x200



.text

_start:
    li a0, 0xff0f   #Example: 32-bit number
    jal ra, count_bits
    ebreak

# Function count_bits
# Arguments:
#   a0: a 32-bit number
# Outputs:
#   a0: Number of 0-bits
#   a1: Number of 1-bits

count_bits:
    li a1, 0 # 0s inc
    li a2, 0 # 1s inc
    addi t1, zero, 32

    Loop:
    
    bne  t1, zero, end
    andi t2, a0, 1

    beq  t2 , 1 , is_one

    addi a1, a1, 1

    is_one:
        addi a2, a2 , 1

    next:
        addi t1, t1, -1
        srli a0, a0,  1

        j Loop

    end:
    addi a0, a1, 0
    addi a1, a2, 0
    ret
