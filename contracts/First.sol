// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// pragma solidity ^0.8.0; 0.8버전 이상

contract Solidity {
  // a -> Func() -> b
  // 10 -> Func() -> 15
  uint8 public a = 10;

  function changeData() public {
    a = 15;
  }
}
