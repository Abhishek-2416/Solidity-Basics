//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract Game{
    address[] public players;

    function add() public{
        players.push(msg.sender);
    }
}