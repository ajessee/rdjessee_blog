// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#tagAjax').click(function(event) {


    event.preventDefault();
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
    
    $( "#all_tags_counts" ).change(function() {
      if (document.getElementById("story_all_tags").value == ""){
        document.getElementById("story_all_tags").value = $( "#all_tags_counts option:selected" ).text()
      }
      else {
        var existingTags = document.getElementById("story_all_tags").value
        document.getElementById("story_all_tags").value = existingTags + ", " + $( "#all_tags_counts option:selected" ).text()
      }
    });