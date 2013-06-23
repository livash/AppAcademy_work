function twoSum(array) {
	var resArray = [];
	for(var i = 0; i < array.length - 1; i++) {
		for(var j = i + 1; j < array.length; j++) {
			if ((array[i] + array[j]) === 0) {
				var pair = [i, j];
				resArray.push(pair);
			}
		}
	}
	
	return resArray;
}

console.log(twoSum([5,1,-7,-5]));
console.log(twoSum([5,-1,-5,1]));
console.log(twoSum([0, 1, 2, 0]));