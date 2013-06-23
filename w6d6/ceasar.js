function ceaser_cipher(word, shift) {
	var alph = "abcdefghijklmnopqrstuvwxyz";
	alphArray = alph.split('');
	wordArray = word.split('');
	//console.log(wordArray);
	newWordArray = [];
	for(var i = 0; i < wordArray.length; i++) {
		var letter = wordArray[i];
		for(var j = 0; j < alph.length; j++) {
			if (letter === alph[j] && (j + shift) < alph.length) {
				var newLetter = alph[j + shift];
			} else if (letter === alph[j] && (j + shift) >= alph.length) {
				var k = j + shift - alph.length;
				var newLetter = alph[k];
			}
		}
		var l = newWordArray.length;
		newWordArray[l] = newLetter;
	}
	var newWord = newWordArray.join("");
	return newWord;
}

var h = ceaser_cipher("xyz", 3);
console.log(h);