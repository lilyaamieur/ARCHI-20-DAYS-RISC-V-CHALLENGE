.globl _start
.globl __start
.option norelax

.org 0x400
.data

text_1: .asciz "Hi!"

.org 0x200
.text

__start:
_start:

la a0, text_1
jal ra, println_len
ebreak

# arguments:
#   a0: pointer to string
# returns:
#   a0: string length

# -------- SOLUTION  ----------

println_len:

addi sp, sp, -16
sw s0, 0(sp)
sw a0, 4(sp)
sw ra, 8(sp)
# saved register, since we have a function call to print_char, we cannot use t0 as a pointer 
addi s0, a0, 0 # pointer to string

loop:
lb t0, 0(s0) #load char
beq t0, zero, end_loop
addi s0, s0, 1

add a0, t0, zero
jal ra, print_char
j loop

end_loop:
#new line = 0x0a
addi a0, zero, 10
jal ra, print_char

# Length = the difference between the pointer and the beginning of the string
# alternatively, use a counter and increment it by 1 each time 
lw t0, 4(sp)
sub a0, s0, t0 

# clean up the stack 
lw s0, 0(sp)
lw ra, 8(sp)
addi sp, sp, 16
ret

# -------- SOLUTION ----------

// print_char function
// Argumente:
// a0: char (ASCII-Wert)

print_char:
    li   a1, SERIAL_PORT_BASE           // load base address of serial port

tx_busy:
    lw   t0, SERP_TX_ST_REG_o(a1)       // read status of transmitter
    andi t0, t0, SERP_TX_ST_REG_READY_m // mask ready bit
    beq  t0, zero, tx_busy              // if not ready wait for ready condition
    sw   a0, SERP_TX_DATA_REG_o(a1)     // write byte to Tx data register
    ret


