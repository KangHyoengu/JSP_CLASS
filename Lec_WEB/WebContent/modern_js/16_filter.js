// filter(함수)
//  특정 조건을 만족하는 원소들만으로 새로운 배열 생성
// 매개변수인 함수를 true/false 를 리턴해야 한다

let todos = [
    {
      id: 1,
      text: "자바스크립트 입문",
      done: true
    },
    {
      id: 2,
      text: "함수 배우기",
      done: true
    },
    {
      id: 3,
      text: "객체와 배열 배우기",
      done: true
    },
    {
      id: 4,
      text: "배열 내장함수 배우기",
      done: false
    }
  ];

  //done 값이 false인 것들만 뽑아내기

  //forEach문 사용
  let result = []
  todos.forEach(item => {
      if(!item.done){
          result.push(item)
      }
  })

  console.log(result)

  //filter(함수) 사용
  //매개변수의 함수는 각 원소에 대해
  //참, 거짓만 판명하여 리턴
  //결국 '참'인것만 담긴 결과 내용
  result = todos.filter(e => e.done === false)
  console.log(result)

  result = todos.filter(e => !e.done)
  console.log(result)

  