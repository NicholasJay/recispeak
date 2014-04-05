var Recipe = Backbone.Model.extend({
  urlRoot: '/users/' + localStorage['user_id'] + '/recipes'
});

var RecipeCollection = Backbone.Collection.extend({
  model: Recipe,
  urlRoot: '/users/' + localStorage['user_id'] + '/recipes'
});

