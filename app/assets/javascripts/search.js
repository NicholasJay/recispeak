// return titles of recipes from user search input
var recipeTitles;

function getRecipeTitles(keyword){
  $.getJSON("/search?keyword=" + keyword, function(response){
    recipeTitles = response;
  });
}

$('.recipe-search-input').keypress(function(e) {
  if(e.which == 13) {
    e.preventDefault();
    var keyword = $("input").val();
    getRecipeTitles(keyword);
    $("input").val("");
  }
});





// $.each(data["recipes"][0], function(index, recipe){
//   $('<li>' + recipe["title"] + '</li>').appendTo('.search-results');
// });