# WORK NOTES
* how to initialize an array ?
   For the sake of example, I will assume that you are working with 32-bit addressing and 32-bit words.
     - First allocate the Array. For performance reasons make sure that it is aligned on a 4-byte boundary.
     - Make sure all the three variables are in registers.
    I will assume that:
    * `x1` contains the starting address of Array
    * `x3` contains the value of i
    * `x4` contains the value of c
     - Rewrite the C array statement into indirect addressing of a char array
    * `Array[i] = c;`      becomes        ` *((char *)Array + 4*i) = c; `
    The reason for casting the array into (char *) is because RISC-V accesses memory using byte addresses.
    In contrast, C would automatically provide access with 4-byte addresses.
    - Convert to instructions. I choose to be wasteful with registers, assuming that you do not want to overwrite the contents of x2, x3, x4.
    But if you can overwrite them, you could reuse the registers for temporary results.
    * `SLLI		x13,x3,2`		# x13 = x3 << 2 which provides x13 = 4*i
    * `ADD	   x12,x2,x13`   	# x12 = x2 + x13 which provides x12 = (char *)Array + 4*i
    * `SW	   x4,0(x12)`		    # *x12 = x4 
