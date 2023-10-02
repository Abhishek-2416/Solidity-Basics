// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//Now in this secaniro what we really need to do is we need to make a slight change in the Simplestorage contract 
//Instead of copying the whole contract and just making simple changes to what we need to do is wecan inherit the contract
import {SimpleStorage } from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{
    //Writing it this way makes this addFiveStorage contract inherit the simple storage contract 

    //Now the main goal to make this contract was to add 5 to the store function for that we need to use the keywords "virtue" and "override"
    //We need to use the override keyword here and also use the virtual keyword in the main contract
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }   
}