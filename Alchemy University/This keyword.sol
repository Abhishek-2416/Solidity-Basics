// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/*

this Message Calls
In Solidity the this keyword give us access to the contract itself. We can call functions on it using the . operator:

import "forge-std/console.sol";
contract Example() {
    function a() public view {
        // NOTE: this makes an external function call
        console.log( this.b() ); // 3
    }
    function b() public pure returns(uint) {
        return 3;
    }
}
 Calling this.b() will target the b function with an external message call back into the example contract.
 We generally want to avoid this behavior unless there's a good reason for it.
*/

contract Contract {
    address public owner;
    address public charity;
    
    constructor(address _charity){
        owner = msg.sender;
        charity = _charity;

    }

    receive() external payable{}

    function tip() public payable{
        (bool s, ) = owner.call{value: msg.value}("");
        require(s);
    }

    function donate() public {
        (bool s,) = charity.call{value:address(this).balance}("");
        require(s);
    }
}