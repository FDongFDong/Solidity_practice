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

  modifier checkBalance(uint256 amount) {
    // 사용자가 보낼 잔액을 가지고 있는지 체크한다.
    require(_balances[msg.sender] > amount, 'Not Sufficient Balance');
    _;
  }
  // 누가 누구에게 얼마를 보냈는지 이벤트로 기록하기 위함
  // indexed : 로그상에서 찾기 쉽게 인덱스로 값을 나타내기 위함
  event Transfer(address indexed from, address indexed to, uint256 amount);
  // 사용자의 권한을 인증해주는 부분이라 위와 동일하다.
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
    // 보내는 사람 잔액에서 요청한 만큼 빼준다.
    _balances[msg.sender] -= amount;
    // 받는 사람 주소에서 뺀만큼의 금액을 더해준다.
    _balances[to] += amount;
    emit Transfer(msg.sender, to, amount);
    return true;
  }

  // 값을 얼마나 설정했는지 확인하는 함수
  function allowance(address owner, address spender)
    public
    view
    returns (uint256)
  {
    return _allowances[owner][spender];
  }

  //  다른사람이 내돈을 어느정도 쓸수있게 권한을 설정하는 함수
  function approve(address spender, uint256 amount)
    public
    checkBalance(amount)
    returns (bool)
  {
    _allowances[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
  }

  function transferFrom(
    address from,
    address to,
    uint256 amount
  ) public returns (bool) {
    // 보내기전 충분한 돈을 가지고 있는지 확인
    require(_balances[from] > amount, 'Not Sufficient Balance');
    //  실제로 허용한 금액이 전송하려는 금액보다 많은지 확인
    require(_allowances[from][to] > amount, 'Not Allowed Amount');
    // 권한을 가진사람이 돈을 보내기를 요청하는지 확인
    require(to == msg.sender, 'Not Allowed User');
    // 보내는 사람 잔액에서 요청한 만큼 빼준다.
    _balances[from] -= amount;
    // 받는 사람 주소에서 뺀만큼의 금액을 더해준다.
    _balances[to] += amount;
    emit Transfer(from, to, amount);
    return true;
  }
}
