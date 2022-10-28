//SPDS-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

// contract 바깥에 써도되고 안에써도 상관없다.
error ZeroCheckError();

contract example {
  uint256 public minPrice = 1000;

  function order() external payable {
    if (msg.value < minPrice) {
      revert ZeroCheckError(); // Error 발생, State Rollback
    }

    orderList[msg.sender] = msg.value;
  }

  function order2() external payable {
    if (msg.value < minPrice) {
      revert ZeroCheckError(); // Error 발생, State Rollback
    }

    orderList[msg.sender] = msg.value;
  }
}
