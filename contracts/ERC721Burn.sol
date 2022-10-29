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

  function ownerOf(uint256 tokenId) public view returns (address) {}

  function name() public view returns (string memory) {}

  function symbol() public view returns (string memory) {}

  function tokenURI(uint256 tokenId) public view returns (string memory) {}

  function getApproved(uint256 tokenId) public view returns (address) {}

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

  function mint(
    address to,
    uint256 tokenId,
    string memory url
  ) public {
    _balances[to] += 1;
    _owners[tokenId] = to;
    _tokenInfo[tokenId] = url;
    totalSupply += 1;
    emit Transfer(address(0), to, tokenId);
  }

  function burn(uint256 tokenId) public {
    address owner = _owners[tokenId];
    // 설정한 권한이 있을 수 있으니 권한도 삭제한다.
    delete _tokenApprovals[tokenId];
    // 발행량을 하나 줄여준다.
    _balances[owner] -= 1;
    // 등록된 토큰을 초기화한다.
    delete _owners[tokenId];
    // owner가 토큰 id를 0번 주소로 전송을 했음을 알려주는 event
    emit Transfer(owner, address(0), tokenId);
  }

  function transfer(address to, uint256 tokenId) public {}

  function approve(address to, uint256 tokenId) public {}

  function setApprovalForAll(
    address owner,
    address operator,
    bool approved
  ) public {}
}
