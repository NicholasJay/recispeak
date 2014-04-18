// return titles of recipes from user search input
$('.recipe-search-input').keypress(function(e) {
    if(e.which == 13) {
      $.getJSON("http://food2fork.com/api/search?key=a4ecbeef73d5e1fb138719ac9ed4c2e1&q=shredded%20chicken&jsoncallback=?", function(data){
        $.each(data["recipes"][0], function(index, recipe){
          $('<li>' + recipe["title"] + '</li>').appendTo('.search-results');
        });
      });
    }
});