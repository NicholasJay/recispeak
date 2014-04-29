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

var Recispeak = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {}
};

// this will allow additional fields to be added to a form, so my recipes can have as many ingredients or steps as
// the user would like. 
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).before(content.replace(regexp, new_id));
}

$(document).ready(function(){
  setTimeout(function(){
    $('.flash-message').remove();
  }, 4000);

});

$(document).ready(function(){
  setTimeout(function(){
    $('.flash-message-login').remove();
  }, 4000);

});
