// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ImplementV1 {
  address public implementation;
  uint256 public x;

  function increment() external {
    x += 1;
  }

  function decrement() external {
    x -= 1;
  }
}
