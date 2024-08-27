// Online C++ compiler to run C++ program online
#include <iostream>
#include <string>
using namespace std;


int palin(string name){
    for(int i = 0 ; i < name.length() / 2; i++)
    {
        if(name[i] != name[name.length() - i - 1]) return 0;
    }
    return 1;
}

int main() {
   string name = "lili";
    int value = palin(name);
    cout << "the value is " << value << endl;
    return 0;
}
