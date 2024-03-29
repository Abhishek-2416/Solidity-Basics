// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract Encoding {
    function combineStrings() public pure returns(string memory){
        //so here basically we are combining string using abi.encodePacked which is first taking both string, comvines it in its bytes object and then we convert it into the string type        
        return(string(abi.encodePacked("Hello ","World")));

        /*
                                  What exactly happens when we send a transacion ?
            So when we compile our code When we send a transaction, it is "compiled" down to bytecode and sent in a "data" object of the transaction.
            That data object now governs how future transactions will interact with it.
            For example: https://etherscan.io/tx/0x112133a0a74af775234c077c397c8b75850ceb61840b33b23ae06b753da40490    

            Now, in order to read and understand these bytes, you need a special reader.
            This is supposed to be a new contract? How can you tell?
            Let's compile this contract in hardhat or remix, and you'll see the the "bytecode" output - that's that will be sent when
            creating a contract.   
            
                           
        */
    }
}