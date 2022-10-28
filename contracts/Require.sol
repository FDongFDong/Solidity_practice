//SPDX-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

contract Modifier {
  function order() external payable {
    // require(참이 되는 경우, 아닌 경우 나타낼 출력)
    require(msg.value != 0, 'Msg.value must be zero');

    // if (msg.value != 0) {
    //   // true 값
    // } else {
    //   revert('Msg.value must be zero');
    // }
  }
}
