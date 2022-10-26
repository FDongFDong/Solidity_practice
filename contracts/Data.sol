// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// pragma solidity >=0.8.0 <0.9.0;

contract DataType {
  //boolean
  bool public booleanData = true; // true/false
  //integer
  int256 public intData = 0; // 양수,음수 모두 사용가능
  uint256 public uintData = 10; // 양수만 사용가능

  uint256 public uint256Data = 1000000000000; // uint와 동일한 값, 매우 큰 값을 사용할 때 0~2^256  - 1
  int256 public int256Data = -1000000000000; // 양수, 음수 모두 사용 -2^255 ~ 2^255 -1

  uint8 public uint8Data = 100;
  int8 public int8Data = -100;

  string public stringData = 'data'; // bytes값으로 변환되어 저장된다.
  bytes public bytesData = 'data'; // 가변적인 데이터를 사용할 때
  bytes20 public bytes20Data = hex'abcfcf6bec167ccfea1dbecff088659b1c38bd17'; // 주소값을 쓸 때 많이 사용한다.
  bytes32 public bytes32Data =
    hex'339c47c29216484e4cf74fc2fd39fa306af34cca61767525d2f6e69030c1c511'; // 트랜잭션 해시값
  address public addressData = 0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF; // 주소값
}
