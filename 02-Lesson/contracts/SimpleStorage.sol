// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    uint256 favNumber;

    struct People {
        uint256 favNumber;
        string name;
    }

    People[] public peoples;

    mapping (string => uint256) public nameToFavNo;

    // Here we added virtual because this function is overrided by another function in inherited contract.
    function store(uint256 fNo) public virtual  {
        favNumber = fNo;
    }

    function retrieve() public view returns (uint256) {
        return favNumber;
    }

    function addPerson(string memory name, uint256 fNo) public {
        peoples.push(People(fNo, name));
        nameToFavNo[name] = fNo;
    }
}