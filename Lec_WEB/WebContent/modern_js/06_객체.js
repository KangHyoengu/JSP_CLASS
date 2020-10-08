//object (객체)

//property : value 쌍
//(key : value 라고도 함)

const dog = {
    name: "댕댕이"
    ,age : 2
    ,"isCute": true
    ,"key with space": "hahaha" //이러한 key 가능 공백 포함!
}

console.log(`이름은 ${dog.name}\n나이는 ${dog.age}`)
console.log(`이쁘냐? ${dog.isCute}`)
//console.log(`이쁘냐? ${dog[isCute]}`) error
console.log(`이쁘냐? ${dog['isCute']}`)
console.log(`뭥미? ${dog['key with space']}`)

const cap = {
    name: "스티브 로져스"
    , actor: "크리스 에반스"
    , alias: "캡틴 그놈"
}

const print = hero => {
    let txt = `${hero.alias}(${hero.name}) 역할을 맡은 배우는 ${
        hero.actor
    }입니다.`

    console.log(txt);
}

print(cap)