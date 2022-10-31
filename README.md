# Solidity

- [Solidity](#solidity)
  - [Solidity 기본 문법](#solidity-기본-문법)
    - [Compile](#compile)
    - [값 변경](#값-변경)
    - [Value 자료형](#value-자료형)
    - [Operation](#operation)
    - [Function](#function)
    - [Visibility](#visibility)
    - [Version](#version)
    - [Struct](#struct)
    - [Enum](#enum)
    - [Array](#array)
    - [Mapping](#mapping)
    - [Variable Range](#variable-range)
    - [Address](#address)
    - [This](#this)
    - [If Else](#if-else)
    - [Loop](#loop)
    - [Block Property](#block-property)
    - [Transaction Property](#transaction-property)
    - [Modifier](#modifier)
    - [Require](#require)
    - [Assert](#assert)
    - [Revert](#revert)
    - [Try-Catch](#try-catch)
    - [CustomError](#customerror)
    - [Fallback, Receive](#fallback-receive)
    - [상속](#상속)
    - [Override](#override)
    - [Super](#super)
    - [다중 상속](#다중-상속)
    - [Check Contract](#check-contract)
    - [Transfer, Send, Call](#transfer-send-call)
    - [call, delegate call](#call-delegate-call)
  - [Openzeppelin 사용하기](#openzeppelin-사용하기)
    - [SafeMath](#safemath)
    - [Openzeppelin으로 ERC20 토큰 발행하기](#openzeppelin으로-erc20-토큰-발행하기)
  - [ERC20 코드 작성하며 살펴보기](#erc20-코드-작성하며-살펴보기)
    - [ERC20](#erc20)
    - [Mint](#mint)
    - [Burn](#burn)
    - [주소를 BlackList로 만들기](#주소를-blacklist로-만들기)
  - [ERC721 코드 작성하며 살펴보기](#erc721-코드-작성하며-살펴보기)
    - [Mint](#mint-1)
    - [Burn](#burn-1)
    - [Transfer](#transfer)
    - [NFT를 발행하는 방식](#nft를-발행하는-방식)
  - [Upgradable Contract](#upgradable-contract)
    - [Upgradable Contract 코드 작성하며 이해하기](#upgradable-contract-코드-작성하며-이해하기)
    - [Openzeppelin으로 구현한 UUPSUpgrdeable](#openzeppelin으로-구현한-uupsupgrdeable)
  - [외부 컨트랙트 함수 호출하기](#외부-컨트랙트-함수-호출하기)
  - [Offchain Data 가져오기](#offchain-data-가져오기)
    - [외부 데이터를 가져와야 하는 이유](#외부-데이터를-가져와야-하는-이유)
    - [Chainlink - External Data](#chainlink---external-data)

---

## Solidity 기본 문법

1. Contract 파일 작성
2. (컴파일) -> Output: EVM 바이트코드, ABI
3. (배포) -> 이더리움 클라이언트

= 배포도 트랜잭션이다.

### Compile

컴파일 시 Contract의 Bytecode와 ABI가 출력된다.

- bytecode: 스마트 컨트랙트를 16진수로 표현한 것
- ABI(Application Binary Interface): 스마트 컨트랙트의 함수와 파라미터에 대한 메타데이터를 정의해 컨트랙트의 객체를 만들고 컨트랙트에 정의된 함수를 호출할 수 있도록 하는 인터페이스

SmartContract

1. 접근 방법
   - 터미널(ssh)
   - 브라우저(JSON-RPC)
2. EVM 바이트코드에 연결

---

### 값 변경

소스코드 : [First.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/First.sol)

값을 변경하려면 함수를 사용하여 값을 변경해야한다.

---

### Value 자료형

소스코드 : [Data.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Data.sol)

- 자료형에도 int8, int32, int256 등 값이 다양하다.
  가스비를 효율적으로 사용하기 위함
- float형이 없다.

---

### Operation

소스코드 : [Operation.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Operation.sol)

---

### Function

소스코드 : [Function.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Function.sol)

- state 값을 변경 시키는 경우
  - 트랜잭션을 발생시켜 가스비를 소모한다.
  - 변경이 일어난 경우 모든 노드가 실행을 해서 검증을 해야하기 때문에 트랜잭션을 발생시킨다.
- state 값을 변경 시키지 않는 경우
  - State 값을 바꾸지 않는 기능은 트랜잭션을 발생시키지 않는다.
  - 단순히 값을 꺼내와서 사용자에게 보여주기 때문이다.

---

### Visibility

소스코드 : [FunctionVisiblilty.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Function.sol)

- private : 외부 공개 x, 상속된 컨트랙트 x, 내부에서 o
- internal : 외부 공개 x, 상속된 컨트랙트 o, 내부에서 o
- public : 외부 공개 o, 상속된 컨트랙트 o, 내부에서 o
- external : 외부 공개 o, 상속된 컨트랙트 x, 내부에서 x

---

### Version

소스코드 : [Version4.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Function.sol)
소스코드 : [Version8.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Version8.sol)

Version 4, Version 8 오버플로우 처리 방법이 서로 다르다.
위와 같이 보안적인면 이외에도 많은 부분이 개선되었으므로 되도록 높은 버전을 쓰자

- Version4에서는 2^8 - 1에 +1을 더하면 0이 된다.
- Version8에서는 에러를 일으킨다.

---

### Struct

소스코드 : [Struct.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Struct.sol)
사용자 자료형을 다루기 위해 사용

---

### Enum

소스코드 : [Enum.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Enum.sol)
주로 상태값을 처리하기 위해 사용

---

### Array

소스코드 : [Array.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Array.sol)

delete 의 경우 해당 인덱스가 사라지지 않고 0으로 변한다.

---

### Mapping

소스코드 : [Mapping.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Mapping.sol)

- key값은 중복되지 않는다.
  - 동일한 key 값을 넣었을 때 업데이트 된다.

---

### Variable Range

소스코드 : [VariableRange.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/VariableRange.sol)

- 전역변수로 만든 데이터는 Storage에 저장된다.
- 함수 내부에 생성한 데이터는 Memory에 저장된다.

---

### Address

소스코드 : [Address.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Address.sol)

- 체크섬이 완료되서 대소문자가 규칙성에 맞게 정상적으로 반영된 것만 사용할 수 있다.
- 이더리움을 주고 받는 주소나 EOA같은 경우에는 payable을 명시해줘야지만 전송이 가능하다.

---

### This

소스코드 : [This.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/This.sol)
this 키워드는 자기 자신 컨트랙트를 지칭한다.

---

### If Else

소스코드 : [IfElse.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/IfElse.sol)

- If
- If - else
- If - else if - else

---

### Loop

소스코드 : [Loop.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Loop.sol)

- For
- While
- Do While

---

### Block Property

소스코드 : [BlockProperty.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/BlockProperty.sol)
소스코드 : [BlockProperty2.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/BlockProperty2.sol)

---

**goerli Test Net**

![image](https://user-images.githubusercontent.com/20445415/198577384-03db8955-0ea9-469a-920e-3841e45e627e.png)

---

### Transaction Property

소스코드 : [TransactionProperty.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/TransactionProperty.sol)
소스코드 : [TransactionProperty2.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/TransactionProperty2.sol)

---

### Modifier

소스코드 : [Modifier.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Modifier.sol)

- 중복으로 사용되는 조건을 체크할 수 있다.

---

### Require

소스코드 : [Require.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Require.sol)

- Error 구문을 출력할 수 있다.

---

### Assert

소스코드 : [Assert.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Assert.sol)

- Require문과 달리 단순히 조건만 체크할 때 사용한다. Error 구문을 출력하지 못함.
- 조건이 성립하지 않을 때는 스마트 컨트랙트에서 Error을 발생시키고 트랜잭션으로 인해 변경된 state를 rollback시키고 사용자가 제공한 gas price를 되돌려준다.

---

### Revert

소스코드 : [Revert.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Revert.sol)

- 무조건 Error를 발생시키고 State를 Rollback한다.
- Error 구문을 출력할 수 있다.

---

### Try-Catch

소스코드 : [TryCatch.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/TryCatch.sol)

- 일반적으로 사용할 수 없으며 다른 함수를 호출했을 경우에만 사용할 수 있다.

---

### CustomError

소스코드 : [CustomError.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/CustomError.sol)

- 중복적인 Error을 처리할 때 사용

---

### Fallback, Receive

소스코드 : [Fallback.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Fallback.sol)

- 사용자가 존재하지 않는 함수를 호출 할 때
- msg.data가 비어있지 않는 경우
- 예시
  - 사용자가 ERC20 토큰을 보내야 하지만 실수로 ETH를 보냈을때 컨트랙트에서 못빼낼 수 있다. 이때 예방차원에서 사용하는 함수
  - Proxy Contract 사용

---

### 상속

소스코드 : [Inherit.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Inherit.sol)

### Override

소스코드 : [Overriding.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Overriding.sol)

- 같은 이름의 함수를 오버라이드 하기 위해선 부모 컨트랙트에 있는 함수에 virtual 키워드를 자식 컨트랙트에 있는 함수에는 override 키워드를 넣어준다.

---

### Super

소스코드 : [Super.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Super.sol)

- Super 키워드를 사용하면 부모 컨트랙트에 접근할 수 있다.

---

### 다중 상속

소스코드 : [MultiInheritance.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/MultiInheritance.sol)

---

### Check Contract

소스코드 : [CheckContract.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/CheckContract.sol)

전달받은 주소가 컨트랙트인지 EOA인지 확인하는 방법

---

### Transfer, Send, Call

소스코드 : [EthTransfer.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/EethTransfer.sol)
이더리움을 전송하는 방법은 3가지가 있으며 return 값에 차이가 있다.

---

### call, delegate call

소스코드 : [Call.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Call.sol)
소스코드 : [DelegateCall.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/DelegateCall.sol)

다른 컨트랙트에 있는 함수 호출하기

데이터 처리를 어디서 하느냐에 따라 구분됨.

call : 외부 컨트랙트 함수를 호출할 때 외부함수에서 인스턴스를 만들어서 함수호출이 진행된다.
delegate call : 외부 컨트랙트 함수를 호출할 때 가져와서 처리를 한다.

---

---

## Openzeppelin 사용하기

---

### SafeMath

소스코드 : [Math.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Math.sol)

- 오버플로우, 언더플로우, 0나누기 등 안정적으로 계산할 수 있도록 도와주는 라이브러리를 가지고 있다.
- 0.4 버전의 솔리디티를 사용하더라도 이러한 유틸 라이브러리와 함께 사용하면 안정적으로 컨트랙트를 작성할 수 있다.

![image](https://user-images.githubusercontent.com/20445415/198817741-b9377828-66bb-414b-8f1d-7915012bbd94.png)

---

### Openzeppelin으로 ERC20 토큰 발행하기

소스코드 : [ERC20.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ERC20.sol)

- Openzeppelin에서 이미 ERC20 관련된 내용을 다 상속하고 있어서 사용자가 쉽게 발행할 수 있다.

---

---

## ERC20 코드 작성하며 살펴보기

---

### ERC20

[ERC20Example.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ERC20Example.sol)

---

### Mint

소스코드 : [Mint.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Mint.sol)

- Mint() : 토큰 추가적으로 발행하기

---

### Burn

[소스코드 : Burn.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Burn.sol)

- Burn() : 토큰 소각하기
  - 사용자의 잔액을 balance에서 없애버리기
  - 사용자의 잔액을 쓸 수 없는 주소로 보내기

---

### 주소를 BlackList로 만들기

소스코드 : [BlackList.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/BlackList.sol)

- mapping으로 black list 주소 저장
- 블랙리스트 주소를 boolean 값으로 설정
- 블랙리스트 주소는 토큰을 전송하지 못하도록 modifier 설정

![image](https://user-images.githubusercontent.com/20445415/198827539-c7a8ed72-5b52-4ac2-94dc-3f4b77f7228d.png)

---

---

## ERC721 코드 작성하며 살펴보기

소스코드 : [ERC721.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ERC721.sol)

---

### Mint

소스코드 : [ERC721Mint.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ERC721Mint.sol)

- 토큰 수량 1개 증가
- 토큰 주인 입력
- 토큰 정보 입력
- 전체 발행량 1개 증가
- mint를 알려주기 위한 event

---

### Burn

소스코드 : [ERC721Burn.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ERC721Burn.sol)

- 해당 토큰의 모든 권한 삭제(초기화)
- 발행량 1개 감소
- 컨트랙트에 등록된 토큰 삭제(초기화)
- 삭제됨을 알려주기 위한 event

---

### Transfer

소스코드 : [ERC721Transfer.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ERC721Transfer.sol)

- 전송을 요청한 사용자 확인
- 토큰에 등록된 권한 모두 삭제
- 요청한 주소의 수량 감소
- 받는 주소의 수량 증가
- 토큰 주인 변경
- 변경됨을 알려주기 위한 event

---

### NFT를 발행하는 방식

- 외부 데이터에 이미지 값을 저장하고 그 주소정보만 토큰에 저장하는 방식

  소스코드 : [ERC721External.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ERC721External.sol)

- 미리 정해진 공급량에서 랜덤한 값을 생성해서 NFT 발행하는 방식

  소스코드 : [ERC721Random.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ERC721Random.sol)

---

---

## Upgradable Contract

### Upgradable Contract 코드 작성하며 이해하기

소스코드 : [Proxy.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Proxy.sol)

소스코드 : [ImplementV1.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ImplementV1.sol)

소스코드 : [ImplementV2.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/ImplementV2.sol)

이미 네트워크에 배포된 컨트랙트는 수정이 불가능하기 때문에 Proxy를 이용하여 컨트랙트 주소값만 바꿔 다른 컨트랙트를 연결할 수 있다.

- fallback을 이용해 Delegate Call을 이용한다.
- Proxy와 Implement에 있는 state값을 동일한 순서, 동일한 값으로 넣어줘야한다.

테스트 진행 방법(Remix IDE)

Proxy 컨트랙트와 변수를 1증가 시킬 수 있는 IncrementationV1, 변수 1을 증가시킬 뿐만 아니라 1을 감소 시킬 수 있는 IncrementationV2를 이용해 실습 진행

- Proxy.sol를 먼저 배포한다.
- ImplementV1.sol 배포
- ImplementV2.sol 배포
- [Proxy] setImplementation에 ImplementV1의 컨트랙트 주소값을 입력값으로 넣고 트랜잭션을 보낸다.
- [ImplementationV1] Increase 함수를 통해 값을 1 증가 시킨 후 트랜잭션에 있는 input 값을 복사해서 [Proxy] Low level interactions CALLDATA에 넣어준다.
- [Proxy] setImplementation에 ImplementV2의 컨트랙트 주소값을 입력값으로 넣고 트랜잭션을 보낸다.
- [ImplementationV2] Decrement 함수를 통해 값을 1 감소 시킨 후 트랜잭션에 있는 input 값을 복사해서 [Proxy] Low level interactions CALLDATA에 넣어준다.

### Openzeppelin으로 구현한 UUPSUpgrdeable

소스코드 : [UUPS_ProxyV1.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/UUPS_ProxyV1.sol)

소스코드 : [UUPS_ProxyV2.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/UUPS_ProxyV2.sol)

---

---

## 외부 컨트랙트 함수 호출하기

소스코드 : [Interface.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Interface.sol)

- 인터페이스를 통해 정의 후 내가 만든 컨트랙트에서 인터페이스를 통해 호출한다.
- Proxy와의 차이점으로는 delegate call이 아닌 단순 call이기 때문에 호출 하고자하는 컨트랙트의 state값을 그대로 가져온다.

---

---

## Offchain Data 가져오기

---

### 외부 데이터를 가져와야 하는 이유

- 블록체인 상에서 신뢰할 수 없거나 안정성을 보장할 수 없을 때 조금더 안전한 환경에서 생성된 값을 가져오는 경우
  - ex. random한 값

[OnchainRandomAttack.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/OnchainRandomAttack.sol)

랜덤한 값을 생성 후 같은 블록 네트워크 안에 있는 다른 컨트랙트로 해당 컨트랙트의 답을 맞추는 코드
![image](https://user-images.githubusercontent.com/20445415/198870227-676a841c-2b37-4998-ae46-671f70cd61e4.png)

> 위 코드로 인하여 문제점을 파악할 수 있음

### Chainlink - External Data

**Random Number 가져오기**

소스코드 : [random_chainlink.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/random_chainlink.sol)
- 위 방법 보다 조금 더 안정적인 방법을 ChainLink에서 제공하고 있다.

[chainlink docs](https://docs.chain.link/docs/vrf/v2/subscription/examples/get-a-random-number/)

[consumer 등록](https://vrf.chain.link/goerli/new)
![image](https://user-images.githubusercontent.com/20445415/198930004-46cc912f-2d07-4ab5-94f6-37df4a5357b3.png)

- Attack 컨트랙트가 체인링크에 새로운 랜덤값을 호출하기 때문에 동일한 값을 찾을 수 없어 공격이 실패하는것을 확인할 수 있다.

---

**외부에서 이더리움 시세 요청하기**

소스코드 : [getprice_chainlink.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/getprice_chainlink.sol)
- chainlink의 AggregatorV3Interface을 이용하여 가져온다.
- 거래소의 평균값을 사용자에게 전달해준다.
- getLatesPrice() : priceFeed에 설정되어 있는 주소로 가서 저장되어 있는 실제 가격정보를 가져온다.
![image](https://user-images.githubusercontent.com/20445415/198946900-1aa656bd-3953-4716-af88-0ca83d5c1f7a.png)


