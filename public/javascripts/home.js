function cycleFeaturedProperties(hide, show){
	// Cycles the featured properties on the home page
	jQuery("#feature" + hide).fadeOut(200, function(){
		if (hide == jQuery(".feature").length){
			hide = 1;
		}else{
			hide++;
		}
		jQuery("#feature" + show).fadeIn(200, function(){
			if (show == jQuery(".feature").length) {
				hide = show;
				show = 1;
			}else{
				show++;
			}
			window.setTimeout(function(){ cycleFeaturedProperties(hide, show) }, 3000);
		})
	})
}

function showFirstProperty(){
	if (jQuery(".feature")){
		window.setTimeout(function(){ cycleFeaturedProperties(1, 2) }, 3000);
	}
}

jQuery(document).ready(showFirstProperty);