# WORK NOTES
* how to initialize an array ?
    `lui S0, 0x1234`
    `ori S1, S0, 0x5678`
    `add S2, S1, S1`
    - now what does each operation do ?
    * `lui S0, 0x1234`
        takes `0x1234` and "load" it into the upper half of the S0 register and zero out the lower half:
        `S0 = 0x12340000`
    * `ori S1, S0, 0x5678`
        0x12340000
    OR  0x00005678
        ----------
        0x12345678 = S1

    * `add S2, S1, S1`
        0x12345678
    AND 0x12345678
        ----------
        0x2468ACF0 = S2

    This is equivalent to multiplying S1 by 2 assuming its a 32-bit register
