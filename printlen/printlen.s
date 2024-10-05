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


# -------- SOLUTION  ----------

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


