var steps = [];
var directions = [];

var getSteps = $(".page-left-recipe-container-url ul li").text().split("\n");
var getDirections = $(".page-right-recipe-container-url ul li").text().split("\n");

$.each(getSteps, function(index, value){
  steps.push(value.trim());
});

$.each(getDirections, function(index, value){
  directions.push(value.trim());
});