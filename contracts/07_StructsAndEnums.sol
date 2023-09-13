//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

struct Instructor{
    uint age;
    string name;
    address addr;
}

contract Academy{
    Instructor public academyInstructor;

    enum State {Open , Closed , Unknown} 
    State public academyState = State.Open;

    constructor(uint _age, string memory _name){
        academyInstructor.age = _age;
        academyInstructor.name = _name;
        academyInstructor.addr = msg.sender;
    }

    //This is how modify a struct
    function changeInstructor(uint _age, string memory _name , address _addr)public {
        require(academyState == State.Open);
        Instructor memory myInstructor = Instructor({
            age: _age,
            name: _name,
            addr: _addr
        });
        academyInstructor = myInstructor;
    }
}

contract School{
    Instructor public schoolInstructor;
}

/*--------------------------------------------------------------NOTE------------------------------------------------------------------------------
A Struct is a collection of key -> value pairs similar to mapping but here the values can be of different data types
Struct introduces a new complex data type that is composed of elemnetary data types 

Eunums are used to create user-defined types they are specially used to determine the current state of or flow of the  smart contract





--------------------------------------------------------------------------------------------------------------------------------------------------- */