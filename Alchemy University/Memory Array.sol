/*
Memory Arrays
Unlike storage arrays, memory arrays do not have a push member function.

Memory arrays can have a dynamic size if the size is provided during initialization.

For example:

import "forge-std/console.sol";
contract Contract {
	uint x = 5;

	function createArray() view external {
		address[] memory addresses = new address[](x);
		console.log( addresses.length ); // 5
	}
}
 The size is dynamically provided by the variable x.
 We could potentially change this variable and it would create an array of addresses of that size.
 Notice the use of the new operator here during initialization!

After initialization, memory arrays cannot be resized.
This means even in the example above, once the addresses array is initialized at size 5, it will stay that length for the entirety of the transaction.
*/

/*
 Your Goal: Filter Even Numbers
Create a pure, external function called filterEven which takes an dynamic size array of unsigned integers as its only argument.
Find all the even numbers and add them to a new array in memory. This array should contain only the even numbers.
Return this new array.
*/

