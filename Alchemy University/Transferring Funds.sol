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
/*
This is a low level method of sending ether the general syntax is 
.call{gas,value}("calldata")
Where in we dont specifiy the gas it will take from the leftover gas after the deployment of the contract 

As it is a low level function we it cannot revert the function automatically if it fails so we need to set a bool success and require(sucess) just in case to know if later the transaction fails it gets reverted
*/