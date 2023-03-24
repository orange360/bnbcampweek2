// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract test{
    bool public _bool = true;
    // 布尔运算
    bool public _bool1 = !_bool; //取非
    bool public _bool2 = _bool && _bool1; //与
    bool public _bool3 = _bool || _bool1; //或
    bool public _bool4 = _bool == _bool1; //相等
    bool public _bool5 = _bool != _bool1; //不相等

    // 整型
    int public _int = -1; // 整数，包括负数
    uint public _uint = 1; // 正整数
    uint256 public _number = 20220330; // 256位正整数

        // 整数运算
    uint256 public _number1 = _number + 1; // +，-，*，/ 20220331
    uint256 public _number2 = 2**2; // 指数 4
    uint256 public _number3 = 7 % 2; // 取余数 1
    bool public _numberbool = _number2 > _number3; // 比大小 true

        // 固定长度的字节数组
    bytes32 public _byte32 = "MiniSolidity"; 
    bytes1 public _byte = _byte32[0]; 

        // 用enum将uint 0， 1， 2表示为Buy, Hold, Sell
    enum ActionSet { Buy, Hold, Sell }
    // 创建enum变量 action
    ActionSet action = ActionSet.S;

        // enum可以和uint显式的转换
    function enumToUint() external view returns(uint){
        return uint(action);
    }

    }


