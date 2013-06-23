HT = {};

HT.Game = (function () {
	function HanoiGame (disks) {
		this.towers = [[],[],[]];
		this.numDisks = disks;
		
		this.initializeTowers();
	}
	
	HanoiGame.prototype.initializeTowers = function() {
		for(var i = 0; i < this.numDisks; i++) {
			this.towers[0].unshift(i + 1);
		}	
	};
	
	HanoiGame.prototype.moveDisk = function(from, to) {
		console.log("moving disk .......");
		var that = this;
		if (this.moveIsValid(from, to)) {
			var fromDisk = that.towers[from].pop();
			that.towers[to].push(fromDisk);
			return true;
		}
		return false;
	};
	
	HanoiGame.prototype.moveIsValid = function(from, to) {
		var fromLen = this.towers[from].length;
		var toLen = this.towers[to].length;
		if (toLen === 0) { return true; }
		var disksCheck = (this.towers[from][fromLen - 1] < this.towers[to][toLen - 1]);
		if (toLen > 0 && disksCheck) {
			return true;
		} else {
			return false;
		}
	};
	
	HanoiGame.prototype.isGameOver = function() {
		var t1 = this.towers[0].length;
		var t2 = this.towers[1].length;
		var t3 = this.towers[2].length;
		
		return (t1 === 0 && (t2 === 0 || t3 === 0));
	}
	
	
	return HanoiGame;
})();

//testing
var game = new HT.Game(3);
console.log(game);
game.moveDisk(0, 1);
console.log(game);
