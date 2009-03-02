var propertyCycle = {
	change: function(hide, show){
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
				window.clearTimeout(propertyCycle.timeoutID);
				propertyCycle.timeoutID = window.setTimeout(function(){ propertyCycle.change(hide, show) }, 4000);
			})
		})
	},

	next: function(hide){
		if (hide == jQuery(".feature").length){
			show = 1;
		}else{
			show = hide + 1;
		}
		propertyCycle.change(hide, show);
	},

	setup: function(){
		if (jQuery(".feature").length > 1){
			propertyCycle.timeoutID = window.setTimeout(function(){ propertyCycle.change(1, 2) }, 4000);
		}
	}
}
jQuery(document).ready(propertyCycle.setup);