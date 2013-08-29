$(document).ready(function(){
	
	//function data(obj) { console.log(obj); return obj; };

	var dataObj = {};
	$.ajax({
		url: "https://raw.github.com/cskevint/interview/master/checkbox_tree.json",
		dataType: "jsonp",
		contentType: "application/json",
		jsonpCallback: 'data',
		jsonp: 'data',
		success: function(res) { 
			dataObj = JSON.parse(res);
			draw(dataObj);
			
		}
	}); 
	var rootEl = $("<div>");
	var parents = [];
	//populate data onto the page
	function draw(obj) {
		$.each(obj, function(key, value) {
			if (value.parent === null) {
				parents.push(key);
				var ul = $("<ul>").addClass(key);
				if (value.selected === true) { $(ul).addClass("selected"); }
				var link = $("<a>").html("+ ");
				ul.html(key);
        
				var checkbox = $('<input type="checkbox"/>');
				checkbox.attr("checked", value.selected);
				$(ul).prepend(checkbox);
				$(ul).prepend(link);
				$(rootEl).append(ul);
				$("#content").append(rootEl);
			} else if ($.inArray(value.parent, parents) === -1) {
				parents.push(value.parent);
				var link = $("<a>").html("+ ");
				var ul = $("<ul>").html(value.parent).addClass(value.parent);
       
				if (value.selected === true) { $(ul).addClass("selected"); }
				var li = $("<li>").html(key).addClass(value.parent).addClass("hidden");
				var checkbox1 = $('<input type="checkbox"/>');
				var checkbox2 = $('<input type="checkbox"/>');
				checkbox1.attr("checked", value.selected);
				checkbox1.prependTo(li);
				$(ul).prepend(checkbox2);
				$(ul).prepend(link);
				$(ul).append(li);
				$(rootEl).append(ul);
				$("#content").append(rootEl);
			} else {
				var li = $("<li>").html(key).addClass("hidden");
				var checkbox = $('<input type="checkbox"/>');
				checkbox.attr("checked", value.selected);
				checkbox.prependTo(li);
				var parent_ul = "ul." + value.parent;
				$(parent_ul).append(li);
				if (value.selected) {
					$(parent_ul).addClass('selected');
				}
			}   
		});

		$("ul a").click(function(event) {
			var childrenLi = $(this).parent().children("li");
			if ($(this).html() === "+ ") {
				$(this).html("-  ");
			} else {
				$(this).html("+ ");
			}
			$.each(childrenLi, function(id, child) {
				var childClass = $(child).attr('class');
				$(child).toggleClass('hidden');
			});
		});

		$("ul.selected").each(function(idx) {
			var childrenLi = $(this).children("li");
			$.each(childrenLi, function(id, child) {
				$(child).removeClass('hidden');
			});
		});
		
		var link = $("<a>").html("www.livash.github.io").attr("href", "http://livash.github.io");
		var div = $("<div>").html("For more examples of my code check out ");
		$(div).append(link);
		$("#content").append(div);
	}
});
