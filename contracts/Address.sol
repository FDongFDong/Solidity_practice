// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Address {
  // 체크섬이 정상적으로 진행되지 않은 데이터.
  address public failUser = 0xdafea492d9c6733ae3d56b7ed1adb60692c98bc5;
  // 체크섬이 정상적으로 진행된 데이터
  address public user = 0xDAFEA492D9c6733ae3d56b7Ed1ADB60692c98Bc5;

  address payable public payable_user = payable(user);

  // 이더리움을 주고 받는 주소나 EOA같은 경우에는 payable을 명시해줘야지만 전송이 가능하다.
  function sendEth() public payable {
    payable_user.transfer(1000000000000000000);
  }

  // 사용자가 가진 잔액을 조회할 수 있다.
  function getBalance() public view returns (uint256) {
    return user.balance;
  }
}
