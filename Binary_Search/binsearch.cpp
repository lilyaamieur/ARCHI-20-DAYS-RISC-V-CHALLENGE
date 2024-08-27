// Online C++ compiler to run C++ program online
#include <iostream>
using namespace std;

int binary_search(int* arr,int high, int low, int s)
{

    while(low < high){
        int m = low + ((high - low)/2);
        if(arr[m] > s) low = m+1;
        else if( arr[m] < s) low = m-1;
        else return m;
    }
    return -1;
}


int main() {
    int arr[] = {0,1,2,3};
    int number = 1;
    int truth = binary_search(arr,3,0,number);
    cout << "the number : " << number << " is it in the array ?" << endl;
    cout << truth << endl;

    return 0;
}
