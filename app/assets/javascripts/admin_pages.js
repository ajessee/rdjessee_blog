// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var object = null;

$('table td').focusout(function() {

  if ($(this).attr("fillIn")) {
    var questionID = $(this).attr("storyID");
    var attributeToUpdate = $(this).attr("attributeToUpdate");
    var attributeValue = $(this)[0].innerHTML;
    var path = "/stories/"
    object = $(this)
    saveData(questionID, attributeToUpdate, attributeValue, path);
  }

  if ($(this).attr("selectInteger")) {
    var questionID = $(this).attr("storyID");
    var attributeToUpdate = $(this).attr("attributeToUpdate");
    var attributeValue = parseInt($(this).find(":selected").text());
    var path = "/stories/"
    object = $(this)
    debugger;
    saveData(questionID, attributeToUpdate, attributeValue, path);
  }

  if ($(this).attr("selectString")) {
    var questionID = $(this).attr("storyID");
    var attributeToUpdate = $(this).attr("attributeToUpdate");
    var attributeValue = $(this).find(":selected").text();
    var path = "/stories/"
    object = $(this)
    debugger;
    saveData(questionID, attributeToUpdate, attributeValue, path);
  }

  if ($(this).attr("userID")) {
    debugger;
    var userID = $(this).attr("userID");
    var attributeToUpdate = $(this).attr("attributeToUpdate");
    var attributeValueString = "#tellMe" + userID + " :selected"
    var attributeValue = $(attributeValueString).text();
    var path = "/users/"
    object = $(this)
    saveData(userID, attributeToUpdate, attributeValue, path);
  }

});

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
    if (data === "Change") {
      debugger;
      object.attr("style", "background-color: lightgreen");
      object.parent().children().last().attr("style", "background-color: lightgreen");
      object.parent().children().last()[0].innerHTML = "Just Now";
    }

    console.log("Updated database successfully");
    console.log(data);
  });
}