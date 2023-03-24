// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract func_005 {
    // function fCalldata(uint256[] calldata _x)
    //     public
    //     pure
    //     returns (uint256[] calldata)
    // {
    //     //参数为calldata数组，不能被修改
    //     // _x[0] = 0 //这样修改会报错
    //     return (_x);
    // }

    uint256[] x = [1, 2, 3]; // 状态变量：数组 y

    function fStorage() public {
        //声明一个storage的变量 xStorage，指向y。修改xStorage也会影响y
        uint256[] storage xStorage = x;
        xStorage[0] = 100;
    }

    
    function fMemory() public view{
        //声明一个Memory的变量xMemory，复制x。修改xMemory不会影响x
        uint[] memory xMemory = x;
        xMemory[0] = 500;
        xMemory[1] = 200;
        uint[] memory xMemory2 = x;
        xMemory2[0] = 300;
    }
}
