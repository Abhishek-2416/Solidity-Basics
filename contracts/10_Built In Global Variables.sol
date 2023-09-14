//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract GlobalVariables{
    address public owner;
    uint public sentValue;

    constructor(){
        owner = msg.sender;
    }

    function changeOwner() public{
        owner = msg.sender;
    }

    function sendEther() public payable {
        sentValue = msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}

/*---------------------------------------------------------------NOTE--------------------------------------------------------------------------------
1.msg = contains information about the account that genrates the transaction and also about the transaction or call
   msg.sender = account address that generates the transaction
   msg.value = eth value sent to the contract
   msg.gas = remaining gas (gasleft())
   msg.data = data feild from the tranasction or call that executed this function 
2.this = the current contract explitilty convertible to address this.balance returns the contract balance
3.  
-----------------------------------------------------------------------------------------------------------------------------------------------------*/