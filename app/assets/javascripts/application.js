// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .

$(document).ready(function(){
  $("#review-list-wrapper").on('click', '#edit-link', function(event){
    event.preventDefault();
    $("#review-update-div").show();
  });
  $("#review-list-wrapper").on('click', '#review-cancel-button', function(event){
    event.preventDefault();
    $("#review-update-div").hide();
  });
});