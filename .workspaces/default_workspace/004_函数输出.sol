// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract func004{
    uint256 public _number5 = 100;
    // 返回多个变量
    function returnMultiple() public pure returns(uint256, bool, uint256[3] memory){
            return(1, true, [uint256(8),2,5]);
        }

    // 命名式返回
    function returnNamed() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array){
        _number = 2;
        _bool = false; 
        _array = [uint256(3),2,1];
    }

    // 命名式返回，依然支持return
    function returnNamed2() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array){
        return(1, true, [uint256(1),2,5]);
    }



    //解构赋值
    function readreturn1() public {
        bool _bool;
        uint256[3] memory _array;
        (_number5, _bool, _array) = returnNamed();

    }

    function readreturn2() public {
        bool _bool2;
        uint256[3] memory _array2;

        (_number5, _bool2, ) = returnNamed2();
    }
}