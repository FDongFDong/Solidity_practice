// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract EthTransfer {
  event Transfer();

  function isContract(address _addr) private returns (bool isContract) {
    uint32 size;
    assembly {
      // code state에 size정보를 가져올 수 있다.
      size := extcodesize(_addr)
    }
    // size가 0보다 크면 컨트랙트 true
    return (size > 0); // CA, EOA
  }

  // 이더리움을 전송하는 방법
  // transfer, send, call
  // address(to).transfer, address(to).send, address(to).call
  function sendTransfer(address payable to) public payable {
    to.transfer(msg.value);
  }

  // send : 전송이 성공했는지 실패했는지 리턴해준다.
  function sendSend(address payable to) public payable {
    bool result = to.send(msg.value);
    if (result == true) {
      // 성공
      emit Transfer();
    } else {
      revert();
    }
  }

  // 외부함수를 호출할 수도 있고 이더리움을 전송할 수도 있다.
  function sendCall(address payable to) public payable {
    (bool result, bytes memory data) = to.call{ value: msg.value }('');
    if (result == true) {
      emit Transfer();
    } else {
      revert();
    }
  }
}
