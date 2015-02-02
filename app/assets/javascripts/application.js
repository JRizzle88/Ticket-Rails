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
//= require bootstrap-sprockets
//= require best_in_place
//= require_tree .

var ready;
ready = function() {
  $('#tooltip-dashboard').tooltip();
  $('#tooltip-users').tooltip();
  $('#tooltip-invites').tooltip();
  $('#tooltip-profile').tooltip();

  // Fades out the flash message after a 4000ms setting
  $('.container .row .alert').hide().delay(200).fadeIn(800).delay(4000).fadeOut(800);

  // Slider by bxSlider
  $('.bxslider').bxSlider();

  // Neat little feature that shows the form when Add Comment button is clicked
  $('#comments-form').hide(); //Initially form wil be hidden.
  $('#toggleForm').click(function() {
     $('#comments-form').slideDown(500);//Form shows on button click
     $('#toggleForm').hide();
  });

  // Not Currently being used -- Will use in the future
  //$('#hideForm').click(function() {
  //  $('#comments-form').slideUp(300);
  //  $('#toggleForm').show();
  //})

  // Tickets Sortable and searching
  //$("#tickets th a, #products .pagination a").live("click", function() {
  //  $.getScript(this.href);
  //  return false;
  //});
  $("#tickets_search input").keyup(function() {
    $.get($("#tickets_search").attr("action"), $("#tickets_search").serialize(), null, "script");
    return false;
  });

  /* Activating Best In Place */
  $(".best_in_place").best_in_place();

  $(".task-check").bind('change', function(){
    if (this.checked){
      $.ajax({
        url: '/todos/'+this.value+'/toggle',
        type: 'POST',
        data: {"completed": this.checked}
      });
    }
    else {
       alert("no");
    }
  });


};

$(document).ready(ready);
$(document).on('page:load', ready);
