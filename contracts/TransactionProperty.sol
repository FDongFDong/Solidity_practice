// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract TransactionProperty {
  // 실제로 실행하고 남은 가스의 양을 확인할 수 있다.
  uint256 public msg_gasleft = gasleft();
  // 트랜잭션 호출 시 Data를 확인할 수 있다.
  bytes public msg_data = msg.data;
  // 트랜잭션을 요청한 사람의 정보도 가져올 수 있다.
  address public msg_sender = msg.sender;
  // 함수 호출 시 MethodID 값을 바이트 값으로 읽어올 수 있다.
  bytes4 public msg_sig = msg.sig;
  // 사용자가 전송한 이더리움의 크기
  uint256 public msg_value = msg.value;

  // msg.value를 호출하는 함수는 항상 이더리움을 받을 수 있는 상태인 payable이 되어야한다.
  function checkValue() external payable {
    uint256 value = msg.value;
  }
}
