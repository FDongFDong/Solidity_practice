// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract BlockProperty {
  // Base Fee
  uint256 public block_basefee = block.basefee;
  // Chain Id
  uint256 public block_chainid = block.chainid;
  // 채굴자 정보
  address payable public block_coinbase = block.coinbase;
  // 블록의 난이도
  uint256 public block_difficulty = block.difficulty;
  // 블록의 Gas Limit
  uint256 public block_gaslimit = block.gaslimit;
  // 처리되고 있는 블록의 넘버
  uint256 public block_number = block.number;
  // 타임스탬프
  uint256 public block_timestamp = block.timestamp;
}
