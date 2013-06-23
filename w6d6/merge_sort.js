var count = 0;
function mergeSort(arr) {
	count += 1;
	console.log("sorting counter ....." + count);
	console.log(arr);
	if (arr.length === 1 || arr.length === 0) { return arr; }
	var first = 0;
	var last = arr.length - 1;
	var middle = Math.floor((last - first) / 2);
	console.log("middle idx = " + middle);
	var left = arr.slice(first, middle + 1)
	console.log("left");
	console.log(left);
	var right = arr.slice(middle + 1, last);
	right.push(arr[last]);
	console.log("right");
	console.log(right);
	var leftRes = mergeSort(left);
	var rightRes = mergeSort(right);
	
	// leftRes = left;
	// rightRes = right; 
	
	var result = merge(leftRes, rightRes);
	
	return result;
}

function merge(arr1, arr2) {
	console.log("merging .....");
	console.log (arr1, arr2);
	var res = [];
	while (arr1.length > 0 || arr2.length > 0) {
		
		if (arr1.length === 0 && arr2.length > 0) {
			console.log("here1");
			res=res.concat(arr2);
			arr2 = [];
		} else if (arr2.length === 0 && arr1.length > 0) {
			console.log("here2");
			res=res.concat(arr1);
			arr1 = [];
		} else {
			if (arr1[0] < arr2[0]) {
				var num = arr1.shift();
				res.push(num);
			} else {
				var num = arr2.shift();
				res.push(num);
			}
		}
	}
	
	
	console.log(res);
	return res;
}


arr = [5,4,3,2,1,6,7];
console.log(arr);
console.log(mergeSort(arr));

// var result = [];
// function merge(arr1, arr2) {
// 	console.log("merging .....")
// 	if (arr1.length === 0) {
// 		result.concat(arr2);
// 	} else if (arr2.length === 0) {
// 		result.concat(arr1);
// 	}
// 	while (arr1.length > 0 && arr2.length > 0) {
// 		if (arr1.length === 0) {
// 			result.concat(arr2);
// 		} else if (arr2.length === 0) {
// 			result.concat(arr1);
// 		} else {
// 			if(arr1[0] > arr2[0]) {
// 				var num = arr2.shift();
// 				result.push(num);
// 			} else {
// 				var num = arr1.shift();
// 				result.push(num);
// 			}
// 		}
// 	}
// 	return result;
// }


// arr1 = [3,4,5];
// arr2 = [1,2,6];
// console.log(merge(arr1, arr2));

// function dup(array) {
// 	var resArr = [];
// 	for(var i = 0; i < array.length; i++) {
// 		resArr. push(array[i]);
// 	}
// 	
// 	return resArr;
// }

