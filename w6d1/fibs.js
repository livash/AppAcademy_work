// Fibonacchi numbers
//this function prints first 'num' numbers
// of the Fibonacchi sequence

function fibs(num) {
	if (num === 1) { return [0]; };
	if (num === 2) { return [0,1]; };
	var result = fibs(num-1);
	
	var last = result.length - 1;
	
	var secondToLast = result.length - 2;
	
	result.push(result[last] + result[secondToLast]);
	return result;
}

console.log(fibs(1));
console.log(fibs(2));
console.log(fibs(3));
console.log(fibs(100));