const dog = {
    name: "멍멍이",
    sound: "멍멍!"

        //객체안의 함수 정의하는 다양한 방법들

        //방법1
        ,
    say1: function aaa() {
            console.log(`say1: ${this.sound}`)
        }

        //방법 1-2
        ,
    say2: function () {
            console.log(`say2: ${this.sound}`)
        }

        //방법2 : 최신 JS 방식 (추천)
        ,
    say3() {
        console.log(`say3: ${this.sound}`)
    }

    // 이유
    // function 키워드로 만든 함수에서의 this는
    // 자기가 속해있는, 객체를 가리키는데..
    // 화살표 함수의 경우
    // this를 자기가 속해 있는 곳으로
    // 연결하지 않습니다.
    // 화살표 함수는 this 가 뭔지 모릅니다!
    ,
    say4: () => {
        console.log(`say4: ${this.sound}`)
    }
}

dog.say1()
//dog.aaa() 이런 함수 없다.

dog.say2()
dog.say3()
dog.say4()

const cat = {
    name: "야옹이",
    sound: "야용~"
};
cat.say1 = dog.say1;


console.log()
dog.say1(); //이때 this는 dog에 연결
cat.say1(); //이때 this는 cat에 연결

const catSay = cat.say1
catSay(); //this에 연결된게 없다. undefined