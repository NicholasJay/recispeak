
// this will allow additional fields to be added to a form, so my recipes can have as many ingredients or steps as
// the user would like. 
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).before(content.replace(regexp, new_id));
}
