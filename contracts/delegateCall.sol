//SPDX-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

contract Calculation {
  address public owner;
  uint256 public value;

  function plusData(uint256 a, uint256 b) external returns (uint256) {
    return a + b;
  }

  // 이 컨트랙트에 없는 함수가 호출될 때는 fallback() 함수가 호출된다.
  fallback() external payable {
    owner = msg.sender;
    value = msg.value;
  }
}

contract DelegateCaller {
  address public onwer;
  uint256 public value;

  function isContract(address _addr) private returns (bool isContract) {
    uint32 size;
    assembly {
      // code state에 size정보를 가져올 수 있다.
      size := extcodesize(_addr)
    }
    // size가 0보다 크면 컨트랙트 true
    return (size > 0); // CA, EOA
  }

  // 다른 컨트랙트에 있는 함수 호출
  function callFunction(
    address payable _address,
    uint256 _a,
    uint256 _b
  ) public returns (bytes memory) {
    // 함수 호출 시 해당 함수의 input data값을 동일하게 생성해서 넣어줘야한다.
    bytes memory callFunctionBytes = abi.encodeWithSignature(
      'plusData(uint256,uint256)',
      _a,
      _b
    );
    // EOA주소인지 컨트랙트 주소인지 확인한다.
    if (isContract(_address)) {
      (bool result, bytes memory sum) = _address.delegatecall(
        callFunctionBytes
      );
      return sum;
    } else {
      revert();
    }
  }

  // 다른 컨트랙트에 없는 함수 호출
  function callNotExistFunction(
    address payable _address,
    uint256 _a,
    uint256 _b
  ) public returns (bytes memory) {
    // 함수 호출 시 해당 함수의 input data값을 동일하게 생성해서 넣어줘야한다.
    bytes memory callFunctionBytes = abi.encodeWithSignature(
      'NotExistFunction(uint256,uint256)',
      _a,
      _b
    );
    // EOA주소인지 컨트랙트 주소인지 확인한다.
    if (isContract(_address)) {
      (bool result, bytes memory sum) = _address.call(callFunctionBytes);
      return sum;
    } else {
      revert();
    }
  }
}
