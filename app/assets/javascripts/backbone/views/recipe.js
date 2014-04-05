// var FormView = Backbone.View.extend({
//   el: "#recipe-form",

//   events: {
//     "click button":"createRecipe"
//   },

//   createRecipe: function(e){
//     e.preventDefault();

//     var category = this.$el.find("input[name='category']").val();
//     var title = this.$el.find("input[name='title']").val();
//     var notes = this.$el.find("input[name='notes']").val();
//     var recipeId = this.id;
//     this.collection.create({
//       category: category,
//       title: title,
//       notes: notes
//     });
//     this.$el.empty();
//     this.$el.append("<h2>"+ title + " Has Been Created!</h2>");
//     this.$el.append("<h3>click the button to add ingredients to your recipe</h3>");
//   }
// });

// $(document).ready(function(){
//   var recipe = new Recipe();
//   var recipes = new RecipeCollection();
//   var recipeFormView = new FormView({collection: recipes});
//   $("#new-recipe").on("click", function(){
//     $("#recipe-form").append("<h1>New Recipe</h1>");
//     $("#recipe-form").append("Category: <input type='text', name='category'></input><br>");
//     $("#recipe-form").append("Title: <input type='text', name='title'></input><br>");
//     $("#recipe-form").append("Notes: <input type='text', name='notes'></input><br>");
//     $("#recipe-form").append($("<button>Create Recipe</button>"));
//     $("#new-recipe").remove();
//   });
// });

