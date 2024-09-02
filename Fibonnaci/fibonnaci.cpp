#include <iostream>

using namespace std;



int fibonnaci(int f){
    if( f == 1 || f == 0 ) return f ;
    else{
        return fibonnaci(f-1) + fibonnaci(f-2);
    }
}

int main() {
    int x=4;
    int y= fibonnaci(x);
    
    cout << y ;

    return 0;
}