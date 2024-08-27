#include<bits/stdc++.h>
using namespace std;
 
int toDecimal(string binary, int i=0)
{
    // If we reached last character
    int n = binary.length();
    if (i == n-1)
      return binary[i] - '0';
     
    // Add current tern and recur for
    // remaining terms
    return ((binary[i] - '0') << (n-i-1))  +
            toDecimal(binary, i+1);
}
 
// Driver code
int main()
{
    string binary = "1010";
    cout << toDecimal(binary) << endl;
    return 0;
}
