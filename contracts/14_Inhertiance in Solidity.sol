//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

abstract contract BaseContract {
    int public x;
    address public owner;

    constructor(){
        x = 5;
        owner = msg.sender;
    }

    //Functions without implementation should be marked virtual
    function setX(int _x)public virtual;
}

contract A is BaseContract{
    //Note that when we deploy a contract such as A a single instance is created on the  blockchain its base contract is not deployed
    int public y = 3;

    //When we override a function from another contract we need to add the keyword "override"
    function setX(int _x) public override {
        x = _x;
    }
}

interface BaseContract2 {
    function setX(int _x)external ;
}

contract B is BaseContract2{
    int public x;
    int public y = 3;

    function setX(int _x) public override {
        x = _x;
    }
}



/*
                                                           Inheritance In Solidity

    1. A contract acts like a class . A contract can inherit from another contract know as base contract to share a common interface

    2. The general Inheritance system is very similar to that of Python especially concerning multiple Inheritance.

    3. Solidity supports multiple Inheritance including polymorphism. Multiple Inheritance introduces problems like the Diamond problem and should be avoided

    4. When a contract inherits from multiple contracts, only a single contract is created on the blockchain and the code from all the base contracts is copied into the created contract

    5. All function calls are virtual, which means that the most derived function is called, except when the contract name is explicitly given

    6. When deploying a derived contract the base contracts costructor is automatically called

    7. is keyword is used when decalring a new derived contract

                                                            Abstract Contacts

    An abstract contract is the one with atleast one function that is not implemented and is declared using the abstract keyword
    
    We can mark all the contract as being abstract even though all the functions are implemeneted 

    An abstract contract cannot be deployed

                                                              Interfaces 

    Interfaces are similar to abstract contract, but they cannot have functions implemented

    interfaces can be inherited

    Interfaces have futher restrictions:-
        1. They cannot inherit from contracts ,but they can inherit from other interfaces

        2. All declared functions must be external

        3. They cannot declare a constructor

        4. They cannot declare state variables 

    An interface is created using the "interface" keyword instead of contract
*/