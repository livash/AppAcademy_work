var value = "cat";
var subStrings = function(stringVar) {
	letterArray = new Array();
	subStr = new Array();
	for (var ii = 0; ii < stringVar.length; ii++) {
		letterArray.push(stringVar[ii]);
	};
	
	for (var ii = 0; ii < letterArray.length; ii++) {
		for(var jj = ii; jj < letterArray.length; jj++) {
			console.log(letterArray.slice(ii, jj));
			oneSubString = letterArray.slice(ii, jj+1).join('');
			subStr.push(oneSubString);
		}
	}
	return subStr;
};

console.log(subStrings(value));