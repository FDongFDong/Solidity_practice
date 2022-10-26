// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// 외부 공개 여부
// public : 외부 모두 공개
// private : Contract 내부에서만 사용 가능
contract Function {
  uint8 private privateData = 255;
  uint8 public publicData = 255;

  // 외부 공개 x, 상속된 컨트랙트 x, 내부에서 o
  function setPrivateData(uint8 _data) private {
    publicData = _data;
  }

  // 외부 공개 x, 상속된 컨트랙트 o, 내부에서 o
  function setInternalData(uint8 _data) internal {
    publicData = _data;
  }

  // 외부 공개 o, 상속된 컨트랙트 o, 내부에서 o
  function setPublicData(uint8 _data) public {
    publicData = _data;
  }

  // 외부 공개 o, 상속된 컨트랙트 x, 내부에서 x
  function setExternalData(uint8 _data) external {
    publicData = _data;
  }
}
