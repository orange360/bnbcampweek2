// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    address public owner;

    constructor(){
        owner = msg.sender;
    }
    modifier OnlyOwner{
        require(msg.sender == owner);
        _;
    }

    function ChangeOwner(address NewOwner) public OnlyOwner {
        owner = NewOwner;
    }

    }

