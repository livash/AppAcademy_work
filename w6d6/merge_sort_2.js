var count = 0;
function mergeSort(arr) {
	if(arr.length === 1 || arr.length === 0) { return arr; }
	count += 1;
	// console.log("sorting.....");
// 	console.log("conter = " + count);
	var last = arr.length - 1;
	var middle = Math.floor(last / 2);
	
	var left = arr.slice(0, middle + 1);
	var right = arr.slice(middle + 1, last);
	right.push(arr[last]);

	
	var leftRes = mergeSort(left);
	var rightRes = mergeSort(right);
	
	var res = merge(leftRes, rightRes);
	
	return res;
}

function merge(arr1, arr2) {
	// console.log("merging.......");
	var res = [];
	while (arr1.length > 0 && arr2.length > 0) {
		if (arr1[0] < arr2[0]) {
			var num = arr1.shift();
			res.push(num);
		} else {
			var num = arr2.shift();
			res.push(num);
		}
	}
	res = res.concat(arr1);
	res = res.concat(arr2);
	return res;
}

arr = [5,4,3,2,1];
console.log(arr);
console.log(mergeSort(arr));