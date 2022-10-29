// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {
  string private _name;
  string private _symbol;

  // 토큰 정보
  mapping(uint256 => string) private _tokenInfo;
  // 토큰의 주인
  mapping(uint256 => address) private _owners;
  mapping(address => uint256) private _balances;
  mapping(uint256 => address) private _tokenApprovals;
  mapping(address => mapping(address => bool)) private _operatorApprovals;

  uint256 private totalSupply;

  event Transfer(address from, address to, uint256 tokenId);
  event Approval(address from, address to, uint256 tokenId);
  // 누구에게나 공개하기 위함
  event ApprovalForAll(address from, address operator, bool approval);

  constructor(string memory name_, string memory symbol_) {
    _name = name_;
    _symbol = symbol_;
  }

  function balanceOf(address owner) public view returns (uint256) {}

  // 토큰id의 소유자
  function ownerOf(uint256 tokenId) public view returns (address) {}

  function name() public view returns (string memory) {}

  function symbol() public view returns (string memory) {}

  // 토큰의 실제 이미지 주소
  function tokenURI(uint256 tokenId) public view returns (string memory) {}

  // 어떤 주소에 이동권한을 줬는지
  function getApproved(uint256 tokenId) public view returns (address) {}

  // 전체 권한을 넘겨줬는지 체크하는 함수
  function isApprovedForAll(address owner, address operator)
    public
    view
    returns (bool)
  {}

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public {}

  // 토큰 발행
  function mint(
    address to,
    uint256 tokenId,
    string memory url
  ) public {}

  function burn(uint256 tokenId) public {}

  function transfer(address to, uint256 tokenId) public {}

  function approve(address to, uint256 tokenId) public {}

  // 특정 거래소에 대해 nft의 이동권한을 전부 넘겨주는 함수
  function setApprovalForAll(
    address owner,
    address operator,
    bool approved
  ) public {}
}
