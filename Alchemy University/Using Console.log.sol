//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

/*
Using Console.log
When developing smart contracts, Foundry makes it super easy to write Solidity unit tests, 
among many other features. We are using foundry for code execution in this very code lesson! 
For that reason, you can make use of the console library, for logging console data when you need to test something!

*/

import "forge-std/console.sol";

contract C {
    uint public x;
  function x2() external view {
    if(x == 0) {
      console.log("condition was met!");
    }
  }
}