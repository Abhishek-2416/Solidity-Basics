/* 
Challenge #2

    Consider the solution from the previous challenge.

    Add a public state variable of type address called owner.

    Declare the constructor and initialize all the state variables in the constructor. The owner should be initialized with the address of the account that deploys the contract.

Are you stuck? Do you want to see the solution to this challenge? Click here.
*/

//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract CryptosToken{
    string constant public name = "Cryptos";
    uint supply;
    
    
    function setSupply(uint s) public{
        supply = s;
    }
    
    function getSupply() public view returns(uint){
        return supply;
    }
}