// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

// Abstract contract
abstract contract Calculator {
    function calculate(uint a, uint b) public virtual view returns (uint);
}

// Child contract
contract Addition is Calculator {
    function calculate(uint a, uint b) public override pure returns (uint) {
        return a + b;
    }
}
