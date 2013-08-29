function bubSort(arr) {
	var notSorted = true;
	while(notSorted) {
		notSorted = false;
		for(var i = 0; i < arr.length - 1; i++) {
			if (arr[i] > arr[i + 1]) {
				var temp = arr[i];
				arr[i] = arr[i + 1];
				arr[i + 1] = temp;
				notSorted = true;
			}
		}
	}
	
	return arr;
}

arr = [5,4,3,2,1];
console.log(bubSort(arr));