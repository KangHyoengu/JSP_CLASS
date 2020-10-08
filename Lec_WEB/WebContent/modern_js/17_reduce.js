/*
reduce
reduce 함수는 잘 사용 할 줄 알면 정말 유용한 내장 함수입니다. 

 reduce(함수)
 reduce(함수, 초깃값)

 위 함수는
 (accumulator, current) => 누적계산결과
 (accumulator, current, index, array) => 누적계산결과
     - index: 현재 current 가 몇번째 인지 
     - array: 함수를 실행하는 배열 자신 

만약 여러분이 주어진 배열에 대하여 총합을 구해야 하는 상황이 왔다고 가정해봅시다.

이렇게 구현을 할 수 있을텐데요
*/

// 기존에 배웠던 방법대로 한다면
let numbers = [1, 2, 3, 4, 5];

//forEach
let sum = 0;
numbers.forEach(n => {
    sum += n
})

console.log('sum = ',sum)

//resuce() 사용
sum = numbers.reduce((acc, cur) => acc+ cur)
    //function(acc, cur) { return acc + cur }
console.log('sum = ',sum)

// [1, 2, 3, 4, 5]
//   ↘↓
// [   3, 3, 4, 5]
//      ↘↓
// [      6, 4, 5]
//         ↘↓
// [        10, 5]
//            ↘↓
// [           15]

//초기값

sum = numbers.reduce((acc, cur) => acc+ cur, 0)
console.log('sum = ',sum)

// [0, 1, 2, 3, 4, 5]   초깃값 0 부터 시작
//   ↘↓
// [   1, 2, 3, 4, 5]
//      ↘↓
// [      3, 3, 4, 5]
//         ↘↓
// [         6, 4, 5]
//            ↘↓
// [           10, 5]
//               ↘↓
// [               5]
console.log()
console.log('reduce가 진행되는 중간과정 확인해보기')
sum = numbers.reduce((acc, cur, index, array) => {
    console.log(`acc=${acc} cur=${cur} index=${index} array=${array}`)
    return acc + cur
}, 0)

console.log('sum = ',sum)

//resuce를 사용하여 평균값 구하기
//TODO
let avg = 0;
avg = numbers.reduce((acc, cur, index) => {
    if(index === numbers.length-1){
        return (acc+cur)/numbers.length
    }
    return acc + cur
}, 0)

console.log('avg = ',avg)

//reduce : n -> 1
//각각의 원소에 *2 를 한 배열 구하기

let result = numbers.reduce((acc, cur) => {
    acc.push(cur * 2)
    return acc
}, [])

console.log('result = ', result)

// [1, 2, 3, 4, 5]  n개의 데이터로부터
// --> [ 2, 4, 6, 8, 10 ]  라는 1개의 '배열' 데이터 생성
 
 
// 중간과정 보기
result = numbers.reduce((acc, cur, index, array) => {
  console.log(`acc=${acc} cur=${cur} index=${index} array=${array}`)
  acc.push(cur * 2)
  return acc
  }, 
  []
)
console.log(result)

//reduce() 강력하다
//n -> 1, n -> n', n -> m
