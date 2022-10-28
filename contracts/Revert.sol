//SPDS-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

contract Revert {
  uint256 public minPrice = 1000;

  function order() external payable {
    if (msg.value < minPrice) {
      // error 발생, state 롤백
      revert('Msg.value must be zero');
    }
  }
}
