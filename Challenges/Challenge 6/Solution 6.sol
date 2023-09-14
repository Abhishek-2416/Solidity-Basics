//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.6.0 <0.9.0;
 
contract Deposit{

    receive() external payable{}

    address immutable admin;

    constructor(){
        admin = msg.sender;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function transferBalance(address payable recipient) public{
        require(msg.sender == admin);
        uint balance = getBalance();
        recipient.transfer(balance);
    }
}