function addHandlers(){
	
	// Adds click handlers to image thumbnails that update the larger image
	jQuery("#article_background_image", this).change(function() {
		src = "http://" + document.domain + "/images/" + this.value
		jQuery("#article_photo").fadeOut(200, function(){
			jQuery("#article_photo").attr('src',src).bind('readystatechange load', function(){
		   if (this.complete) jQuery(this).fadeIn(400);
			})
		})
	})
	
}

jQuery(document).ready(addHandlers);