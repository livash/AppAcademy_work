var SS = (function () {
  function Secret(id, title, text) {
    this.id = id;

    this.title = title;
    this.text = text;
  };

  Secret.all = _.map(_.range(10), function (id) {
    return new Secret(id, "title" + id, "text" + id);
  });
  Secret.find = function (id) {
    return _.find(Secret.all, function (secret) {
      return secret.id == id;
    });
  }

  function SecretShower(el, secret) {
    this.render = function () {
      el.empty();

      el.append($("<h1></h1>").text(secret.title));
      el.append($("<p></p>").text(secret.text));
    }
  }

  function SecretsSelector(el, secrets, clickCallback) {
    var that = this;

    this.renderSecretLink = function (secret) {
      var link = $('<a href="#"></a>');

      link.text(secret.title);
      link.attr("data-secret-id", secret.id);
      link.click(that.clickSecret.bind(that));

      return link;
    };

    this.render = function () {
      var ul = $("<ul></ul>");

      _.each(secrets, function (secret) {
        var link = that.renderSecretLink(secret);
        ul.append($("<li></li>").append(link));
      });

      $(el).html(ul);
    };

    this.clickSecret = function (event) {
      var secretId = $(event.target).attr("data-secret-id");
      clickCallback(Secret.find(secretId));
    };
  };

  return {
    Secret: Secret,
    SecretsSelector: SecretsSelector,
    SecretShower: SecretShower
  };
})();

$(function () {
  var sidebar = $("#sidebar");
  var main = $("#main");
  var secrets = SS.Secret.all;

  var secretsSelector = new SS.SecretsSelector(
    sidebar, secrets, function (secret) {
      (new SS.SecretShower(main, secret)).render();
    }
  );

  secretsSelector.render();
});
