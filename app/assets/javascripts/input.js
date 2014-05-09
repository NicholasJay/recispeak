var ingredients = [];
var directions = [];

var getIngredients = $(".page-left-recipe-container-url ul li").text().split("\n");
var getDirections = $(".page-right-recipe-container-url ul li").text().split("\n");

$.each(getIngredients, function(index, value){
  ingredients.push(value.trim());
});

$.each(getDirections, function(index, value){
  directions.push(value.trim());
});

function saveRecipe(){
  var saveRecipeTitle = $('.url-recipe-title').val();
    $.ajax({
    url: "input_recipe",
    data: {title: saveRecipeTitle},
    type: "POST",
    success: function(data){
    saveIngredients(data.id);
    saveDirections(data.id);
    },
  });
}

function saveIngredients(recipe){
  $.each(ingredients, function(index, value){
    $.ajax({
      url: "input_ingredients",
      data: {entry: value, recipe_id: recipe},
      type: "POST",
    });
  });
}

function saveDirections(recipe){
  $.each(directions, function(index, value){
    $.ajax({
      url: "input_directions",
      data: {instructions: value, recipe_id: recipe},
      type: "POST",
    });
  });
  setTimeout(function(){
    window.location.href = "/users/" + localStorage["user_id"] + "/recipes/" + recipe;
  }, 800);
}

$('.user-menu-buttons-input').click(saveRecipe);