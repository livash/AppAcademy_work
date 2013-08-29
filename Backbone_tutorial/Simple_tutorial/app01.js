$(document).ready(function() {
	var ListView = Backbone.View.extend({
		el: $("body"),
		
		initialize: function(){
			_.bindAll(this, 'render');
			this.render();
		},
		
		render: function(){
			var ul = $('<ul>');
			var li = $('<li>').html("Hello world from Olena :).");
			$(this.el).append($(ul).append(li));
		}
	});
	
	var listView = new ListView();
});