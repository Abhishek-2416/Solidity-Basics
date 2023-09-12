// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

contract Property{
    //Solidity is a statically typed language like C++ java or Golang 
    //Which means type of all the variables are need to be specifed when declare the variable
    int public price; //In solidity a variable also has a visibilty which can be adjusted the default visibilty of a function is private 

    //Now like other programming languages we cannot just change the value of the state variables 
    //For example price = 100; is not allowed in solidity to change the value of the state variables we can use a "constructor or make a setter fn"

    //Creating a setter function
    function setPrice(int _price) public {
        price = _price;
    }

    //Creating a getter function
    function getPrice() public view returns(int){
        return price;
    }

}


/*---------------------------------------------------------------Note-------------------------------------------------------------------------------
                                                           Where does EVM store data
1. Storage
   It Holds state variables , Persistent and expensive 

2. Stack
    Hold local varaibles inside functions if they are not refrence types 
    Free to be used

3. Memory
   Holds local variable defined inside functions if they are refrence type but declared with the memory keyword
   Holds function arguments
   Free to be used   

                                                            Setter and Getter function
    Both the function should have a visibilty specifier
    If the function is read only and dosent change alter the storage in any way so it should be declared "pure" or "view"

    In this conditon the setter function is changing the value of price so it costs gas where in the getter function doesnt do so
    ***Imp if the state variable is decalred public the getter function is automatically created

*/