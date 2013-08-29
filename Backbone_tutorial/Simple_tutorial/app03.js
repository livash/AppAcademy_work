$(document).ready(function(){
	
	var Item = Backbone.Model.extend({
		defaults: {
			part1: "hello",
			part2: "world",
			part3: "from",
			part4: "Olena :)"
		}
	});
	
	var List = Backbone.Collection.extend({
		model: Item
	});
	
	var ListView = Backbone.View.extend({
		el: $("body"),
		events: {
			'click button#add': 'addItem'
		},
		
		initialize: function(){
			_.bindAll(this, 'render', 'addItem', 'appendItem');
			
			this.collection = new List();
			// var defItem = new Item();
			// this.collection.add(defItem);
			//console.log("before bind");
			this.collection.bind('add', this.appendItem); //collection event binder
			//when add action is run on this.collection, it'll run append.Item method
			
			this.counter = 0;
			this.render();
		},
		
		render: function(){
			var self = this;
			var button = $('<button>').html('Add list item').attr('id', 'add');
			//$(this.el).append("<button id='add'>Add list Item</button>");
			$(this.el).append(button);
			$(this.el).append('<ul>');
			//in case collection already has some items in it
			_(this.collection.models).each(function(item){
				self.appendItem(item);
			}, this);
		},
		
		addItem: function(){
			this.counter++;
			var item = new Item();
			item.set({
				part2: item.get('part2') + " " + this.counter
			});
			this.collection.add(item);
		},
		
		appendItem: function(item){
			$('ul', this.el).append("<li>" + item.get('part1') +" " + item.get("part2")+"</li>")
		}
	});
	
	var listView = new ListView();
});