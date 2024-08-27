// Online C++ compiler to run C++ program online
#include <iostream>
using namespace std;
int sumEven(int number[], int size){
    int sum = 0;
    for(int i = 0; i < size; i++){
        if(number[i] % 2 == 0) sum += number[i];
    }
    return sum;
}

int main() {
    int number[] = {2,1,2};
    int sum = sumEven(number, 3);
    cout << sum;

    return 0;
}
