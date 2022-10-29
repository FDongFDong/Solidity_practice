// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20 {
  // 사용자의 잔액정보를 관리하기 위한 변수
  mapping(address => uint256) private _balances;
  // B가 C에게 보낼 수 있는 권한을 주는 변수(From 주소, To 주소, 금액)
  mapping(address => mapping(address => uint256)) private _allowances;
  // 총 발행량
  uint256 private _totalSupply;
  // 토큰의 명칭 (ETHEREUM)
  string private _name;
  // 토큰의 심볼 (ETH)
  string private _symbol;
  // 이더리움은 18진수를 사용하지만 토큰은 꼭 사용할 필요는 없다. tether는 6을 쓴다.(1000000 = 1tether)
  uint8 private _decimals;

  address public owner;

  modifier checkBalance(uint256 amount) {
    require(_balances[msg.sender] > amount, 'Not Sufficient Balance');
    _;
  }
  modifier onlyOwner() {
    require(msg.sender == owner, 'Only Owner');
    _;
  }

  event Transfer(address indexed from, address indexed to, uint256 amount);
  event Approval(address indexed from, address indexed to, uint256 amount);

  constructor(
    string memory _name_,
    string memory _symbol_,
    uint8 _decimals_
  ) {
    _name = _name_;
    _symbol = _symbol_;
    _decimals = _decimals_;
    _totalSupply = 100000000 * (10**18);
    owner = msg.sender;
  }

  function name() public view returns (string memory) {
    return _name;
  }

  function symbol() public view returns (string memory) {
    return _symbol;
  }

  function decimals() public view returns (uint8) {
    return _decimals;
  }

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address account) public view returns (uint256) {
    return _balances[account];
  }

  function transfer(address to, uint256 amount)
    public
    checkBalance(amount)
    returns (bool)
  {
    _balances[msg.sender] -= amount;
    _balances[to] += amount;
    emit Transfer(msg.sender, to, amount);
    return true;
  }

  function allowance(address _owner, address spender)
    public
    view
    returns (uint256)
  {
    return _allowances[_owner][spender];
  }

  function approve(address spender, uint256 amount)
    public
    checkBalance(amount)
    returns (bool)
  {
    _allowances[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
  }

  // 컨트랙트 소유주가 소각하는 방법
  function burn(address to, uint256 amount) public onlyOwner {
    _balances[to] -= amount;
    _totalSupply -= amount;
  }

  // 사용자의 잔액에서 소각하는 방법
  function burnByUser(uint256 amount) public {
    transfer(address(0), amount);
    _totalSupply -= amount;
  }

  function mint(address to, uint256 amount) public onlyOwner {
    _balances[to] = amount;
    _totalSupply += amount;
  }

  function transferFrom(
    address from,
    address to,
    uint256 amount
  ) public returns (bool) {
    require(_balances[from] > amount, 'Not Sufficient Balance');
    require(_allowances[from][to] > amount, 'Not Allowed Amount');
    require(to == msg.sender, 'Not Allowed User');
    _balances[from] -= amount;
    _balances[to] += amount;
    emit Transfer(from, to, amount);
    return true;
  }
}
