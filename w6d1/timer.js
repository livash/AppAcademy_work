var milliseconds = Date.now();

function updateClock() {
	milliseconds += 5000;
	var date = new Date(milliseconds);
	//console.log(date);
	var seconds = date.getSeconds();
	var minutes = date.getMinutes();
	console.log(minutes + ":" + seconds);
};
setInterval(updateClock, 5000);