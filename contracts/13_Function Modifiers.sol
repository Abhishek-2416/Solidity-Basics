//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Property{
    uint public price;
    address public owner;

    constructor(){
        price = 0;
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender);
        _; //if the owner calls the function it is executed or else it will be reverted
    }

    //Now just instead of using a require statment we directly just write in the onlyOwner function which directly checks for the condition
    function changeOwner(address _owner) public onlyOwner {

    }

    function setPrice(uint _price) public onlyOwner {
        price = _price;
    }
}

/*---------------------------------------------------------------NOTE----------------------------------------------------------------------------------
  Function Modifiers are used to modify the behaviour of a function. They test a condition before calling a function which will be executed only if
  the condition before calling a function which will be executed only if the condition of the modifier evalutes to true

  Using function modifiers you avoid redudant code and possible errors

  They dont return and only use the require()

  They are defined using the modifer keyword
------------------------------------------------------------------------------------------------------------------------------------------------------*/