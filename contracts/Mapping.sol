// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Mapping {
  // ERC20에서 잔액을 관리할 때 많이 쓰인다.
  mapping(address => uint256) public balance;

  // key : value
  // key 값이 중복이 발생하지 않는다.
  function get(address _addr) public view returns (uint256) {
    return balance[_addr];
  }

  function set(address _addr, uint256 _balance) public {
    balance[_addr] = _balance;
  }

  function remove(address _addr) public {
    delete balance[_addr];
  }
}
