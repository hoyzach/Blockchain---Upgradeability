// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

import "./Storage.sol";

//Update Dogs contract to add onlyOwner functionality to setNumberOfDogs function
contract DogsUpdated is Storage {

    constructor() {
        owner = msg.sender;
    }

    function setNumberOfDogs(uint256 toSet) public onlyOwner{
        _uintStorage["Dogs"] = toSet;
    }

    function getNumberOfDogs() public view returns(uint256) {
        return _uintStorage["Dogs"];
    }
}