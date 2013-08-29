// this code 
$(document).ready(function(){
	var theData = [1,2,3,4]

	var p = d3.select("body").selectAll("p")
	p.data(theData).enter().append("p").text(function(d, i) {
		return "i = " + i + "  d = " + d;
	});
});
