// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import '@openzeppelin/contracts/utils/math/SafeMath.sol';

contract Math {
  using SafeMath for uint256;
  uint256 public a = 5;
  uint256 public b = 5;
  uint256 public c = 7;
  uint256 public d = 0;

  function add() public view returns (uint256) {
    return a.add(b);
  }

  // underflow 발생
  function sub() public view returns (uint256) {
    return a.sub(c);
  }

  function mul() public view returns (uint256) {
    return a.mul(b);
  }

  // 0 나누기
  function div() public view returns (uint256) {
    return a.div(d);
  }
}
