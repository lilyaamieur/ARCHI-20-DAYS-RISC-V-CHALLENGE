
.data
bin_arr: .byte 1, 0, 1, 1 ;
.org 0x200
.text


_start:
  la a0, bin_arr ; # pointer to the base of the array
  jal ra, binary_to_decimal ; # a0 = 0x25
  ebreak # stop execution

# Function binary_to_decimal
# Input: a0 - Pointer to the binary array
# Output: a0 - The decimal representation of the binary number

binary_to_decimal:
  #s1 = array
  #s2 = reversed array
  #a0 = size
  #t0 = i
  #t4 = number
  # Get the size of the array
    mv      s1, a0 # int n = str.length();
    call    arrlen
  # reverse the array
    mv      s2, a0
    call    arrrev

  # Enter stack frame
    addi    sp, sp, -16
    sd      ra, 0(sp)
    sd      s2, 8(sp)


    li t0, 0
    li t5, 1
    li t4, 0

  binl:
    bge  t0,  s1, bine
    slli t1,  t0, 2      # i = i * 4
    add  t2, s2, t1
    lw   t3, 0(t2)
    beq  t5, t3, true
    j binl

    true:
     slli t6, t0, 1 # t6 = pow(10,i)
     add t4, t4, t6 # number += t6

  bine:
        # Leave stack frame
    ld      s2, 8(sp)
    ld      ra, 0(sp)
    addi    sp, sp, 16
    ret

arrlen:
  li t0, 0          # i = 0
  loop:               # start of the loop
    slli t1, t0, 2    # i * 4
    add  t2, s1, t1   # (byte*) array + i * 4
    lw   t3, 0(t2)    # dereference array[i]
    beq  t3, zero, end # if array[i] == 0, break loop
    addi t0, t0, 1    # increment i
    j loop            # repeat the loop

  end:                # end of the loop
    mv s1, t0         # return the length of the array
    ret

arrrev:
 #s1 = array
 #a0 = size
 #t0 = size / 2
 #t1 = i
  # we enter the stack frame
  addi    sp, sp, -16
  sd      ra, 0(sp)
  sd      s1, 8(sp)
  # Get the size of the string
  mv      s1, a0
  call    strlen
  srai    t0, a0, 1     # Divide sz by 2
  li      t1, 0         # i = 0
loopt:
  bge     t1, t0, endt   # if i >= size / 2, end loop
  slli    t1, t1, 2      # i = i * 4
  add     t2, s1, t1     # t2 = &array[i]
  sub     t3, a0, t1     # t3 = size - i
  addi    t3, t3, -1     # t3 = size - i - 1
  add     t3, t3, s1     # t3 = &array[size - i - 1]
  lb      t4, 0(t2)      # t4 = array[i]
  lb      t5, 0(t3)      # t5 = array[size - i - 1]
  sb      t4, 0(t3)      # array[size - i - 1] = array[i]
  sb      t5, 0(t2)      # array[i] = array[size - i - 1]
  addi    t1, t1, 1      # i++
  j       loopt          # Repeat loop

endt:
  # Leave stack frame
  ld      s1, 8(sp)
  ld      ra, 0(sp)
  addi    sp, sp, 16
  ret
