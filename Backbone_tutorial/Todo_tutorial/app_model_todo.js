App.Models.Todo = Backbone.Model.extend({
	
	defaults: function(){
		return {
			title: "empty todo item ...",
			order: Todos.nextOrder(),
			done: false
		};
	},
	
	toggle: function(){
		this.save({done: !this.get('done')});
		//toggle done state of the todo item
	}
	
});