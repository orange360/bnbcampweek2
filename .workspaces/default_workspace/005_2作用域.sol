// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract func_005_2 {
    //1.状态变量
    uint public x = 1;
    uint public y;
    string public z;

    function foo() external{
        x = 10;
        y = 20;
        z = 'orange';
    }

    //2.局部变量
    function bar() external pure returns(uint){
        uint xx = 100;
        uint yy =200;
        uint zz = xx+yy;
        return(zz);
    }


    function global() external view returns(address, uint, bytes memory){
    address sender = msg.sender;
    uint blockNum = block.number;
    bytes memory data = msg.data;
    return(sender, blockNum, data);
    }
}
