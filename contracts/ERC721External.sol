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
  // tokenId에 연결된 주소
  mapping(uint256 => address) private _tokenApprovals;
  // from, to, bool
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

  // 잔액 정보 확인
  function balanceOf(address owner) public view returns (uint256) {
    return _balances[owner];
  }

  // 토큰 주인 확인
  function ownerOf(uint256 tokenId) public view returns (address) {
    return _owners[tokenId];
  }

  // 컨트랙트 이름 확인
  function name() public view returns (string memory) {
    return _name;
  }

  // 컨트랙트 심볼 확인
  function symbol() public view returns (string memory) {
    return _symbol;
  }

  // tokenURI 확인
  function tokenURI(uint256 tokenId) public view returns (string memory) {
    return _tokenInfo[tokenId];
  }

  function getApproved(uint256 tokenId) public view returns (address) {
    return _tokenApprovals[tokenId];
  }

  function isApprovedForAll(address owner, address operator)
    public
    view
    returns (bool)
  {
    return _operatorApprovals[owner][operator];
  }

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public {
    // 토큰 소유자 정보 가져오기
    address owner = _owners[tokenId];
    require(
      (msg.sender == owner ||
        isApprovedForAll(owner, msg.sender) ||
        getApproved(tokenId) == msg.sender),
      'Not Approved'
    );
    delete _tokenApprovals[tokenId];
    _balances[from] -= 1;
    _balances[to] += 1;
    _owners[tokenId] = to;
    emit Transfer(from, to, tokenId);
  }

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
    delete _tokenApprovals[tokenId];
    _balances[owner] -= 1;
    delete _owners[tokenId];
    emit Transfer(owner, address(0), tokenId);
  }

  function transfer(address to, uint256 tokenId) public {
    require(_owners[tokenId] == msg.sender, 'Incorrect Owner');
    delete _tokenApprovals[tokenId];
    _balances[msg.sender] -= 1;
    _balances[to] += 1;
    _owners[tokenId] = to;
    emit Transfer(msg.sender, to, tokenId);
  }

  function approve(address to, uint256 tokenId) public {
    require(_owners[tokenId] == msg.sender, 'Incorrect Owner');
    _tokenApprovals[tokenId] = to;
    emit Approval(_owners[tokenId], to, tokenId);
  }

  function setApprovalForAll(
    address owner,
    address operator,
    bool approved
  ) public {
    _operatorApprovals[owner][operator] = approved;
    emit ApprovalForAll(owner, operator, approved);
  }
}
