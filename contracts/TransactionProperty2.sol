// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract TransactionProperty {
  mapping(address => uint256) private orderList;

  // 사용자가 주문한 사용자 정보를 관리해 수 있다.
  function newOrderList() external payable {
    orderList[msg.sender] = msg.value;
  }

  bytes4 private checkFunction;

  // 사용자가 호출한 함수인지 확인할 수 있다.
  function newCheckFunction(address sender, uint256 price)
    external
    returns (bool)
  {
    bytes selector = bytes4(keccak256('newOrderList()'));
    if (selector == msg.sig) {
      return true;
    }
  }
}
