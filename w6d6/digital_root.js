function digitalRoot(num) {
	var digArr = [];
	var decimal = Math.floor(num/10);
	var remainder = num % 10;
	digArr.push(remainder);
	var stepArr = step(decimal);
	array = digArr.concat(stepArr);
	var sum = calcSum(array);
	if (sum > 9) {
		var res = digitalRoot(sum);
		return res;
	} else {
		return sum;
	}
	
}

function step(decimal) {
	var digitsArr = [];
	while (decimal > 9) {
		var rem = decimal % 10;
		digitsArr.push(rem);
		decimal = Math.floor(decimal / 10);
	}
	digitsArr.push(decimal);
	return digitsArr;
}

function calcSum(array) {
	var sum = 0;
	for(var i = 0; i < array.length; i++) {
		sum += array[i];
	}
	return sum;
}
console.log(digitalRoot(9));
console.log(digitalRoot(12));
console.log(digitalRoot(4322));