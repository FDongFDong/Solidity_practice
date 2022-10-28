// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Struct {
  struct Product {
    string name;
    uint256 price;
  }
  Product public mainProduct;
  uint256 public maxProductCount;

  // 생성자 : 네트워크 배포시에만 동작한다.

  // 값을 배포시에 정하는 방법
  constructor() {
    maxProductCount = 1000;
  }

  function initProduct() public {
    Product memory firstProduct;
    firstProduct = Product('toy', 10);
  }

  function setMainProduct(string memory _name, uint256 _price) public {
    mainProduct.name = _name;
    mainProduct.price = _price;
  }

  function getMainProductPrice() public view returns (uint256) {
    return mainProduct.price;
  }
}
