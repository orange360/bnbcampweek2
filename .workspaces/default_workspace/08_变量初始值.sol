// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    bool public _bool; // false
    string public _string; // ""
    int256 public _int; // 0
    uint256 public _uint; // 0
    address public _address; // 0x0000000000000000000000000000000000000000
    bytes1 public _bytes1;
    bytes2 public _bytes2;

    enum ActionSet {
        Buy,
        Hold,
        Sell
    }
    ActionSet public _enum; // 第一个元素 0

    function fi() internal {} // internal空白方程

    function fe() external {} // external空白方程

    // Reference Types
    uint256[8] public _staticArray; // 所有成员设为其默认值的静态数组[0,0,0,0,0,0,0,0]
    uint256[] public _dynamicArray; // `[]`
    mapping(uint256 => address) public _mapping; // 所有元素都为其默认值的mapping
    // 所有成员设为其默认值的结构体 0, 0
    struct Student {
        uint256 id;
        uint256 score;
    }
    Student public student;

    // delete操作符
    bool public _bool2 = true;

    function d() external {
        delete _bool2; // delete 会让_bool2变为默认值，false
    }

    string public _string5 = "true";

    function deletea() external returns (string memory) {
        delete _string5;
        return _string5;
    }
}
