// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require foundation

$(function(){

  $(document).foundation();

  $('#new_comment').submit(function(event){
    event.preventDefault();

    // Do the ajax request
    $.ajax({
      url: event.target.action + '.json',
      method: 'POST',
      data: $(event.target).serialize(),
      success: function(data) {
        $('#comment_list').append(data.comment);
        $("#comment_list .comment:last").hide().slideDown(); //animation
      }, 
    
      error: function(e) {
        console.log("Woops!", e);
      }
    });
      
  });
});
