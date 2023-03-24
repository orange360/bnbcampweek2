// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Token {
    address public owner;
    mapping(uint256 => address) private _owners;

    error TransferNotOwner666(); // 自定义error

    constructor() {
        owner = msg.sender;
    }

    function transferOwner1(uint256 tokenId, address newOwner) public {
        if (_owners[tokenId] != msg.sender) {
            revert TransferNotOwner666();
        }
        _owners[tokenId] = newOwner;
    }

    function transferOwner2(uint256 tokenId, address newOwner) public {
        require(_owners[tokenId] == msg.sender);
        _owners[tokenId] = newOwner;
    }

    function transferOwner3(uint256 tokenId, address newOwner) public {
        assert(_owners[tokenId] == msg.sender);
        _owners[tokenId] = newOwner;
    }

    uint256 public num;

    error InvalidValue(uint256 value, string message);

    function setValue(uint256 value) public {
        if (value > 100) {
            revert InvalidValue(
                value,
                "Value should be less than or equal to 100."
            );
        }
        num = value;
    }
}
