$(document).ready(function(){
	
	Backbone.sync = function(method, model, success, error) {
		success();
	}
	
	var Item = Backbone.Model.extend({
		defaults: {
			part1: "Hello",
			part2: "Helen :)"
		}
	});
	
	var List = Backbone.Collection.extend({
		model: Item
	});
	
	var ItemView = Backbone.View.extend({
		tagName: 'li',
		
		events: {
			'click span.swap': 'swap',
			'click span.delete': 'remove'
		},
		
		initialize: function(){
			console.log('Inside initilize method for ItemView...');
			console.log(this.model);
			_.bindAll(this, 'render', 'unrender', 'swap', 'remove');
			
			this.model.bind('change', this.render);
			this.model.bind('remove', this.unrender);
		},
		
		render: function(){
			// var spanItem = $("<span>").html(this.model.get('part1') + " " + this.model.get('part2'));
			// spanItem.css('color', 'black');
			// 
			// var spanSwap = $("<span>").html("[swap]");
			// spanSwap.css('font-family', 'sans-serif').css('color', 'blue').css('cursor', 'pointer');
			// spanSwap.addClass('swap');
			// 
			// var spanDelete = $("<span>").html("[delete]");
			// spanDelete.css('color', 'red').css('cursor', 'pointer').css('font-family', 'sans-serif');
			// spanDelete.addClass('delete');
			
			$(this.el).html('<span style="color:black;">' 
			+ this.model.get('part1') + ' ' + this.model.get('part2')
			+ '</span> &nbsp; &nbsp; <span class="swap" style="font-family:sans-serif; color:blue; cursor:pointer;">[swap]</span> <span class="delete" style="cursor:pointer; color:red; font-family:sans-serif;">[delete]</span>');
			return this;
		},
		
		unrender: function(){
			$(this.el).remove();
		},
		
		swap: function(){
			var swapped = {
				part1: this.model.get('part2'),
				part2: this.model.get('part1')
			}
			this.model.set(swapped);
		},
		
		remove: function(){
			this.model.destroy();
		}
	});
	
	var ListView = Backbone.View.extend({
		el: $('body'),
		
		events: {
			'click button#add': 'addItem'
		},
		
		initialize: function(){
			_.bindAll(this, 'render', 'addItem', 'appendItem');
			
			this.collection = new List();
			this.collection.bind('add', this.appendItem);
			
			this.counter = 0;
			this.render();
		},
		
		render: function(){
			var self = this;
			var header = $("<h1>").html("Welcome to Backbone").css('font-size', '20px').css('color', 'blue');
			$(this.el).append(header);
			var button = $('<button>').html('Add list Item').attr('id', 'add');
			$(this.el).append(button);
			$(this.el).append("<ul></ul>");
			
			_(this.collection).each(function(item){
				self.appendItem(item);
			}, this);
		},
		
		addItem: function(){
			this.counter++;
			var item = new Item();
			item.set({
				part2: item.get('part2') + " " + this.counter
			});
			console.log("inside addItem method ...");
			this.collection.add(item);
		},
		
		appendItem: function(item){
			console.log(item);
			
			var itemView = new ItemView({
				model: item
			});
			console.log("Inside appendItem function....");
			$('ul', this.el).append(itemView.render().el);
		}
	});
	
	var listView = new ListView();	
});