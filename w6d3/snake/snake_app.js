$(document).ready(function() {
	var game = new Snake.Game(20);
	var ui = new Snake.UI(game);
	//alert("Hello");
	ui.start();
});