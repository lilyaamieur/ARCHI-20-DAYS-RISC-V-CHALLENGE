#include <iostream>
#include <vector>

std::vector<int> decimal_to_binary(int number) {
    std::vector<int> binary_representation;

    // Continue until the number becomes 0
    while (number > 0) {
        // Get the least significant bit by checking if the number is odd (number % 2)
        binary_representation.push_back(number & 1);

        // Shift the number to the right by 1 bit
        number >>= 1;
    }

    // Reverse the vector to have the correct binary order
    std::reverse(binary_representation.begin(), binary_representation.end());

    return binary_representation;
}

int main() {
    int decimal_number = 37;  // Example decimal number

    // Convert the decimal number to binary
    std::vector<int> binary = decimal_to_binary(decimal_number);

    // Print the binary representation
    std::cout << "Binary representation of " << decimal_number << " is: ";
    for (int bit : binary) {
        std::cout << bit;
    }
    std::cout << std::endl;

    return 0;
}
