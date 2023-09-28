// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    //calldata,memory,storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //This is how we deal with struct and add items to an array with struct
        Person memory newPerson = Person(_favoriteNumber,_name);
        listOfPeople.push(newPerson);
        //This is how we adjust it in a mapping 
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    //Here calldata and memory are temporary variables ,so why have 2 temporary variables 
}


/*--------------------------------------------------------------------------NOTE------------------------------------------------------------------------
                                                                      BITS vs BYTES
    Bits are the smallest unit , both bits and bytes are used to understand the memory of a computer , everything is stored in terms of 0 or 1 in bits
    1 byte = 8 bits
    The general rule is we use bits for "interface speed" and bytes for "data storage"

                                                                Memory vs Calldata
    When we call the memory it can be changed while the calldata variable cannot be changed or manipulated
    Memory is temporary vairables which can be modified 
    Calldata is temporary variable which can be modified
    Storage variable is permanent variable which can be modified
    But we specifiy them only for array,struct or mapping as they are special data types while we do not do that for uint as it is a primitive data type asn solidity know where and how to store it
    

-------------------------------------------------------------------------------------------------------------------------------------------------------*/