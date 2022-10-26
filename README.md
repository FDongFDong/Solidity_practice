# solidity_practice
[Compile](#Compile)
[값 변경](#값-변경)
[자료형](#Value-자료형)
[Operation](#Operation)
[Function](#Function)
[Visibility](#Visibility)
[Version 차이](#Version)

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

[First](https://github.com/FDongFDong/solidity_practice/blob/main/contracts/First.sol)

값을 변경하려면 함수를 사용하여 값을 변경해야한다.

---

## Value 자료형

()[Data]
- 자료형에도 int8, int32, int256 등 값이 다양하다.
가스비를 효율적으로 사용하기 위함
- float형이 없다.

---

## Operation

()[Operation]

---

## Function

()[Function]

- state 값을 변경 시키는 경우
  - 트랜잭션을 발생시켜 가스비를 소모한다.
  - 변경이 일어난 경우 모든 노드가 실행을 해서 검증을 해야하기 때문에 트랜잭션을 발생시킨다.
- state 값을 변경 시키지 않는 경우
  - State 값을 바꾸지 않는 기능은 트랜잭션을 발생시키지 않는다.
  - 단순히 값을 꺼내와서 사용자에게 보여주기 때문이다.

---

## Visibility

()[FunctionVisiblilty]

- private : 외부 공개 x, 상속된 컨트랙트 x, 내부에서 o
- internal : 외부 공개 x, 상속된 컨트랙트 o, 내부에서 o
- public : 외부 공개 o, 상속된 컨트랙트 o, 내부에서 o
- external : 외부 공개 o, 상속된 컨트랙트 x, 내부에서 x

## Version

()[Version4]
()[Version8]
Version 4, Version 8 오버플로우 처리 방법이 서로 다르다.

- Version4에서는 2^8 - 1에 +1을 더하면 0이 된다.
- Version8에서는 에러를 일으킨다.
