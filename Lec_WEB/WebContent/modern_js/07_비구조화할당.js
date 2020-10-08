// ES6 에 있는
// '비구조화할당 (destructuring assigment)문법'을 사용하면
// 객체변수.속성  <-- 좀더 편리하게 다룰수 있다.
// '비구조화할당 문법'
//   다른말로 '객체 구조 분해'

// 공식
// https://www.ecma-international.org/ecma-262/6.0/#sec-destructuring-assignment
// https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
// 추가 참조
// https://velog.io/@public_danuel/destructuring-assignment

// 비구조화 할당, 잘 사용하면 코드 깔끔해진다

const ironMan = {
    name: "토니 스타크",
    actor: "로버트 다우니 주니어",
    alias: "아이언맨"
};

const captainAmerica = {
    name: "스티브 로저스",
    actor: "크리스 에반스",
    alias: "캡틴 그놈"
};

//객체(object)를 매개변수로 받기
function print(hero){
    const{alias, name, actor} = hero;

    let txt = `${alias}(${name}) 역할을 맡은 배우는 ${
        actor
    }입니다.`

    console.log(txt);
}

print(ironMan);
print(captainAmerica);
console.log();

function print2({alias, name, actor}){
    let txt = `${alias}(${name}) 역할을 맡은 배우는 ${
        actor
    }입니다.`

    console.log(txt);
}

print2(ironMan);
print2(captainAmerica);

console.log()
const {actor, name} = ironMan;
console.log(`배우 : ${actor}, 이름 : ${name}`);