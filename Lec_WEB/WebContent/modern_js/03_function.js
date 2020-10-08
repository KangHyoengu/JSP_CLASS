function add(a, b){
    console.log("a = ",a, ", b = ",b);
    return a+b;
}

let sum = add(1, 2);
console.log("sum = ",sum);

sum = add(10, 20, 30);
console.log("sum = ",sum);

sum = add(10);
console.log("sum = ",sum);

console.log("-- 프로그램 종료 --");