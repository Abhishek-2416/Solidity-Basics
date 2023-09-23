// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    address public a;
    address public b;
    
    constructor(address _a, address _b) {
        a = _a;
        b = _b;
    }

    function payA() public payable {
        (bool s, ) = a.call{ value: msg.value }("");
        require(s);
    }

    function payB() public payable {
        (bool s, ) = b.call{ value: msg.value }("");
        require(s);
    }
}