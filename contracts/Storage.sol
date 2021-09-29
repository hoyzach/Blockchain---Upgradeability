// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.6;

contract Storage{

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    mapping (string => uint256) _uintStorage;
    mapping (string => address) _addressStorage;
    mapping (string => bool) _boolStorage;
    mapping (string => string) _stringStorage;
    mapping (string => bytes4) _bytesStorage;
    address public owner;
    bool public _initialized;

}