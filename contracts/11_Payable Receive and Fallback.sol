//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Deposit{
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    //Here we are decalring a receive function so that the contract can receive ether, The contract can have just one receive function
    receive() external payable {
        //Note that the function cannot have arguments cannot return anything and must have external visibilty and payable state mutability
    }

    fallback() external payable {
        //Even this is a similar function to receive and one of these function are necessary for the contract to receive ether 
        //But difference between fallback and receive that when msg.data is not empty we use the fallback function and when it is empty receive()
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    // transfering ether from the contract to another address (recipient)
     function transferEther(address payable recipient, uint amount) public returns(bool){
         // checking that only contract owner can send ether from the contract to another address
         require(owner == msg.sender, "Transfer failed, you are not the owner!!");
         
         if (amount <= getBalance()){
             // transfering the amount of wei from the contract to the recipient address
             // anyone who can call this function have access to the contract's funds
             recipient.transfer(amount);
             return true;
         }else{
             return false;
         }
     }     
}


/*---------------------------------------------------------------NOTE--------------------------------------------------------------------------------
                                                            Contract address
Any contract has its own unique address that is generated at deployment

The contract address is generated based on the address of the creator of the contract and the no, of transactions of that account (nonce) 

There are two type of address plain and payable, An address is a variable type and has the following members
balance
transfer() This is the safest way of transferrring eth
send() it is like a low level of the transfer()
//Thesse both functions are just for payable addresses

call() callcode() delegatecall()
                                                            Pyable Function and Contract Balance
A Smart contract can receive and send ether only if it has the payable function defined

A contract can reveive ETH in multiple ways :
  1.Simply by sending ETH to the contract address by an EOA In this case the contract will need atleast one function called receive() or fallback()
  2.By calling a payable function and sending ETH with that transaction



-----------------------------------------------------------------------------------------------------------------------------------------------------*/