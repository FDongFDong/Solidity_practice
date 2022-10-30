// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import '@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol';
import '@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol';
import '@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol';

contract ProxyContractV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
  uint256 public count;

  function initialize() public initializer {
    count = 10;
    __Ownable_init();
  }

  // 네트워크 프록시 정보를 누구든지 바꿀 수 없도록 관리만 설정할 수 있도록 하기 위함
  function _authorizeUpgrade(address) internal override onlyOwner {}

  function inc() external {
    count++;
  }
}
