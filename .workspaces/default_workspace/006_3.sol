// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    uint256[] array4;

    function f() public {
        uint256[2] memory x = [uint256(1), 2];
        array4 = x;
        array4.push(100);
    }

    function getnum()
        public
        view
        returns (uint256[] memory, uint256[2] memory)
    {
        uint256[2] memory x = [uint256(1), 2];
        return (array4, x);
    }
}

// pragma solidity ^0.8.0;

// contract MyContract {
//     uint256[] array4;
//     uint256[] array5;

//     function f() public {
//         uint256[2] memory x = [uint256(1), 2];
//         array5 = x;
//         array4 = x;
//         array4.push(100);
//     }

//     function getnum() public view returns(uint256[] memory, uint256[] memory){
//         return (array4, array5);
//     }
// }
