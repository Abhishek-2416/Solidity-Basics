// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

//refer link https://university.alchemy.com/course/solidity/md/64f7493e5f711c0002a227b1

// High Level Syntax for calling functions

contract A{
    uint sum;
    function storeSum(address b) external {
        //Here what is bascially happening is the address b which we are passign is going to behave like a contract 
        //Which allows you to call the function add which allows u to send calldata
        sum = B(b).add(5,10);
    }
}

contract B {
    function add(uint x, uint y)external pure returns(uint){
        return x+y;
    }
}

//Low Level Syntax for calling functions in this it will tell us how to exactly target the calldata

contract C{
    uint sum;
    function storeSum(address b)external{
        (bool s,bytes memory returnData) = b.call(abi.encodeWithSignature("add(uint256,uint256)", 5,10));
        require(s);
        sum = abi.decode(returnData,(uint));
        
    }

}

contract D {
    function add(uint x, uint y) external pure returns(uint){
        return x+y;
    }
}