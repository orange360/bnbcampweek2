// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    mapping(uint256 => address) public idToAddress ;

    constructor()  {
        idToAddress[0] = address(0);
    }

    function MyMap(uint256 _key, address _value) public {
        idToAddress[_key] = _value;
    }

    function GetMap(uint256 key1) public view returns (address) {
        return idToAddress[key1];
    }
}
