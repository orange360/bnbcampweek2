// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
contract MyContract {
    //倒排
    uint256[5] public MyArr = [10,20,30,40,50];
    uint256[] public MyNewArr2;

    constructor() {
        MyNewArr2 = reverse(dynamicArrayFromStatic(MyArr));
    }

    function dynamicArrayFromStatic(uint256[5] memory arr) private pure returns (uint256[] memory) {
        uint256[] memory dynamicArr = new uint256[](arr.length);
        for (uint256 i = 0; i < arr.length; i++) {
            dynamicArr[i] = arr[i];
        }
        return dynamicArr;
    }

    function reverse(uint256[] memory arr) public pure returns (uint256[] memory) {
        uint256[] memory NewArr = new uint256[](arr.length);
        for (uint256 i = 0; i < arr.length; i++) {
            NewArr[i] = arr[arr.length - i - 1];
        }
        return NewArr;
    }
}
