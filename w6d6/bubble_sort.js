function bubSort(arr) {
	var array = dup(arr);
	console.log("dupped arr = " + array);
	var notSorted = true;
	while(notSorted) {
		notSorted = false;
		for(var i = 0; i < array.length - 1; i++) {
			if(array[i] > array[i + 1]) {
				temp = array[i];
				array[i] = array[i + 1];
				array[i + 1] = temp;
				notSorted = true;
			}
		}
	}
	
	return array;
}

function dup(array) {
	var newArr = [];
	for (var i = 0; i < array.length; i++) {
		newArr.push(array[i]);
	}
	
	return newArr;
}

var arr = [5,4,3,2,1];
console.log(bubSort(arr));