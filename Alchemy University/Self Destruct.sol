// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/*
Self-Destruct Repercussions
When you call selfdestruct on a contract account, the bytecode is cleared. The contract will no longer be able to respond to ether transfers.

If you are going to use selfdestruct, you should be sure that nobody will accidentally send ether to your contract in the future. There may be no recourse for getting that ether back if they do. Future funds sent to this address could be locked forever! 

 You might assume that once a contract's code is cleared from an address, that's the end of the story. However, with the later introduction of the CREATE2 opcode, you now have the ability to redeploy the same code to the same address. Unlike the traditional method, which relies on the sender's address and account nonce, CREATE2 uses a salt and the contract creation code to determine the contract address. Intrigued? Check out this tutorial for more.

Instead of self-destructing the contract, you could consider setting storage variables so that nobody can call the function. Then you revert the transaction if they try to call a function or send ether in the future! This is probably the safest course of action.

 We will talk about how to do this when we discuss reverting! 

 Contracts can destroy themselves by using the SELFDESTRUCT opcode on the EVM! This opcode actually refunds ether in order to incentivize cleaning up the blockchain of unused contracts.

Let's see it in action:

contract Contract {
    uint _countdown = 10;

    constructor() payable { }

    function tick() public {
        _countdown--;
        if(_countdown == 0) {
            // NOTE: we must cast to address payable here
            // some solidity methods protect 
            // against accidentally sending ether
            selfdestruct(payable(msg.sender));
        }
    }
}
 After 10 calls to the tick function the Contract will selfdestruct! 

So you might be wondering, why did we provide msg.sender as the argument to selfdestruct? 

The address provided to the selfdestruct function gets all of the ether remaining in the contract!
Ether sent to the payable constructor will be refunded to the final caller of the tick function.
*/

// refer link https://university.alchemy.com/course/solidity/sc/64d93ca0eeb3ce0002df34a9/stage/64d93ca0eeb3ce0002df34b8
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

    //When the donate function is called, trigger a selfdestruct in the contract!

    //The selfdestruct will send all remaining funds to the address passed in,
    //so it might be a good candidate to replace the existing functionality in your donate function by sending the funds to the charity!
    function donate() public {
        (bool s,) = charity.call{value:address(this).balance}("");
        require(s);
        // selfdestruct(payable(charity));
    }
}
