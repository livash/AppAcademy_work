var array = [5,4,3,2,1];

var bubbleSort = function(array) {
	var notSorted = true;
	while(notSorted) {
		notSorted = false;
		for (var ii = 0; ii < (array.length - 1); ii++) {
			if (array[ii] > array[ii + 1]) {
				var temp = array[ii];
				array[ii] = array[ii + 1];
				array[ii + 1] = temp;
				notSorted = true;
			} 
		}
	}
	return array;
};
console.log("before sorting");
console.log(array);
console.log("after sorting");
console.log(bubbleSort(array));