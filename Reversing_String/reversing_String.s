.globl _start

.org 0x400
.data

string_data: .asciz "Beispielstring"

.org 0x200
.text

_start:
    la a0, string_data   # Pointer to the beginning of the string
    jal ra, print_string

    la a0, string_data   # Pointer to the beginning of the string
    jal ra, reverse_string
    jal ra, print_string

    ebreak

# Function reverse_string
# Input: a0 - Pointer to the beginning of the string
# Output: The string is reversed in-place
reverse_string:
# ------- SOLUTION --------



# ------- SOLUTION --------

print_string:
    li   a2, SERIAL_PORT_BASE           // load base address of serial port

next_char:
    lb   t1, 0(a0)                      // load one byte after another
    beq  t1, zero, end_char             // is this the terminal zero byte
    addi a0, a0, 1                      // move pointer to next text byte
tx_busy:
    lw   t0, SERP_TX_ST_REG_o(a2)       // read status of transmitter
    andi t0, t0, SERP_TX_ST_REG_READY_m // mask ready bit
    beq  t0, zero, tx_busy              // if not ready wait for ready condition
    sw   t1, SERP_TX_DATA_REG_o(a2)     // write byte to Tx data register
    jal  zero, next_char                // unconditional branch to process next byte

end_char:
    addi t1, zero, 10

tx_busy_2:
    lw   t0, SERP_TX_ST_REG_o(a2)       // read status of transmitter
    andi t0, t0, SERP_TX_ST_REG_READY_m // mask ready bit
    beq  t0, zero, tx_busy_2              // if not ready wait for ready condition
    sw   t1, SERP_TX_DATA_REG_o(a2)     // write byte to Tx data register
    
    ret

