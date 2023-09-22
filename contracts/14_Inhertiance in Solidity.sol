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

