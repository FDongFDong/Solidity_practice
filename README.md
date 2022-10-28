# solidity_practice

- [solidity_practice](#solidity_practice)
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
    - [goerli Test Net](#goerli-test-net)
  - [Transaction Property](#transaction-property)
  - [Modifier](#modifier)
  - [Require](#require)
  - [Assert](#assert)
  - [Revert](#revert)
  - [Try-Catch](#try-catch)
  - [CustomError](#customerror)
  - [Fallback, Receive](#fallback-receive)

---

1. Contract 파일 작성
2. (컴파일) -> Output: EVM 바이트코드, ABI
3. (배포) -> 이더리움 클라이언트

= 배포도 트랜잭션이다.

## Compile

컴파일 시 Contract의 Bytecode와 ABI가 출력된다.

- bytecode: 스마트 컨트랙트를 16진수로 표현한 것
- ABI(Application Binary Interface): 스마트 컨트랙트의 함수와 파라미터에 대한 메타데이터를 정의해 컨트랙트의 객체를 만들고 컨트랙트에 정의된 함수를 호출할 수 있도록 하는 인터페이스

SmartContract

1. 접근 방법
   - 터미널(ssh)
   - 브라우저(JSON-RPC)
2. EVM 바이트코드에 연결

---

## 값 변경

[First.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/First.sol)

값을 변경하려면 함수를 사용하여 값을 변경해야한다.

---

## Value 자료형

[Data.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Data.sol)

- 자료형에도 int8, int32, int256 등 값이 다양하다.
  가스비를 효율적으로 사용하기 위함
- float형이 없다.

---

## Operation

[Operation.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Operation.sol)

---

## Function

[Function.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Function.sol)

- state 값을 변경 시키는 경우
  - 트랜잭션을 발생시켜 가스비를 소모한다.
  - 변경이 일어난 경우 모든 노드가 실행을 해서 검증을 해야하기 때문에 트랜잭션을 발생시킨다.
- state 값을 변경 시키지 않는 경우
  - State 값을 바꾸지 않는 기능은 트랜잭션을 발생시키지 않는다.
  - 단순히 값을 꺼내와서 사용자에게 보여주기 때문이다.

---

## Visibility

[FunctionVisiblilty.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Function.sol)

- private : 외부 공개 x, 상속된 컨트랙트 x, 내부에서 o
- internal : 외부 공개 x, 상속된 컨트랙트 o, 내부에서 o
- public : 외부 공개 o, 상속된 컨트랙트 o, 내부에서 o
- external : 외부 공개 o, 상속된 컨트랙트 x, 내부에서 x

---

## Version

[Version4.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Function.sol)
[Version8.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Version8.sol)

Version 4, Version 8 오버플로우 처리 방법이 서로 다르다.

- Version4에서는 2^8 - 1에 +1을 더하면 0이 된다.
- Version8에서는 에러를 일으킨다.

---

## Struct

[Struct.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Struct.sol)
사용자 자료형을 다루기 위해 사용

---

## Enum

[Enum.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Enum.sol)
주로 상태값을 처리하기 위해 사용

---

## Array

[Array.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Array.sol)

delete 의 경우 해당 인덱스가 사라지지 않고 0으로 변한다.

---

## Mapping

[Mapping.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Mapping.sol)

- key값은 중복되지 않는다.
  - 동일한 key 값을 넣었을 때 업데이트 된다.

---

## Variable Range

[VariableRange.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/VariableRange.sol)

- 전역변수로 만든 데이터는 Storage에 저장된다.
- 함수 내부에 생성한 데이터는 Memory에 저장된다.

---

## Address

[Address.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/Address.sol)

- 체크섬이 완료되서 대소문자가 규칙성에 맞게 정상적으로 반영된 것만 사용할 수 있다.
- 이더리움을 주고 받는 주소나 EOA같은 경우에는 payable을 명시해줘야지만 전송이 가능하다.

---

## This

[This.sol](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/This.sol)
this 키워드는 자기 자신 컨트랙트를 지칭한다.

---

## If Else

[IfElse.sol]()

- If
- If - else
- If - else if - else

---

## Loop

[Loop.sol]()

- For
- While
- Do While

---

## Block Property

[BlockProperty.sol]()
[BlockProperty2.sol]()

---

### goerli Test Net

![image](https://user-images.githubusercontent.com/20445415/198577384-03db8955-0ea9-469a-920e-3841e45e627e.png)

---

## Transaction Property

[TransactionProperty.sol]()
[TransactionProperty2.sol]()

---

## Modifier

[Modifier.sol]()

- 중복으로 사용되는 조건을 체크할 수 있다.

## Require

[Require.sol]()

- Error 구문을 출력할 수 있다.

## Assert

[Assert.sol]()

- Require문과 달리 단순히 조건만 체크할 때 사용한다. Error 구문을 출력하지 못함.
- 조건이 성립하지 않을 때는 스마트 컨트랙트에서 Error을 발생시키고 트랜잭션으로 인해 변경된 state를 rollback시키고 사용자가 제공한 gas price를 되돌려준다.

## Revert

[Revert.sol]()

- 무조건 Error를 발생시키고 State를 Rollback한다.
- Error 구문을 출력할 수 있다.

## Try-Catch

[TryCatch.sol]

- 일반적으로 사용할 수 없으며 다른 함수를 호출했을 경우에만 사용할 수 있다.

## CustomError

[CustomError]()

- 중복적인 Error을 처리할 때 사용

## Fallback, Receive

[Fallback.sol]()

- 사용자가 존재하지 않는 함수를 호출 할 때
- msg.data가 비어있지 않는 경우
- 예시
  - 사용자가 ERC20 토큰을 보내야 하지만 실수로 ETH를 보냈을때 컨트랙트에서 못빼낼 수 있다. 이때 예방차원에서 사용하는 함수
  - Proxy Contract 사용
