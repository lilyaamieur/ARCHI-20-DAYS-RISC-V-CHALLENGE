#include <iostream>
using namespace std;

int numofchars(string s, int length){

    int i = 0;
    while(i < length){
        if(s[i] != '/n') i++;
    }
}


int main(){
    string name = "lilya"
    int num = numofchars(name,name.length() - 1)

    return 0;
}