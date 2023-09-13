//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract BytesAndStrings{
    /*
    Bytes and Strings
    Variables of type bytes and strings are special dynamic arrays

    .String is equal to bytes but does not allow length or index access , a string is UTF-8 encoded in solidity ****IMPP
    */

    bytes public b1 = 'abc';
    string public s1 = 'abc';

    //Upon deployment we see that the values stored in bytes array is stored in hexadecimal bytes: 0x616263 but string is displayed normally

    //One difference between bytes and string is that we can not add elemnts to a string variable as we can to a bytes 
    function addElement() public {
        b1.push('x');
        //but s1.push('x'); will show an error
    }

    //Another thing about the bytes array is that it is possible to access the elements of the bytes array using indexing
    function getElement(uint index) public view returns(bytes1){
        return b1[index];
    }

    //And also we can access the lenght of the bytes array where as we cannnot access the length of the string arrays
    function getLength() public view returns(uint256){
        return b1.length;
    }

}