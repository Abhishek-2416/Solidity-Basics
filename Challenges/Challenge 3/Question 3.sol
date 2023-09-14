/*
Challenge #3

    Consider this Smart Contract.

    Modify the changeTokens() function in such a way that it changes the state variable called tokens.

    Are you stuck? Do you want to see the solution to this challenge? Click here.
*/



//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract MyTokens{
    string[] public tokens = ['BTC', 'ETH'];
    
    function changeTokens() public view{
        string[] memory t = tokens;
        t[0] = 'VET';
    }
    
}
