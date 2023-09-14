/* 
Challenge #8

    Consider this smart contract.

    Change the visibility specifier of f() so that it can be called from derived contracts as well. Do not set it as being public.

    Create a new contract that derives from A and call f() from the new contract.

Are you stuck? Do you want to see the solution to this challenge? Click here.
*/

//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
contract A{
    int public x = 10;

    
    function f3() private view returns(int){
        return x;
    }
    
}