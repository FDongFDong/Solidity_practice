// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract PriceConsumerV3 {
  AggregatorV3Interface internal priceFeed;

  /**
   * Network: goerli
   * Aggregaotr: BTC/USD
   * address: 0xA39434A63A52E749F02807ae27335515BA4b07F7
   **/

  constructor() {
    priceFeed = AggregatorV3Interface(
      0xA39434A63A52E749F02807ae27335515BA4b07F7
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
      /*   uint80 roundId, uint startedAt, uint timeStamp, uint80 answeredInRound */
      int256 price,

    ) = priceFeed.latestRoundData();
    return price;
  }
}
