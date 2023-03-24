// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// 构造函数的继承
abstract contract A {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}


contract B is A(666){

}

contract C is A {
    constructor(uint _c) A(_c * _c) {}
}