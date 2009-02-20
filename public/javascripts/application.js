// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function addClickHandlers(){
	
	// Adds click handlers to image thumbnails that update the larger image
	$("img.thumbnail", this).click(function() {
		src = this.src.replace("small", "medium")
		$("#medium_photo").fadeOut(200, function(){
			$("#medium_photo").attr('src',src).bind('readystatechange load', function(){
		   if (this.complete) $(this).fadeIn(400);
			});
		});
	});
	
	// Adds click handlers to primary photo check boxes to uncheck the rest
	$("input.primary_photo_check_box", this).click(function() {
		$(".primary_photo_check_box").attr("checked", false);
		$(this).attr("checked", true);
	})
	
};

$(document).ready(addClickHandlers);