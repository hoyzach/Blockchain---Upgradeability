// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

import "./Storage.sol";

contract Dogs is Storage {

    constructor() {
        owner = msg.sender;
    }

    function setNumberOfDogs(uint256 toSet) public {
        _uintStorage["Dogs"] = toSet;
    }

    function getNumberOfDogs() public view returns(uint256) {
        return _uintStorage["Dogs"];
    }

}