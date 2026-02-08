// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract Mammal {
    bool public isAlive = true;

    // Modifier 
    modifier onlyIfAlive() {
        require(isAlive == true, "This mammal is not alive");
        _;
    }

    function breathe() public pure returns (string memory) {
        return "Breathing";
    }
}

// Dog inherits from Mammal
contract Dog is Mammal {
    function bark() public onlyIfAlive view returns (string memory) {
        return "Woof!";
    }
}

// Monkey inherits from Mammal
contract Monkey is Mammal {
    function climb() public onlyIfAlive view returns (string memory) {
        return "Climbing the tree!";
    }
}
