.globl _start

.org 0x400
.data
    txt1: .ascii "write your name"
    txt2: .ascii "Your name is "
    txt3: .ascii "characters long"
    buffer: .space 255
    name: .ascii 255

.org 0x200
.text

_start:
li a7, 4
la a0, txt1
ecall

li a7, 8
la a0, buffer
li a1, 255
ecall

addi a1, x0, -1 # counter
addi t1, x0, 10 # the ending character “\n”

Loop:
lb t0, 0(a0)
addi a1, a1, 1
addi a0, a0, 1

bne t0, t1, Loop

li a7, 4
la a0, txt2
ecall

li a7, 1
add a0, x0, a1
ecall

li a7, 4
la a0, txt3
ecall
