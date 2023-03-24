// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    //创建一个自己的结构体
    struct Phone{
        uint256 price;
        string color;
    }

    Phone phone;
    //赋值方法1
    function initPhone1() external{
        Phone storage _phone = phone;
        _phone.price = 8000+ _phone.price;
        _phone.color = 'white';
    }



    //赋值方法2
    function initPhone2() external{
        phone.price = 500+ phone.price;
        phone.color = 'white';
    }

    function getPhone2() external view returns(uint256,string memory) {
        return(phone.price,phone.color);
    }
    

}