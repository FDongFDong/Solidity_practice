// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Counter {
  uint256 public count;

  function getCount() external view returns (uint256) {
    return count;
  }

  function increment() external {
    count += 1;
  }
}

// 파라미터와 리턴만 작성한다. 로직은 작성하지 않는다.
interface ICounter {
  function getCount() external view returns (uint256);

  function increment() external;
}

contract MyContract {
  // 배포된 컨트랙트 주소값
  function incrementCount(address _counter) external {
    ICounter(_counter).increment();
  }

  function getCount(address _counter) external view returns (uint256) {
    return ICounter(_counter).getCount();
  }
}
