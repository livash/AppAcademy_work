function factors(num) {
	var resArr = []
	for(var i = 0; i <= num; i++) {
		if ((num % i) === 0) {
			resArr.push(i);
		}
	}
	return resArr;
}

console.log(factors(10));
console.log(factors(13));