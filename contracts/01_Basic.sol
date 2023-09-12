//Every smart contract should start with a comment indicating its liscence 
// SPDX-License-Identifier: MIT

//The pragma solidity is the version of solidity we need to use 
pragma solidity 0.8.0;

//Every smart contract start with the keyword "contract", the name of the contract will not be saved on the blockchain
//And each contract will receive its unique address which will uniquely indentify the contract
contract Property{
    int public value;

    function setValue(int _value) public{
        value = _value;
    }
}

//This is a very simple smart contract where in to now deploy the contract we now need to convert the source code to byte code deploy it

/*---------------------------------------------------------------NOTE----------------------------------------------------------------------------
                                                           ByteCode and Opcodes

The solidity source code is converted to ABI and bytecode and this contract bytecode is deployed to the main etherum blockchain and is immutable

The bytecode consists of the EVMopcode these opcodes are generally a set of instruction for the EVM, the low level byte code is converted to these
opcodes

The opcodes is the human readable format of the byte codes for example 0x01 is ADD etc



                                                           ABI (Abstract Binary Interface )
The ABI is a json format file which represents how the contract is. And it is a interface which basically says how another application should talk 
to the smart contract , how to call the functions of the smart contract 
-------------------------------------------------------------------------------------------------------------------------------------------------*/