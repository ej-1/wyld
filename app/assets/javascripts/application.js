// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require twitter/bootstrap
//= require turbolinks.redirect
//= require_tree .


$(document).on('turbolinks:load', function() {



  $( ".show-more" ).click(function() {
    var text = this.innerHTML

        if (text == " more") {
          $( ".show-more" ).html(" more");
            this.innerHTML = " less";
        } else {
            this.innerHTML = " more";        
        }

    $(this).closest(".info-dropdown-box").siblings(".info-dropdown-box").children(".hidden-info-box").slideUp( "slow", function() {
      // Animation complete.
    });
     $(this).closest(".info-dropdown-box").children(".hidden-info-box").slideToggle( "slow", function() {
      // Animation complete.
    });
	});


$(".user-type-info-circle").css("background-color", "#fff");

$(".user-type-info-circle").hover(function(){
    $(this).css("background-color", "#f2dede").children();
    }, function(){
    $(this).css("background-color", "#fff").children();
});

$(".user-type-info-circle").click(function() {
  window.location = $(this).find("a").attr("href"); 
  return false;
});


        var current_url = window.location.href
        if (current_url === "http://localhost:3000/imprint") {
          $('.page-scroll').hide(); 
        } else {

        }



    $('.page-scroll-wyld').click(function(){ // Clicking WYLD logo at top left - scroll to top or back to main page.
        var current_url = window.location.href
        if (current_url === "http://wyld.events") {
                $('html, body').animate({scrollTop : 0},800);
        } else {
                window.location.replace("http://wyld.events");
        }
    });



(function($) {
    "use strict"; // Start of use strict

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 0)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 100
    });

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 50
        }
    })

})(jQuery); // End of use strict

});


