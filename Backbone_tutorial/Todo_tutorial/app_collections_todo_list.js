App.Collections.TodoList = Backbone.Collection.extend({
	
	model: App.Models.Todo,
	
	//localStorage: new Backbone.LocalStorage("todos-backbone"),
	
	done: function(){
		return this.where({done: true});
	},
	
	remaining: function(){
		return this.without.apply(this, this.done());
	},
	
	nextOrder: function(){ // generate id for next item in the list
		if (!this.length) return 1;
		return this.last().get('order') + 1;
	},
	
	comparator: 'order'
	
});