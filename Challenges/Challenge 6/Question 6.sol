/*
Challenge #6

    Consider the solution from the previous challenge.

    Add a new immutable state variable called admin and initialize it with the address of the account that deploys the contract;

    Add a restriction so that only the admin can transfer the balance of the contract to another address;

    Deploy and test the contract on Rinkeby Testnet.

Are you stuck? Do you want to see the solution to this challenge? Click here.
*/

//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.6.0 <0.9.0;
 
contract Deposit{
    
    receive() external payable{}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function transferBalance(address payable recipient) public{
        uint balance = getBalance();
        recipient.transfer(balance);
    }
}