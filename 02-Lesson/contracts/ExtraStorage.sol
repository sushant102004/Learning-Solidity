// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
    Suppose we want to override a function than we can inherit a contract into another contract
    and assign virtual specifier to original function and override specifier to new but same
    name function into inherited contract.
*/

import './SimpleStorage.sol';

contract ExtraStorage is  SimpleStorage {
    function store(uint256 fNo) public override {
        favNumber = fNo + 5;
    } 
}