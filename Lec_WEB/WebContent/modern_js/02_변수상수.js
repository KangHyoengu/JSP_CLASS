//변수 선언
var v1 = 100;
console.log("v1 = ",v1);

v2 = 200;
console.log("v2 = ",v2);

var v1 = 300;
console.log("v1 = ",v1);

//var는 오늘날 js에서는 그닥 권장하지 않습니다.

//변수선언 let
//상수선언 const
//ES6부터 사용 가능. (IE9, IE10과 같은 구형 브라우저는 지원 안함)

let value = 177;
console.log("value = ",value);

//let value = 277; 동일한 이름의 변수 선언 불가

value = 277;
console.log("value = ",value);

let value2;
console.log("value2 = ",value2);

//console.log("value3 = ",value3) 정의되지 않은 변수 사용 불가

//상수 선언
const c1 = 1;
console.log("c1 = ",c1);

//c1 = 2; 상수값 변경 불가

console.log("-- 프로그램 종료 --");