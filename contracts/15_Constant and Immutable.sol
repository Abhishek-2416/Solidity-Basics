// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//One more way to save gas is instead of writing in errors like "Not the Owner" we can create custom owners like this and send these
error NotOwner();

//859,757 is the gas taken in without optimization
contract FundMe {
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    //We see that the owner variable and get set just one time and doesnt change later,So we change it to immutable (save as i_owner for wiritng convection)
    //23,644 without immutable keyword
    //21508 with immutable keyword 
    address public immutable owner;

    //Here the same thing goes on with minimum usd also ,In this we can set it to constant, this is a good pratice and saves gas
    //23,515 - without the constant variable
    //21,415 - with constant variable
    uint256 public constant MINIMUM_USD = 5 * 10 ** 18;
    
    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }
    
    modifier onlyOwner {
        // require(msg.sender == owner);
        if (msg.sender != owner) revert NotOwner();
        _;
    }
    
    function withdraw() public onlyOwner {
        for (uint256 funderIndex=0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }

}

/*---------------------------------------------------------NOTE---------------------------------------------------------------------------------------
This is more over like a gas optimization technique rather than just explaning the basics 

State variables could be specified as immutable or constant.
In solidity, we use constant to permanently fix a variable value so that afterward, it can’t be altered.
A constant variable is assigned a value at the time of declaration. On the other hand,
immutable is also used for the same purpose but is a little flexible as it can be assigned inside a constructor at the time of its construction.

Note: Both immutable and constant variables can't be changed once declared.
------------------------------------------------------------------------------------------------------------------------------------------------------*/