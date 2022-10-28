// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Seller {
  address private seller;
  string private location;

  constructor(address _seller) {
    seller = _seller;
  }

  function getSeller() public view returns (address) {
    return seller;
  }
}

contract Car {
  string private type_;
  uint8 private door;
  uint256 private price;

  constructor(
    string memory _type,
    uint8 _door,
    uint256 _price
  ) {
    type_ = _type;
    door = _door;
    price = _price;
  }

  function getDoor() public view returns (uint8) {
    return door;
  }

  function getPrice() public view virtual returns (uint256) {
    return price;
  }
}

contract Benz is
  Car('suv', 4, 10000),
  Seller(0xCfc597a8793E0ca94FC8310482D9e11367cfCA24)
{
  string private model;
  address private owner;
  uint256 private premium;

  constructor(string memory _model, uint256 _premium) {
    model = _model;
    owner = msg.sender;
    premium = _premium;
  }

  function getModel() public view returns (string memory) {
    return model;
  }

  function getPrice() public view override returns (uint256) {
    return premium;
  }

  function getCarPrice() public view returns (uint256) {
    return super.getPrice();
  }
}

contract Audi is Car('sedan', 4, 20000) {
  string private model;
  address private owner;

  constructor(string memory _model) {
    model = _model;
    owner = msg.sender;
  }

  function getModel() public view returns (string memory) {
    return model;
  }
}
