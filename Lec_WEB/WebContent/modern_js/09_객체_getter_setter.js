/* object 의 getter, setter
 
getter 함수: 특정 값을 조회할때마다
setter 함수: 특정 값을 설정할때마다
 
https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Functions/get
 
ES 5.1 에 최초 정의
https://www.ecma-international.org/ecma-262/5.1/#sec-11.1.5
 
ES 6 에서 계산된 프로퍼티 이름이 추가
https://www.ecma-international.org/ecma-262/6.0/#sec-method-definitions
 
 
JS 에서 매우 유용
 
*/
 
const numbers = {
    a: 1
    ,b: 2

    //getter 함수
    ,get sum(){
        //get 키워드로 시작
        console.log(`sum() getter가 실행됩니다.`)
        //반드시 무엇인가 이천해주어야 한다.
        return this.a + this.b;

        //return이 빠지면 undefined 리턴
    }
}

//getter 함수는 아래와 같이 '조회'
//해당 코드가 수행된다.
console.log(numbers.sum);
//console.log(numbers.sum()); 에러! 함수가 아니다!

numbers.b = 5
console.log(numbers.sum)

const dog = {
    _name: '멍멍이'

    //setter 함수
    //반드시 parameter가 설정 되어야 한다.
    ,set name(value){
        console.log(`이름이 바뀝니다.. ${value}`)
        this._name = value
    }
}

console.log(dog._name)

//setter는 값 변경, 대입하는 동작에서 호출
dog.name = "치와와" //setter name() 호출
console.log(dog._name)

const numbers2 = {
    _a: 1
    ,_b: 2
    ,sum: 3

    ,calcultate(){
        console.log("calculate() 호출")
        this.sum = this._a + this._b;
    }

    ,get a(){return this._a}
    ,get b(){return this._b}

    ,set a(value){
        this._a = value;
        this.calcultate();
    }
    ,set b(value){
        this._b = value;
        this.calcultate();
    }
}

console.log(numbers2.sum)
numbers2.a = 5; //setter 호출
numbers2.b = 7; //setter 호출

console.log(numbers2.sum)
//numbers2.calcultate()
console.log(numbers2.sum)

const numbers3 = {
    _a: 1
    ,_b: 2

    ,get sum(){
        console.log("sum() getter 호출")
        return this.a + this.b
    }

    ,set a(value){
        this._a = value
    }

    ,set b(value){
        this._b = value
    }
}

console.log()
console.log(numbers3.sum) //sum조회 할때마다 매번 계산
numbers3.a = 5;
numbers3.b = 7;
console.log(numbers3.sum)
