/* By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms. */

var previous = 1;
var current = 2;
var holder = 0;
var result = 0;

while(current < 4000000){
    if(current % 2 === 0){
        result += current;
    }
    holder = current;
    current += previous;
    previous = holder;
}
console.log(result);
