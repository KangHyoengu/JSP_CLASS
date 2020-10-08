const value = "hello!"  //Global scope

function myFunction(){
    console.log("myFunction: ")
    console.log(value)
}

myFunction()

function otherFunction(){
    console.log("otherFunction: ")
    //console.log(value) //에러 : const value는 block scope
    //const value = "bye" 

    // console.log(value)
    // let value = "bye"

    console.log(value)
    var value = "bye"
    console.log(value)
}

otherFunction()