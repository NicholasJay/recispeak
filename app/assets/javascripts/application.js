// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require_self
//= require backbone
//= require ./backbone/recispeak
//= require_tree ./backbone/models
//= require_tree ./backbone/routers
//= require_tree ./backbone/templates
//= require_tree ./backbone/views

var Recispeak = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {}
};

function consolelog(text){
  $("#console").text( $("#console").text() + "\n" + text );
}

// Set the counter to 0 to iterate through the steps. Each if statement handles a different
// voice command. Next, Beginning, and Back, will all navigate through the array of steps
// so the user can easily communicate what they need.

counter = 0;
// recognizer.onresult = function(event) {
//   for (var i = event.resultIndex; i < event.results.length; i++) {
//     if ((event.results[i].isFinal) && (event.results[i][0].transcript == 'next')){
//       readStep(Recispeak.steps[counter]);
//       counter += 1;
//     } else if ((event.results[i].isFinal) && (event.results[i][0].transcript == 'beginning')){
//       counter = 0;
//       readStep(Recispeak.steps[counter]);
//       counter += 1;
//     } else if ((event.results[i].isFinal) && (event.results[i][0].transcript == 'back')){
//       if(j !== 0){
//         counter -= 1;
//         readStep(Recispeak.steps[counter]);
//         counter += 1;
//       } else {
//         counter = 0;
//         readStep(Recispeak.steps[counter]);
//         counter += 1;
//       }
//     } else {
//       console.log(event.results);
//       readStep(Recispeak.steps[counter]);
//       counter += 1;
//     }
//   }
// };

// this will allow additional fields to be added to a form, so my recipes can have as many ingredients or steps as
// the user would like. 
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).before(content.replace(regexp, new_id));
}

