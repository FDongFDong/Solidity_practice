// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Proxy {
  // 연동할 주소 정보
  address public implementation;
  uint256 public x = 0;

  // proxy 컨트랙트가 통신할 상대방 컨트랙트 주소
  function setImplementation(address _implementation) external {
    implementation = _implementation;
  }

  // 요청을 받아 실제 실행할 함수
  function _delegate(address _implementation) internal {
    assembly {
      calldatacopy(0, 0, calldatasize())
      let result := delegatecall(
        gas(),
        _implementation,
        0,
        calldatasize(),
        0,
        0
      )
      returndatacopy(0, 0, returndatasize())
      switch result
      case 0 {
        revert(0, returndatasize())
      }
      default {
        return(0, returndatasize())
      }
    }
  }

  fallback() external payable {
    _delegate(implementation);
  }
}
