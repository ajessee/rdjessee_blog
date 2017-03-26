// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  Typed.new('#typedIn1', {
        strings: ["It was painful to write about things, which had been embarrassing to me at the time they happened. ^500 But when I read what I had written, I realized it wasn’t about me, but about a little boy who lived a long time ago.^1000 <br><br>Upon hearing my classmates read their stories I realized that their lives might not have been so different from mine. ^1000"],
        typeSpeed: .10,
        loop: false,
        callback: function() {
          Typed.new('#typedIn2', {
                strings: ["That gave me confidence to write my own stories."],
                typeSpeed: 30,
                loop: false,
                contentType: 'html',
                callback: function() {
                  $("#rdjesseeSignature").fadeIn( 6000 )
                  $("#scrollDownBook").fadeIn( 2000 )  
                }
        })}
      });
});
