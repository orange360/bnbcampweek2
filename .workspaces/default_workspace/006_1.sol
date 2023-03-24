// // SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.4.16 <0.9.0;

// contract C {
//     uint256 public total = 0;

//     function f() public {
//         total = g([255, 2, 3]);
//     }

//     function g(uint8[3] memory nums) public pure returns (uint256) {
//         //让g函数实现下述功能： 返回三个参数的总和
//         uint256 sum = 0;
//         for (uint256 i = 0; i < nums.length; i++) {
//             sum += nums[i];
//         }
//         return sum;
//     }
// }


pragma solidity >=0.4.16 <0.9.0;

contract C {
    uint public total = 0;

    function f() public  {
        total  = g([uint(1), 2,3]);
    } 
    
    function g(uint[3] memory nums) public pure returns (uint) {
        //让g函数实现下述功能： 返回三个参数的总和
        uint sum = 0;
        for (uint i = 0; i < nums.length; i++) {
            sum += nums[i];
        }
        return sum;
    }
}
