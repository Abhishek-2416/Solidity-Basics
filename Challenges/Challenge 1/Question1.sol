/* Challenge #1
Consider this Smart Contract.
Change the state variable name to be declared as a public constant.
Declare a setter and a getter function for the supply state variable.
Are you stuck? Do you want to see the solution to this challenge? Click here.
*/

//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract CryptosToken{
    string name = "Cryptos";
    uint supply;
}

