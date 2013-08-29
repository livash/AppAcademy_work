function fibs(num) {
	if(num === 0) { return []; }
	if(num === 1) { return [0]; }
	if(num === 2) { return [0,1]; }
	
	var res = fibs(num - 1);
	var last = res[res.length - 1];
	var stl = res[res.length - 2];
	res = res.push(last + stl);
	return res;
	
}