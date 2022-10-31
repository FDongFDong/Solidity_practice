// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

// 매 블록마다 사용자의 담보물의 가치를 확인하는 컨트랙트
contract TvlCalculator {
  AggregatorV3Interface internal priceFeed;
  event Receive(address sender, uint256 value);

  /**
   * Network: goerli
   * Aggregaotr: LINK/USD
   * address: 0x48731cF7e84dc94C5f84577882c14Be11a5B7456
   **/
  //https://docs.chain.link/docs/data-feeds/price-feeds/addresses/?network=ethereum
  constructor() {
    priceFeed = AggregatorV3Interface(
      0x48731cF7e84dc94C5f84577882c14Be11a5B7456
    );
  }

  function getDecimals() external view returns (uint8) {
    uint8 dec = priceFeed.decimals();
    return dec;
  }

  function getDescription() external view returns (string memory) {
    string memory des = priceFeed.description();
    return des;
  }

  function getLatesPrice() public view returns (int256) {
    (
      ,
      /*   uint80 roundId */
      int256 price, /* uint startedAt */ /* uint timeStamp*/
      ,
      ,

    ) = /* uint80 answeredInRound*/
      priceFeed.latestRoundData();
    return price;
  }

  //   현재 컨트랙트에 얼마의 담보물 가치가 있는지 확인하는 함수
  function getTvlOnContract() public view returns (uint256) {
    int256 currentPrice = getLatesPrice();
    uint256 tvl = address(this).balance *
      (uint256(currentPrice) / (10**priceFeed.decimals()));
    //   ERC20 토큰의 TVL값 구하기
    //   uint tvl = IERC20(_address).balanceOf("msg.sender") * (uint(currentPrice) / (10** priceFeed.decimals))
    return tvl;
  }

  fallback() external payable {
    emit Receive(msg.sender, msg.value);
  }

  receive() external payable {
    emit Receive(msg.sender, msg.value);
  }
}
