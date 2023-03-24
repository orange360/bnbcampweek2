// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    uint[] public dynamicArray; //声明public的动态数组

    function setDynamicArray() public {
        dynamicArray = [1, 2, 3, 4, 5];
    }

    function getDynamicArray() public view returns (uint[] memory ) {
        return dynamicArray;
    }
}
