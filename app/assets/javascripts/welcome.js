// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){

  var quotes = [["I notice that people are rushing around: to get to work, to spend their money shopping, and hurrying to do all things that need to be done. ^1000 <br><br>Hurrying through life is not limited to scurrying feet, but to tongues as well. I once was able to understand most talk I heard in English, but alas that is no longer true. Many people talk so fast that it is tiresome to listen to them for long before attention drifts off to another subject."], ["At that time I also had night dreams. I walked along the railroad track, looking for whatever I could find of interest. Usually I found nothing, but nearly always when I was on the track I heard a train whistle. That warned me to get off the track, and I tried to step off the track and head to the right for home. That did no good for the track moved to the right along with my body. I heard the whistle, now closer."], ["As the darkness gradually dissipated, parts of the great abyss below began to appear in a faint, warm, rosy glow, becoming ever more intense.  The source of this glow appeared as an arc of fire, expanding to a full circle over the horizon.  Distant canyon walls began to appear, starting at the canyon rim and creeping downward as the circle of fire ascended into the sky.  The shadow hiding the canyon walls gradually fragmented to expose an infinity of shapes and hues."], ["From our balcony we could watch the sun creep up out of the morning clouds that hovered over the horizon as if trying to prolong the night.  But the sun found a crack in the clouds, and sent through them brilliant beams, declaring victory over darkness."], ["The late October sun in a sky unadulterated by any sign of a cloud beckoned me outdoors. On such a splendid day the sun reflected off the woods across the road revealing bright colors, red, yellow, and brown that are dulled on a cloudy day. Directly across the road was an open field flanked by a stand of woods on both right and left. I had in mind to mow the grass, hopefully for the last time before the cold breezes of autumn made such tasks unnecessary until spring."],["The world has a ghostly appearance. Frost covers everything in sight. This is no ordinary frost. This is hoarfrost, the kind that is built of billions of tiny icicles that cling to every naked branch and twig in the slumbering woods beside the road. The thin clouds dissipate as the sun climbs into the sky. Slivers of sunlight filter through the trees transforming the ghostly forest into a brilliant display of all the world’s diamonds that emit a myriad of colors through tiny prisms. What could be more spectacular?"]]


  var selectedQuote = function getQuote(){
    var numberOfQuotes = quotes.length;
    var randomNumber = Math.floor(Math.random() * (numberOfQuotes));
    var quote = quotes[randomNumber];
    return quote;
  }()

  Typed.new('#typedIn', {
        strings: selectedQuote,
        typeSpeed: .10,
        loop: false,
        showCursor: false,
        callback: function() {
          $("#rdjesseeSignature").css({
            "opacity":"0",
            "display":"block",
          }).show().animate({opacity:1})
          $("#scrollDownBook").css({
            "opacity":"0",
            "display":"block",
          }).show().animate({opacity:1})
        }
      });

});
