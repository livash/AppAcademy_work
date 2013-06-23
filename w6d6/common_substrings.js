function commonSub(str1, str2) {
	var subsArr1 = substr(str1);
	var subsArr2 = substr(str2);
	var maxSub = '';
	for (var i = 0; i < subsArr1.length; i++) {
		for (var j = 0; j < subsArr2.length; j++) {
			if ((subsArr1[i] === subsArr2[j]) && (maxSub.length < subsArr1[i].length)) {
				maxSub = subsArr1[i];
			}
		}
	}
	
	return maxSub;
}

function substr(str) {
	var letArr = str.split('');
	var subs = [];
	for(var i = 0; i < letArr.length; i++) {
		for(var j = i; j < letArr.length; j++) {
			var sub = letArr.slice(i, j + 1).join('');
			var l = subs.length;
			subs[l] = sub;
		}
	}
	
	return subs;
}

console.log(substr('cat'));
console.log(commonSub("zooglensnuck", "lenscrafters"));
console.log(commonSub("abc", "xyz"));