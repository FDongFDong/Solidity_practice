//SPDS-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

contract Loop {
  // for, while, do while

  function forLoop() public {
    uint8 sum = 0;
    for (uint8 i = 1; i < 11; i++) {
      sum += i;
    }
  }

  function whileLoop() public {
    uint8 sum = 0;
    uint8 i = 1;

    while (i < 11) {
      sum += 1;
      i++;
    }
  }

  function doWhileLoop() public {
    uint8 sum = 0;
    uint256 i = 1;
    do {
      sum += 1;
      i++;
    } while (i < 11);
  }

  function loopBreak() public {
    uint8 sum = 0;
    for (uint8 i = 1; i < 11; i++) {
      sum += i;
      if (sum > 10) {
        break;
      }
    }
  }

  function loopContinue() public {
    uint8 sum = 0;
    for (uint8 i = 1; i < 11; i++) {
      if (i == 5) {
        continue;
      }
      sum += i;
    }
  }
}
