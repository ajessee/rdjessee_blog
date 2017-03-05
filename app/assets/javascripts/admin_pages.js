// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var object = null;

$('#tellMe').change(function() {
  debugger;
  
  if ($(this).attr("userID")) {

  }
    var userID = $(this).attr("userID");
    var attributeToUpdate = $(this).attr("attributeToUpdate");
    var attributeValue = $("#tellMe").val();
    var path = "/users/"
    object = $(this)
    saveData(userID, attributeToUpdate, attributeValue, path);

});

// $('table td').focusout(function() {
//   if ($(this).attr("storyID")) {
//     var questionID = $(this).attr("storyID");
//     var attributeToUpdate = $(this).attr("attributeToUpdate");
//     var attributeValue = $(this)[0].innerHTML;
//     var path = "/stories/"
//     object = $(this)
//     saveData(questionID, attributeToUpdate, attributeValue, path);
//   }

// });

function saveData(ID, attributeToUpdate, attributeValue, path) {
  $.ajax({
   method: "PATCH",
   url: path + ID,
   data: {
    id: ID,
    attributeToUpdate: attributeToUpdate,
    attributeValue: attributeValue
  }
})
  .done(function(data){
    debugger;
    if (data === "Change") {
      debugger;
      object.attr("style", "background-color: lightgreen")
      object.parent().children().last().attr("style", "background-color: lightgreen")
    }

    console.log("Updated database successfully")
    console.log(data);
  });
}
