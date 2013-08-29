(function() {
  this.JST || (this.JST = {});
  this.JST["albums/album_form"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<form>\n\t<label for="album_title">Title:</label>\n\t<input type="text" name="album[title]" id="album_title">\n\t<br>\n\t<label for="album_description">Description:</label>\n\t<textarea cols="40" rows="5" name="album[description]" id="album_description"></textarea>\n\t<br>\n\t<input type="submit"  value="Submit">\n</form>\n');}return __p.join('');};
}).call(this);
