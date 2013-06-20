var num = 42;
var fun = function(name) {
	console.log("Hello world");
};

function log_if_even(num) {
	if ((num % 2) == 0) {
		console.log("FOund an even number!")
	}
}

[1,2,3].forEach(log_if_even)

function forEach(array, fun) {
	for (var i = 0, i < array.length; i++) {
		fun(array[i]);
	}
}

forEach([1,2,3], log_if_even)

// pass function arguments as anonymous functions
[1,2,3].forEach(
	function (num) {
		if ((num % 2) == 0) {
			console.log(num)
		}
	}
)

// equivalent of ruby hash in javascript is called an object
var cat = {
	name: "Breakfast",
	age: 8
};
console.log(cat['name']);
console.log(cat.name);
cat.name = "Earl";
cat['age'] += 1;

var cat = {
	name: "Breakfast",
	age: 8,
	
	purr: function () {
		console.log("Meow!");
	},
	
	age_one_year: function () {
		this.age += 1;
	}
};

cat.purr();
cat.age_one_year();

var catPurrFunction = cat["purr"];
catPurrFunction();



















