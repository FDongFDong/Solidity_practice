//SPDX-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

contract Modifier {
  uint256 public minPrice = 10000;
  mapping(address => uint256) public orderList;

  modifier checkMinPrice() {
    // 사용자의 value가 최소값보다 크면 다음 구문을 실행한다.
    require(msg.value > minPrice);
    _;
  }

  function test1() public payable checkMinPrice {
    // checkMinPrice의 조건이 맞으면 해당 구문을 실행시키겠다.
    orderList[msg.sender] = msg.value;
  }

  function test2() public payable checkMinPrice {
    orderList[msg.sender] = msg.value;
  }
}
