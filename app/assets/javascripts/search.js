// return titles of recipes from user search input
var recipeTitles;

function getRecipeTitles(keyword){
  $.getJSON("/search", function(response){
    $.each(response, function(index, value){
      if(value.title.toLowerCase().indexOf(keyword.toLowerCase()) != -1){
        $('.search-results').append('<a href="/users/' + localStorage["user_id"] + '/recipes/' + value.id + '">' + value.title + '</a><br />');
      }
    });
  });
}

$('.recipe-search-input').keypress(function(e) {
  if(e.which == 13) {
    e.preventDefault();
    $('.search-results').empty();
    var keyword = $("input").val();
    getRecipeTitles(keyword);
    $("input").val("");
  }
});
