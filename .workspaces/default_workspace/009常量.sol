// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    //constant
    uint256 public constant C_NUM = 1998;
    string  public constant C_STR = "APPLE";
    bytes2 public constant C_BYTES = "AB";
    address public constant C_ADRESS = address(0);

    // immutable变量可以在constructor里初始化，之后不能改变
    uint256 public immutable I_NUM = 9999999999;
    address public immutable I_ADDRESS;
    uint256 public immutable I_BLOCK;
    uint256 public immutable I_TEST;


    // 利用constructor初始化immutable变量，因此可以利用
    constructor() {
        I_ADDRESS = address(this);
        I_BLOCK = block.number;
        I_TEST = test();
    }

    function test() public pure returns (uint256) {
        uint256 what = 9;
        return (what);
    }
}
