fs = require('fs');

fileName = "/Users/olenaivashyna/Documents/AppAcademy_work/w6d1/test.txt";

fs.watchFile(fileName, function(curr, prev) {
	console.log("File changed!");
	console.log("Current time is " + curr.mtime);
	console.log("Previous time was " + prev.mtime);
	console.log("Current file size is " + curr.size);
	console.log("Change in file size is " + (curr.size - prev.size));
});