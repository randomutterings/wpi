function addClickHandlers(){
	// Removes anchor hrefs from thumbnails
	jQuery("a.thumbnail").attr("href", "javascript:void(0);");
	
	// Adds click handlers to image thumbnails that update the larger image
	jQuery("img.thumbnail", this).click(function() {
		src = this.src.replace("thumb", "medium");
		jQuery("#medium_photo").fadeOut(200, function(){
			jQuery("#medium_photo").attr('src',src).bind('readystatechange load', function(){
		   if (this.complete) jQuery(this).fadeIn(400);
			})
		})
	})
	
	// Adds click handlers to primary photo check boxes to uncheck the rest
	jQuery("input.primary_photo_check_box", this).click(function() {
		jQuery(".primary_photo_check_box").attr("checked", false);
		jQuery(this).attr("checked", true);
	})
	
}

jQuery(document).ready(addClickHandlers);