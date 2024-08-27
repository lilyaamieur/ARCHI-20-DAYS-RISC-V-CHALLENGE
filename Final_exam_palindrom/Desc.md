# Final Exam Palindrom
A palindrome is a sequence of characters that reads the same backward
and forward. For example, “civic” and “redder” are palindromes, but
“wave” and “canal” are not palindromes. 
## Instruction 
Implement the RISC-V function find_palindrome `find_palindrome(string s, int length)`.

You may only use registers `a0`, `a1`, `t5` and `t6`.

### Input
* a nonempty null-terminated string in `a0`.
* its length (excluding the null-terminator) in `a1`. 

### Output

* The function should return 1 in `a0` if the string is a palindrome and 0 in `a0` otherwise.

### Assumptions
Assume the input string contains only lowercase letters.
