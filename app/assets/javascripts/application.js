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
//= require rsvp
//= require parallax.min
//= require_tree .


$(document).ready(function() {
	$('.hamburger').click(function() {
		toggleNav();
	});	
	$('.close').click(function() {
		toggleNav();
	});	

});

function toggleNav() {
	if ($('.mobile-nav').hasClass('open')) {
		$('.mobile-nav').removeClass('open');
	} else {
		$('.mobile-nav').addClass('open');
	}
}
function loadImage(element, target) {
	console.log('loading image...');
    $(element).load(function() {
   	  console.log('image loaded.');
      $(target).css('background-image', 'url(' + $(this).attr('src') + ')');
    });
}