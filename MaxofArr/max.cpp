// Online C++ compiler to run C++ program online
#include <iostream>
using namespace std;
int max(int number[], int size){
    int max = number[0];
    for(int i = 1; i < size; i++){
        if(max < number[i]) max = number[i];
    }
    return max;
}

int main() {
    int number[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int maxx = max(number, 10);
    cout << maxx;

    return 0;
}