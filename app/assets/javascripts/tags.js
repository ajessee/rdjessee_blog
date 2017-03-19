// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#tagAjax').click(function(event) {


event.preventDefault();
debugger;
    $.ajax({
      method: "get",
      url: "/tag_cloud",
    })
    .done(function(data){
      $('#alpha_button').removeClass('active');
      $('#year_button').removeClass('active');
      $('#age_button').removeClass('active');
      $('#decade_button').removeClass('active');
      $('#stories_container').html(data)
    });


});