//SPDS-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

contract Assert {
   function order() external payable {
    // assert(참이 되는 경우 )
    // 조건이 성립하지 않을 때는 스마트 컨트랙트에서 Error을 발생시킨다.
    assert(msg.value != 0);

}
