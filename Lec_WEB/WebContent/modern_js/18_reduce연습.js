// reduce 응용
// 도전!
// 배열안의 알파벳은 각각 몇개가 있을까?
let alphabets = ["a", "a", "a", "b", "c", "c", "d", "e"];
// 결과 => { a: 3, b: 1, c: 2, d: 1, e: 1 }
// 힌트 alphabets.reduce() 사용;

let result = alphabets.reduce((acc, cur) => {
    if(acc[cur] === undefined){
        acc[cur] = 1
    } else {
        acc[cur] = acc[cur] + 1
    }
    return acc 
}, {})

console.log(result)