function subwordCount(dictionary, word) {
	var res = {};
	var subs = substrings(word);
	console.log("subs = ");
	console.log(subs);
	for(var i = 0; i < dictionary.length; i++) {
		for(var j = 0; j < subs.length; j++) {
			if (dictionary[i] === subs[j]) {
				var subWord = subs[j];
				if (res[subWord] > 0) {
					res[subWord] += 1;
				} else {
					res[subWord] = 1;
				}
			}
		}
	}
	
	return res;
}

function substrings(word) {
	var resArr = [];
	var letters = word.split('');
	for(var i = 0; i < letters.length; i++) {
		for(var j = i + 1; j <= letters.length; j++) {
			var sub = letters.slice(i,j).join('');
			resArr.push(sub);
		}
	}
	
	return resArr;
}

var dic = ["a", "am", "an", "pa", "pan", "panama"];
console.log(subwordCount(dic, 'raman'));