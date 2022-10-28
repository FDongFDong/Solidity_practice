//SPDS-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

contract IfElse {
  uint256 public minimalPrice = 1000;
  uint256 public maxPrice = 10000000;
  mapping(int256 => address) public owner;

  function conditional(uint256 ask_price) public {
    if (ask_price > minimalPrice) {
      owner[1] = msg.sender;
    } else {
      // Fail
      revert();
    }
  }

  // 다중 조건
  function conditional2(uint256 ask_price) public {
    if (ask_price > minimalPrice) {
      owner[1] = msg.sender;
    } else if (ask_price > maxPrice) {
      revert();
    } else {
      // Fail
      revert();
    }
  }
}
