// Online C++ compiler to run C++ program online
#include <iostream>
#include <string>
#include <cmath>
#include <algorithm> // for std::swap function

using namespace std;


int bin2dec(string str)
{
    int number = 0;
    
    // Get the length of the string
    int n = str.length();

    // Loop through the first half of the string
    for (int i = 0; i < n / 2; ++i) {
        // Swap characters at position i and (n - i - 1)
        swap(str[i], str[n - i - 1]);
    }

    for(int i  = 0; i < str.length()  ; i++)
    {
        if(str[i] == '1') number += 1 * pow(2,i);
    }
    
    return number;
}

int main() {
    string cnumber = "1011";
    int number = bin2dec(cnumber);
    cout << "that's the number " << number << endl;

    return 0;
}
