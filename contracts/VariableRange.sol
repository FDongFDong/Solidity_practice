// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract VariableRange {
  // Storage에 저장
  uint256 private data = 10;

  function getStorageData() public view returns (uint256) {
    return data;
  }

  function getMemoryData() public pure returns (uint256) {
    uint256 data = 5;
    return data;
  }
}
