// simple_token_demo.cpp
// Simple C++ illustration (console) of token balances map using std::unordered_map.
#include <iostream>
#include <unordered_map>
#include <string>

int main() {
    std::unordered_map<std::string, uint64_t> balances;
    balances["alice"] = 1000;
    balances["bob"] = 250;
    std::cout << "Alice: " << balances["alice"] << "\n";
    std::cout << "Bob: " << balances["bob"] << "\n";
    // transfer example
    uint64_t amount = 100;
    if (balances["alice"] >= amount) {
        balances["alice"] -= amount;
        balances["bob"] += amount;
        std::cout << "Transferred " << amount << " from Alice to Bob\n";
    }
    std::cout << "Alice: " << balances["alice"] << ", Bob: " << balances["bob"] << "\n";
    return 0;
}
