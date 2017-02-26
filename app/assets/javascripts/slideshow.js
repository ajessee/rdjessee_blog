// $( document ).ready(function() {

//   var slideIndex = 1;
//   showDivs(slideIndex);

//   $( "button.w3-btn.prev" ).click(function(event) {
//       console.log("Prev")
//       event.preventDefault()
//       showDivs(slideIndex -= 1);
//     });

//   $( "button.w3-btn.next" ).click(function(event) {
//       console.log("Next")
//       event.preventDefault()
//       showDivs(slideIndex += 1);
//     });

//   $( "button.w3-btn.demo" ).click(function(event) {
//       event.preventDefault()
//       var n = this.textContent;
//       showDivs(slideIndex = n);
//     });

//   function showDivs(n) {
//     var i;
//     var slides = document.getElementsByClassName("mySlides");
//     var dots = document.getElementsByClassName("demo");
//     if (n > slides.length) {slideIndex = 1}
//       if (n < 1) {slideIndex = slides.length} ;
//     for (i = 0; i < slides.length; i++) {
//      slides[i].style.display = "none";
//    }
//    for (i = 0; i < dots.length; i++) {
//      dots[i].className = dots[i].className.replace("w3-red", "");
//    }
//    slides[slideIndex-1].style.display = "block";
//    dots[slideIndex-1].className += " w3-red";
//  }

// });
