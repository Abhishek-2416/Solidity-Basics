// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Visit the link https://university.alchemy.com/course/solidity/sc/64d564d1fa0c9c0002436ade/stage/64d564d1fa0c9c0002436afc

contract Contract {
    function double(uint x)external pure returns(uint){
        return x*2;
    }

    function double(uint x, uint y)external pure returns(uint,uint){
        return (x*2,y*2);
    }

}

/*
Overloading Functions
In Solidity it is perfectly valid to declare two functions with the same name if they have different parameters:

function add(uint x, uint y) external pure returns(uint) {
    return x + y;
}

function add(uint x, uint y, uint z) external pure returns(uint) {
    return x + y + z;
}

 Solidity will run the function whose signature matches the arguments provided. For example, add(2,4) will invoke the first function while add(2,3,4) will invoke the second function.

Also, Solidity can return multiple values from functions:

function addTwo(uint x, uint y) external pure returns(uint, uint) {
    return (x + 2, y + 2);
}

 Notice that the returns keyword specifies two return values. Also notice that we are wrapping the values in a parenthesis in order to return multiple values. This is referred to as a tuple.

 Tuples are not a formal type in Solidity. They are a list of values that can be used as a temporary structure to return values or do assignment destructuring. The data types of the return values in tuples can be different from each other.

We can also use tuples in assignment destructuring. For example, if we call the function addTwo which we just defined above:

(uint x, uint y) = addTwo(4, 8);
console.log(x); // 6
console.log(y); // 10
 Your Goal: Overload Double
Create another pure external function double which takes two uint parameters.
Double both of the arguments and return both of them in the same order they were passed into the function.
 For this solution, it is possible to use the double function from the previous stage in this solution. You may need to change the visibility from external to public so that you can call it internally as well.
*/