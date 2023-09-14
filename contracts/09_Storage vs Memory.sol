//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract A{
    string[] public cities = ["Hyderabad","California"];

    //Creating a function that will modify this dynamic array using memory function
    function f_memory() public view {
        string[] memory s1 = cities; //This s1 will be stored in memory instead of storage 
        //It is mandotary for an array string or struct to specify the memory or storage "string s2" will give an error
        s1[0] = "Banglore";
    }

    function f_storage() public{
        string[] storage s2 = cities;
        s2[0] = "New York";
    }

}

/*--------------------------------------------------------------------NOTE--------------------------------------------------------------------------
The function with the memory keyword does not change or modifiy the blockchain in this scenario also the array values do not change they stay the same
so that is the reason we also use the keyword view in function with the memory keyword

While where we use the storage keyword it actually modifies the blockchain and changes the state of the blockchain so here we cannot even use the 
view 


                                                               View vs Pure
    The view functions are read-only function, which ensures that state variables cannot be modified after calling them.
    If the statements which modify state variables, emitting events, creating other contracts, using selfdestruct method,

    The pure functions do not read or modify the state variables, which returns the values only using the parameters passed to the function 
    or local variables present in it
----------------------------------------------------------------------------------------------------------------------------------------------------*/