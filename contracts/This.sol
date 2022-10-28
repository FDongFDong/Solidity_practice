// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract This {
  uint256 public data = 10;

  function getBalacne() public view returns (uint256) {
    return address(this).balance;
  }

  // 외부에서만 호출을 할 수 있는 함수
  function externalFunction() external {
    data = 15;
  }

  // 외부에서만 호출할 수 있는 함수인 externalFunction을 this 키워드를 통해 호출가능하다.
  function internalFunction() internal {
    this.externalFunction();
  }
}
