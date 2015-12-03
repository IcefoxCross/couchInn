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
//= require turbolinks
//= require_tree .
//= require filterrific/filterrific-jquery
//= require bootstrap




jQuery(function($) {

	//filas clickeables en el index de couches
	$(document).ready(function () {
		$("tr[data-link]").click(function() {
			window.location = $(this).data('link');
		});
	});

	//preguntas toggleables en el show de couch
	$(document).ready(function () {
	    
	    $('#toggle-ask li').click(function () {
	        var text = $(this).children('div.panel');
	        if (text.is(':hidden')) {
	            text.slideDown('200');
	            $(this).children('span').html('-');        
	        } else {
	            text.slideUp('200');
	            $(this).children('span').html('+');        
	        }
	        $(this).children('div.panel').children('form').children('div.field').children('textarea').focus();
	    });
	});

})

	function showonlyone(thechosenone) {
         $('.newboxes').each(function(index) {
              if ($(this).attr("id") == thechosenone) {
                   $(this).show(200);
              }
              else {
                   $(this).hide(600);
              }
         });
    }