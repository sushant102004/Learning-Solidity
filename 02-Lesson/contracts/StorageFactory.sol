// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import './SimpleStorage.sol';

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorage() public {
       SimpleStorage simpleStorage = new SimpleStorage();
       simpleStorageArray.push(simpleStorage);
    }

    /* Intreacting With Contracts
     This function is to store data into SimpleStorage contract. */
    function sfStore(uint256 index, uint256 data) public {
        // There are two ways to intreact with contracts.
        /*
            1. Using Address
            2. Using ABI - Application Binary Interface
        */
        SimpleStorage simpleStorage = simpleStorageArray[index];
        
        // This will call store function from SimpleStorage.sol
        simpleStorage.store(data);
    }

    // Function to retrieve store data
    function sfGet(uint256 index) public view returns (uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[index];
        return simpleStorage.retrieve();
    }
}