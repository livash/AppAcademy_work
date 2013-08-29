function subs(word) {
	var subs = [];
	var letters = word.split('');
	for(var i = 0; i <letters.length; i++) {
		for(var j = i+1; j <= letters.length; j++) {
			var sub = letters.slice(i, j).join('');
			subs.push(sub);
		}
	}
	
	return subs;
}

console.log(subs('cat'));