// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract PureView {
  // storage 값
  uint8 private data = 255;

  // state 값을 가져오는 경우(storage)
  function getViewData() public view returns (uint8) {
    return data;
  }

  // state 값을 조회하지 않은 경우
  function getPureData() public pure returns (uint8) {
    uint8 temp_data = 9;
    return temp_data;
  }
}
