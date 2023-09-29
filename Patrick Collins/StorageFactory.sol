// SPDX-License-Identifier: MIT
pragma solidity 0.8.20; //It is also important to keep both the contracts with the same version

//This is to import the simpleStorage.sol so that this contract can use it 
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    //Let uskeep a list of all the simleStorage contracts that this contract deploys
    SimpleStorage[] public listOfSimpleStorageContracts;

    //This function is going to deploy a simpleStorage contract and store it in a storage variable
    function createSimpleStorageContract() public {
        //This will make this contract help deploy another contract
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    //Let us see how this contract can interact with the deployed contracts
    function sfStore(uint256 _simpleStorageIndex,uint256 _newSimpleStorageNumber) public {
        /*
        To interact we really need 2 things \
        The Address of the contract and the ABI(techincally a lie, we just need the function selector()
        */
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        //We directly call the store function directly
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    //Function which will let us read from the simpleStorage contracts as well
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }


}