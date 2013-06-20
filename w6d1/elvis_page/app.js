// dynamically inject creepy Andy Warhol photo
$("#content").append('<img src="http://upload.wikimedia.org/wikipedia/commons/2/2b/Andy_Warhol_by_Jack_Mitchell.jpg">');

function addElvis () {
  // a little too much Elvis
  $("#content").append('<img src="http://upload.wikimedia.org/wikipedia/en/b/be/Eight_Elvises.jpg">');
}

// repeatedly call addElvis once every second.
$(function () {
  // uses jQuery to find HTML elements by id.
  var submitButton = $('#submit-button');
  var textField = $('#text-field');

  var game = new Game();

  // installs a "click handler" on the submit button; the callback
  // gets run when the button is clicked.
  submitButton.on('click', function () {
    // grab input text from the text field.
    var input = textField.val();
    // reset text field to blank
    textField.val("")

    // pass it to the game so that it can make the next move.
    game.makeMove(input);
  });
});