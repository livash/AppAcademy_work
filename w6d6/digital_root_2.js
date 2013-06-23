function digitalRoot(num) {
	var numStr = String(num);
	var numArray = numStr.split('');
	var sum = step(numArray);
	if (sum > 9) {
		var res = digitalRoot(sum);
		return res;
	} else {
		return sum;
	}
}

function step(numStrArray) {
	numArray = [];
	for(var i = 0; i < numStrArray.length; i++) {
		var number = parseInt(numStrArray[i]);
		numArray.push(number);
	}
	var sum = calcSum(numArray);
	
	return sum;
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