    //SPDX-License-Identifier: GPL-3.0
     
    pragma solidity >=0.5.0 <0.9.0;
    contract Auction{
        
        // declaring a variable of type mapping
        // keys are of type address and values of type uint
        mapping(address => uint) public bids;
        
        // initializing the mapping variable
        // the key is the address of the account that calles the function
        // and the value the value of wei sent when calling the function
        function bid() payable public{
            bids[msg.sender] = msg.value;
        }
    }




/* ---------------------------------------------------------------------NOTE----------------------------------------------------------------------
                                                                      Mappings
    It is a data structure that holds the key value pairs which is similar to Python Dictionaries , JS objects or Java hashmaps

    All keys must have the same type and all values must have the same type 
    The keys cannot have the types like mapping, dynamnic array, enum , or struct The values can be of any type including mapping

    Mappings are always stored in storage and also the mappings declared inside the functions are also saveed in storage

    The advantage of mappings is that its lookup time is constant no matter of the size array have linear search time

    A mapping is not iterable we cannot iterate a mapping using a loop


------------------------------------------------------------------------------------------------------------------------------------------------*/