//SPDS-License-Identifier : MIT
pragma solidity >=0.8.0 <0.9.0;

contract Math {
  function plusData(uint256 a, uint256 b) external returns (uint256) {
    return a + b;
  }
}

contract TryCatch {
  address payable temp_address;
  // Math 컨트랙트 생성

  Math math = new Math();

  function callOtherContract(address to) external {
    try math.plusData(6, 4) returns (uint256 result) {
      (temp_address).transfer(result);
    } catch {
      revert();
    }
  }
}
