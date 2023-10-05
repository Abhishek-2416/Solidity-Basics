//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

/* 
Each Ethereum transaction has attached to it a receipt that contains zero or more log entries,these logs are associated with]
the address of the contract and will stay on the blockchain

They are called events in solidity and web3 ,and logs in EVM and Yellow pages

EVENTS allow you to write data on the blockchain,this data cannot later be retrevied by a smart contract
can be cheap alternative of storing data as a state variable
*/

contract Event{
    //This is how we declare the event
    event Transfer(address _to, uint _value);

    function transfer(address payable _to, uint _value) public{



        emit Transfer(_to,_value);
    }
}