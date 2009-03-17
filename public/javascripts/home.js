// Cycles the featured properties on the home page
var propertyCycle = {
	change: function(hide, show){
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
				propertyCycle.timeoutID = window.setTimeout(function(){ propertyCycle.change(hide, show) }, 8000);
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
			propertyCycle.timeoutID = window.setTimeout(function(){ propertyCycle.change(1, 2) }, 8000);
		}
	}
}
jQuery(document).ready(propertyCycle.setup);

// Cycles the news articles on the home page
var newsCycle = {
	change: function(hide, show){
		jQuery("#article" + hide).fadeOut(200, function(){
			if (hide == jQuery(".article").length){
				hide = 1;
			}else{
				hide++;
			}
			jQuery("#article" + show).fadeIn(200, function(){
				if (show == jQuery(".article").length) {
					hide = show;
					show = 1;
				}else{
					show++;
				}
				window.clearTimeout(newsCycle.timeoutID);
				newsCycle.timeoutID = window.setTimeout(function(){ newsCycle.change(hide, show) }, 8000);
			})
		})
	},

	next: function(hide){
		if (hide == jQuery(".article").length){
			show = 1;
		}else{
			show = hide + 1;
		}
		newsCycle.change(hide, show);
	},

	setup: function(){
		if (jQuery(".article").length > 1){
			newsCycle.timeoutID = window.setTimeout(function(){ newsCycle.change(1, 2) }, 8000);
		}
	}
}
jQuery(document).ready(newsCycle.setup);