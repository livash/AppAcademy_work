function fibs(num) {
	if (num === 0) { return [] };
	if (num === 1) { return [0] };
	if (num === 2) { return [0,1] };
	
	var result = fibs(num - 1);
	var last = fibs(num - 1)[fibs(num - 1).length - 1];
	var secondLast = fibs(num - 1)[fibs(num - 1).length - 2];
	var len = result.length;
	result[len] = (last + secondLast);
	return result;
};

console.log(fibs(0));
console.log(fibs(1));
console.log(fibs(2));
console.log(fibs(3));
console.log(fibs(4));
console.log(fibs(10));
