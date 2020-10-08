/*
퀴즈
이제 지금까지 배운 것들을 활용하여 퀴즈를 풀어봅시다!
숫자 배열이 주어졌을 때 
10보다 큰 숫자의 갯수를 반환하는 함수를 만드세요.
*/
data = [1, 2, 3, 5, 10, 20, 30, 40, 50, 60]
// 결과 -> 5


//TODO : forEach
console.log("--forEach--")
let result = 0
data.forEach(element => {
    if(element > 10){
        result++
    }
});

console.log('result = ', result, '\n')

//TODO : filter
console.log("--filter--")
result = data.filter(e => e > 10).length
console.log('result = ', result, '\n')

//TODO : reduce
console.log("--reduce--")
result = data.reduce((acc, cur) =>{
    if(cur > 10){
        acc.push(cur)
    }
    return acc
},[]).length

console.log('result = ', result)