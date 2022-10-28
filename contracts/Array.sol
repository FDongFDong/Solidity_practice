// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Array {
  //[1,2,3,4]
  uint256[] public nums = [1, 2, 3];
  uint256[3] public numsFixed = [4, 5, 6];

  function examples() external {
    nums.push(4); // [1,2,3,4]
    uint256 x = nums[1]; // x = 2
    nums[2] = 777; //[1,2,777,4]
    delete nums[1]; // [1,0,777,4] 사라지지 않는다.
    nums.pop(); // [1, 0, 777]
    uint256 len = nums.length;
  }
}
