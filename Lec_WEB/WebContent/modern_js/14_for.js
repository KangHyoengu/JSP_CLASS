/*
  JS 는 for 가 복잡하게 많다.
    1. for()
    2. for...in 사용 : 'property(key/인덱스)' 를 반복한다.  주로 '객체(object)' 에 사용
    3. for...of 사용 : '값' 을 반복한다.  (ES6 등장)
        iterable 한 객체에 사용 (Array, Map, Set, String, TypedArray, arguments 객체 등을 포함)
        iterable 한 객체?  (크게 두가지)
            a. iterable 한 프로토콜을 자체적으로 내장한 객체들
                ex) 배열
            b. 커스텀하게 iterable 한 프로토콜을 가지게 설계한 객체들
        https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Statements/for...of


    4. 배열.forEach(함수) : 주어진 함수를 배열요소 각각에 대해 실행
        https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach
*/

// 주어진 배열의 값을 x 2 한 배열 만들기
const data = [10, 20, 30, 40, 50]
const len = data.length
const doggy = {
    name: "흰둥이",
    sound: "멍멍",
    age: 2
}
let i, v

//1.for() 사용
let result = []
for(i = 0; i< len; i++){
    result.push(data[i] * 2)
}

console.log(result)

//2. for ... in : property/index를 순환한다.
result = []
for(i in data){
    result.push(data[i] * 2)
}

console.log(result)

for(key in doggy){
    console.log(`${key}: ${doggy[key]}`)
}

//3. for ... of : 값을 순환한다.
result = []
for(v of data){
    result.push(v * 2)
}

console.log(result)

//iterable한 객체에 대해서 순환 가능
let iterable1 = "boo"
for(let ch of iterable1){
    console.log(ch)
}

//DOM객체에도 사용 가능
//.getElementsByTagName()

//4. 배열.forEach(함수) : 주어진 함수를  배열요소 각각에 대해 실행
result = []
data.forEach(element => {
    result.push(element * 2)
})
console.log(result)

result = []
function doubleUp(e){result.push(e * 2)}
data.forEach(doubleUp)
console.log(result)

//object의 key만 추출
console.log(Object.keys(doggy))

//object의 valueㅁ나 추출
console.log(Object.values(3+
    
    doggy))

//[key, value]쌍의 배열 형태 추출
console.log(Object.entries(doggy))

//for ... in vs. for ... of

for(const i of [1,2,3]){
    console.log('i = ', i)
}

console.log()
//for ... in의 문제점

for(const i in {a: 1, b: 2, c: 3}){
    console.log('i = ',i) //일단은 결과가 잘 나온다. a, b, c
}

// 마치 {a: 1, b: 2, c: 3} 안에 있는 a,b,c 만 나오는 듯하지만

// prototype 에 있는 것도 나올수 있기 때문에
// 의도치 않은 결과를 내뱉을수도 있다.
// (런타임 환경에 따라서 for..in.. 은 다르게 동작할수 있다)

//ex
Object.prototype.test = function(){}
console.log()

for(const i in {a: 1, b: 2, c: 3}){
    console.log('i = ',i) //a, b, c 뿐만 아니라 test까지 나온다.
}