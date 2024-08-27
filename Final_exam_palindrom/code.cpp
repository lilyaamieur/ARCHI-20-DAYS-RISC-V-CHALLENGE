#include <iostream>
#include <string>
using namespace std;

int find_palindrome(string s, int length)
{
    for(int i = 0; i < length / 2; i++ )
    {
        if(s[i] != s[length - i - 1]) return 0;
    }
    return 1;
}

int main(){
    
    string s = "lil";
    int truth = find_palindrome(s,s.length());
    
    cout << truth << endl;
    
    return 0;
}
