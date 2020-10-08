//var func = function(){}

// 화살표 (arrow function) (ES6 도입)
//  const, let 으로 시작

const add = (a, b) => {
    return a + b
}

let sum = add(1, 2)
console.log(`sum = ${sum}`)

const sayHello = name => {
    console.log(`Hello, ${name}!`)
}

sayHello('캡틴아메리카')

// return 값이 있는 화살표 함수는 
// return 생략하고 간략하게 정의 가능

const mul = (a, b)  => a * b
console.log(`mul(2, 7) = ${mul(2, 7)}`)