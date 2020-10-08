// map, filter, reduce

//mapping
//ex) 주어진 데이터의 값들을 *2한 결과 만들기
//[11, 12, 13, 14, 15] n개의 데이터
// ↓   ↓   ↓   ↓   ↓       * 2
//[22, 24, 26, 28, 30] n개의 데이터


//filter : n -> n>=
//ex) 주어진 데이터에서 3의 배수로만 구성된 결과 만들기
//[11, 12, 13, 14, 15] n개의 데이터
//     ↓           ↓
//[    12,         15] 

//reduce : n -> 1
//ex) 주어진 데이터의 합을 구하시오
//[11, 12, 13, 14, 15] n개의 데이터
//         ↓
//         65


//map() 함수
// 배열 안의 원소들을 변환할때 사용

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9];

// 위 배열의 모든 원소를 제곱한 새로운 배열을 만드려면?
let squared = []

//forEach문 사용
array.forEach(element => {
    squared.push(element * element)
})

console.log(squared)

console.log()
const square = n => n * n //함수정의
squared = array.map(square)
console.log(squared)

// 예
// map() 사용하여 object의  value 만 뽑아내기
let items = [
    {
      id: 1,
      text: "hello"
    },
    {
      id: 2,
      text: "bye"
    }
  ];

console.log(items.map(item => item.text))