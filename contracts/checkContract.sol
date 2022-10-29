// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// 컨트랙트인지 EOA인지 확인하는 방법
contract CheckContract {
  function isContract(address _addr) private returns (bool isContract) {
    uint32 size;
    assembly {
      // code state에 size정보를 가져올 수 있다.
      size := extcodesize(_addr)
    }
    // size가 0보다 크면 컨트랙트 true
    return (size > 0); // CA, EOA
  }
}
