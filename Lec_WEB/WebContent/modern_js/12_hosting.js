function hello1(){
    console.log("hello1")
}

hello1()

hello2()
function hello2(){
    console.log("hello2")
}

//변수의 경우
//1)
//console.log('val_1 = ',val_1)

//2)
console.log("val_2 = ",val_2) //undefined, 아래의 선언이 올라온다.
var val_2

//3)
console.log('val_3 = ',val_3) //undefined, 아래의 선언이 올라온다. 그러나 값이 대입되기 전
var val_3 = 10
console.log('var_3 = ',val_3)

//4)
val_4++
console.log('val_4 = ',val_4)
var val_4 = 20

//--------------------------------------------------------------------------------------

/*
    변수(함수) 선언이 위로 올라오는 증상   
    이러한 현상을 hoisting 이라 하며, 
   

   hoising 
     아래에 있는 '선언'을(만) 끌어올린다.

   hoising 때문에 동작의 오류처럼 보이는 증상 겪게 됨

   Hoisting
    https://developer.mozilla.org/ko/docs/Glossary/Hoisting

    'hoising' 현상은 JavaScript 처음부터 있어왔던 증상이다.
    그러나, 위 'hoisting' 이라는 용어 자체는 
    ES2015(ES6) 이전에는 사용되지 않았음
*/

/*
    var 는 hoisting 발생  → 많은 혼란을 야기 시켰다.
    let, const 는 hoisting 이 발생 안한다.
*/

console.log()

function myFunction3(){
    const value = "bye"

    if(true){
        const value = "world"
        console.log("block scope")
        console.log(value)
    }

    console.log(value)
}

myFunction3()

console.log()
function myFunction4(){
    var value = "bye"

    if(true){
        var value = "world"
        console.log("function scope")
        console.log(value)
    }

    console.log(value)
}

myFunction4()

//var는 hosting 발생 -> 많은 혼랑을 야기 시켰다.
//let, const는 hosting이 발생 되지 않는다.

{
    console.log(`name = ${name}`)
    name = "Mark"
    console.log(`name = ${name}`)
    var name
}

//let, const를 써야해는 이유
//1. block scope이기에
//2.hosting을 발생 안시키기에