// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Operation {
  uint256 public intData = 0;
  string public stringData;

  function math() public {
    intData = intData + 1;
    // intData += 1;
    intData++;

    intData = intData - 1;
    intData = intData * 1;
    intData = intData / 1;
  }

  function weiToEth() public {
    uint256 wei_data = 1 wei;

    uint256 eth_data = wei_data * (10**18);
    uint256 gwei_data = wei_data * (10**9);
  }

  function logical() public {
    bool true_data = true;
    bool false_data = false;

    if (true_data) {
      // ...
    } else {
      // ...
    }
    if (true_data && false_data) {
      // flase
      // ...
    }
    if (true_data || false_data) {
      // true
      // ...
    }
    if (true_data == false_data) {
      // flase
      // ...
    }
  }

  function logical2() public {
    uint256 big_data = 100;
    uint256 small_data = 1;

    if (big_data == small_data) {} //false
    if (big_data > small_data) {} // true
    if (big_data != small_data) {} // true
  }
}
