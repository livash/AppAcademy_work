
function mergeSort(arr) {
	console.log("sorting...")
	if(arr.length === 0 || arr.length === 1) { return arr; }
	var last = arr.length - 1;
	var middle = Math.floor(last / 2);
	var left = arr.slice(0, middle + 1);
	var right = arr.slice(middle + 1, last);

	right.push(arr[last]);
	
	var rightRec = mergeSort(right);
	var leftRec = mergeSort(left);
	
	var result = merge(leftRec, rightRec);
	return result;
}

function merge(arr1, arr2) {
	console.log('merging.....');
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
	console.log(res);
	return res;
}

arr = [5,4,3,2,1];
console.log(mergeSort(arr));