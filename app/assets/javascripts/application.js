// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//
//= require_tree .

Turbolinks.enableTransitionCache();

if($('.contracts-enterprise-button').size() > 0) {
	$('.contracts-enterprise-button').click(function() {
		var element = $(this).siblings('div');
		if($(element).css('display') == 'block') {
			$(element).hide('slow');
		} else {
			$(element).show('slow');
		}
		return false;
	});
}