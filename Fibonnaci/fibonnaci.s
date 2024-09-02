.globl _start

.org 0x400

.data
txt: .ascii  "Enter a number :"
txt1: .ascii "The number is : "
txt2: .ascii "Fibonacci("
txt3: .ascii ") is : "
buffer: .space 255
number: .byte 32


.org 0x200

.text

_start:
#print a string "enter a number :"
li a7, 4
la a0, txt1
ecall



#read an integer number from a console
li a7, 5
la a0, buffer
li a1, 255
ecall


jal ra, Fibonacci

Fibonacci:
    lb t1, 0(a0)
    li t2, 0
    LOOP:
    beq t1, zero, result_z:
    beq t1, 1, result_o:
    






