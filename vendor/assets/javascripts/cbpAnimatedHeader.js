/**
 * cbpAnimatedHeader.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2013, Codrops
 * http://www.codrops.com
 */
var cbpAnimatedHeader = (function() {

	var docElem = document.documentElement,
		header = document.querySelector( '.navbar-fixed-top' ),
		didScroll = false,
		startFade = 400;
		reFade = 200;

	function init() {
		window.addEventListener( 'scroll', function( event ) {
			if( !didScroll ) {
				didScroll = true;
				setTimeout( scrollPage, 250 );
			}
		}, false );
	}

	function scrollPage() {
		var sy = scrollY();
		if ( sy >= startFade) {
			$(".navbar-expanded").fadeIn( 50, function() {
    	classie.remove( header, 'navbar-expanded' );
  		});
		}	
		if ( sy <= startFade && window.location.pathname === "/") {
			classie.add( header, 'navbar-expanded' );
			$(".navbar-expanded").fadeOut( "slow", function() {
			 });
		}
		didScroll = false;
	}

	function scrollY() {
		return window.pageYOffset || docElem.scrollTop;
	}

	init();

})();