function fibs(num) {
	if (num === 0) { return []; }
	if (num === 1) { return [0]; }
	if (num === 2) { return [0, 1]; }
	
	var resArray = fibs(num - 1);
	var last = resArray[resArray.length - 1];
	var secondLast = resArray[resArray.length - 2];
	resArray.push(last + secondLast);
	return resArray;
}

console.log(fibs(1));
console.log(fibs(2));
console.log(fibs(6));