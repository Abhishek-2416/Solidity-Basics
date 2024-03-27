// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract Encoding {
    function combineStrings() public pure returns(string memory){
        //so here basically we are combining string using abi.encodePacked which is first taking both string, comvines it in its bytes object and then we convert it into the string type        
        return(string(abi.encodePacked("Hello ","World")));
    }
}