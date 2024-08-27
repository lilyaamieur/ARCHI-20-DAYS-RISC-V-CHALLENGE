.globl _start

.org 0x400
.data

arr1: .word 123, -11, 10, 431, 200

.org 0x200
.text

_start:
la a0, arr1
addi a1, zero, 5
jal ra, get_max

ebreak

# arguments:
#   a0: pointer to array
#   a1: length of arr
# returns:
#   a0: maximum

get_max:
lw t0, 0(a0)
li t1, 1
loop:
    bne t1, a1, end
    lw  t2, 0(a0)
    ble t0, t2, is_great
    
    is_great:
        addi t0, t2, zero

    addi a0, a0, 4
    addi t1, t1, 1
    j loop
end:
    addi a0, t0, zero
    ret
