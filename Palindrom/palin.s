.global _start

.org 0x200

.data
palin: .ascii "lil"

.text

_start:
    la a0, palin
    li a1, 3        #length of the string
    jal ra, palindrom

palindrom:
    li t0, 0
    srai t1, a1, 1
    addi t2, a1, 0

    Loop:
    beq t1, t0, end

    lb t3, 0(t0)

    addi t2, t0, 0
    addi t2, t2, -1

    lb t4, 0(t2)
    addi t0, t0, 1

    bne t4, t3, neq
    neq:
    addi a0, a0, 0
    ret

    eq:
    addi t0, t0, 1
    j Loop

    end:
    addi a0, a0, 1
    ret
