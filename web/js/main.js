
$(document).ready(function(){
	//Script for nav scroll */
	$(window).bind('scroll', function(e) {
    scrollingfn();
  });
  /*=== one page navigation ====*/
    $('#main_navigation_menu').onePageNav({
            currentClass: 'active'
    });

	function scrollingfn() {
	  var scrollPosition = $(window).scrollTop();
	}
	// Script for top Navigation Menu
    jQuery(window).bind('scroll', function () {
      if (jQuery(window).scrollTop() > 100) {
        jQuery('#head-nav').addClass('fixed-top').removeClass('topnavbar');
      } else {
        jQuery('#head-nav').removeClass('fixed-top').addClass('topnavbar');
      }
    });
	// Script for scrollUP*/
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 500, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 500, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
		/*scroll to end*/	
	});
});

//Tweet Carousel
$('#tweet-carousel').carousel()
