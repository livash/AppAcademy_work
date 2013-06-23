HT.UI = (function() {
	
	var COLORS = ["red", "blue", "yellow", "green", "pink"];
	
	function UI(game) {
		this.game = game;
	};
	
	UI.prototype.start = function() {
		this.drawTowers();
		this.addDisksToTowers();
		this.listenForClicks();
	};
	
	UI.prototype.drawTowers = function () {
		var mainDiv = $('<div>').addClass('main-div');
		for(var i = 0; i < 3; i++) {
			var div = this.makeOneDiv();
			var id = 'tower-' + i;
			div.attr('id', id);
			$(mainDiv).append(div);
		}
		
		$('body').append(mainDiv);
	}
	
	UI.prototype.makeOneDiv = function() {
		var div = $("<div>").addClass("tower");
		
		return div;
	}
	
	
	UI.prototype.addDisksToTowers = function() {
		var numDisks = this.game.numDisks;
		for (var i = 0; i < numDisks; i++) {
			var div = $('<div>').addClass('disk-' + i);
			div.css('background', COLORS[i]).html(i + 1);
			$('#tower-0').append(div);
		}
	}
	
	UI.prototype.listenForClicks = function() {
		var thatUI = this;
		var game = this.game;
		var movePos = [];
		$('.tower').click(function() {
			$(".errors").html('Make your move...');
			var that = this; // one of the three tower divs
			var towerNum = $(that).attr('id').split('-'); //return value is "tower-i"
			movePos.push(towerNum[1]);
			console.log(movePos);
			if(movePos.length === 2) {
			
				var to = movePos.pop();
				var from = movePos.pop();
				if(game.moveDisk(from, to)) {
					console.log("move sucessfull.......")
					thatUI.moveDiv(from, to);
					thatUI.printGameStatus();
				} else {
					//print message to the screen
					$('.errors').html("This move is not allowed. Try again.");
				}
			}
		});		
	}
	
	UI.prototype.moveDiv = function(from, to) {
		var divIdFrom = '#tower-' + from;
		divIdTo = "#tower-" + to;
		var fromDiv = $(divIdFrom).children()[0];
		console.log(fromDiv);
		$(divIdTo).prepend(fromDiv);
	}
	
	
	return UI;
})();








