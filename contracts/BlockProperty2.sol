// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// 랜덤한 값을 확인할 때 자주 사용한다.
contract BlockPropertyExample {
  function generateRandom() public view returns (uint8) {
    uint8 number = uint8(
      uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) %
        251
    );
    return number;
  }
}
