//-------------------------------------------------
// symbol
// ES6 부터 출현
// https://developer.mozilla.org/ko/docs/Glossary/Symbol

// '고유'한 값을 만들어낼때 사용


const a = Symbol() //new를 정대로 사용하면 안된다!
const b = Symbol(37) //Symbol(매개변수)
const c = Symbol('Mark')
const d = Symbol('Mark')

console.log('a = ',a,typeof a)
console.log('a = ',b,typeof b)
console.log('a = ',c,typeof c)
console.log('a = ',d,typeof d)

console.log(c === d) //false
//c, d는 같은것이 아니다!
//같은 인자로 생성되었어도
//고유한 객체로 만들어진다.