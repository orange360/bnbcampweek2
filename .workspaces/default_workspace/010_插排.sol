// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract MyContract {
    // //插排
    // uint256[5] public MyArr = [50, 10, 30, 20, 40];
    // uint256[] public MyNewArr2;

    // constructor() {
    //     MyNewArr2 = IsertSort(dynamicArrayFromStatic(MyArr));
    // }

    // function dynamicArrayFromStatic(uint256[5] memory arr)
    //     private
    //     pure
    //     returns (uint256[] memory)
    // {
    //     uint256[] memory dynamicArr = new uint256[](arr.length);
    //     for (uint256 i = 0; i < arr.length; i++) {
    //         dynamicArr[i] = arr[i];
    //     }
    //     return dynamicArr;
    // }

    // function IsertSort(uint256[] memory arr)
    //     public
    //     pure
    //     returns (uint256[] memory)
    // {
    //     uint256[] memory NewArr = new uint256[](arr.length);
    //     for (uint256 i = 0; i < arr.length; i++) {
    //         NewArr[i] = arr[i];
    //     }
    //     for (uint256 i = 1; i < NewArr.length; i++) {
    //         if (NewArr[i] < NewArr[i - 1]) {
    //             uint256 temp = NewArr[i];
    //             uint256 j = i;
    //             while (j > 0 && temp < NewArr[j - 1]) {
    //                 NewArr[j] = NewArr[j - 1];
    //                 j--;
    //             }
    //             NewArr[j] = temp;
    //         }
    //     }
    //     return NewArr;
    // }

    // 插入排序 正确版
    function insertionSort(uint256[] memory a)
        public
        pure
        returns (uint256[] memory)
    {
        // note that uint can not take negative value
        for (uint256 i = 1; i < a.length; i++) {
            uint256 temp = a[i];
            uint256 j = i;
            while ((j >= 1) && (temp < a[j - 1])) {
                a[j] = a[j - 1];
                j--;
            }
            a[j] = temp;
        }
        return (a);
    }
}
