// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Yeye {
    event Log(string msg);

    // 定义3个function: hip(), pop(), man()，Log值为Yeye。
    function hip() public virtual {
        emit Log("Yeye");
    }

    function pop() public virtual {
        emit Log("Yeye");
    }

    function yeye() public virtual {
        emit Log("Yeye");
    }
}

contract Baba is Yeye {
    // 继承两个function: hip()和pop()，输出改为Baba。
    function hip() public virtual override {
        emit Log("Baba");
    }

    function pop() public virtual override {
        emit Log("Baba");
    }

    function baba() public virtual {
        emit Log("Baba");
    }
}

contract Erzi is Yeye, Baba {
    // 继承两个function: hip()和pop()，输出值为Erzi。
    function hip() public override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function pop() public override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function callParent() public {
        Yeye.pop();
    }

    function callParentSuper() public {
        // 将调用最近的父合约函数，Baba.pop()
        super.pop();
    }
}

//修饰器的继承
