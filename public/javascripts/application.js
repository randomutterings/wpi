// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Function to make css menu work with IE because it doesn't fully support the :hover pseudo class
sfHover = function() {
	var sfEls = document.getElementById("nav").getElementsByTagName("LI");
	for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
			this.className+=" sfhover";
		}
		sfEls[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
		}
	}
}
if (window.attachEvent) window.attachEvent("onload", sfHover);


// Setup tooltips for icons on listing.show
Event.observe(window,"load",function() { 
  $$("#icons *").findAll(function(node){
    return node.getAttribute('alt');
   }).each(function(node){
     new Tooltip(node,node.alt);
     node.removeAttribute("alt");
   });
}); 
