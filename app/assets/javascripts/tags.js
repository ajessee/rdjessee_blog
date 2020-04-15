// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(".tag-xhr-request").click(function (event) {
  let url = event.target.id == "tag-cloud" ? "/tag_cloud" : "/tags";

  event.preventDefault();

  let setupTagsTableSort = function() {
      let table = $('table[data-order]');
      if (table) {
        let sortID = table.attr('data-order');
        let oppositeID = sortID  == "sort-tags-asc" ? "sort-tags-desc" : "sort-tags-asc";
        $("#" + sortID).click(function (event) {
          let updatedUrl = "/tags?sort_id=" + oppositeID;
          ajaxCall(updatedUrl).then(setupTagsTableSort);
        });
        $('#' + sortID).show();
        $('#' + oppositeID).hide();
      }
  }

  ajaxCall(url).then(setupTagsTableSort);

});

let ajaxCall = function (url) {
  return $.ajax({
    method: "get",
    url: url,
  }).done(function (data) {
    $("#alpha_button").removeClass("active");
    $("#year_button").removeClass("active");
    $("#age_button").removeClass("active");
    $("#decade_button").removeClass("active");
    $("#stories_container").html(data);
  })
}

$("#all_tags_counts").change(function () {
  if (document.getElementById("story_all_tags").value == "") {
    document.getElementById("story_all_tags").value = $("#all_tags_counts option:selected").text();
  } else {
    var existingTags = document.getElementById("story_all_tags").value;
    document.getElementById("story_all_tags").value = existingTags + ", " + $("#all_tags_counts option:selected").text();
  }
});
