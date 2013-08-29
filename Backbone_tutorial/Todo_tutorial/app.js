window.App = {
	Collections: {},
	Models: {},
	Views: {},
	Routers: {},
	initialize: function(){
		
	}
};

$(document).ready(function(){
	var Todos = new App.Collections.TodoList();
	var TodoApp = new App.Views.AppView();
	Backbone.history.start();
});