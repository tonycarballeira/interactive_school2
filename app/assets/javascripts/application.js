// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree 
//= require owl.carousel
//= require_tree 



function cycleImages(){
	      var $active = $('#image-carousel .active');
	      var $next = ($active.next().length > 0) ? $active.next() : $('#image-carousel img:first');
	      $next.css('z-index',2);//move the next image up the pile
	      $active.fadeOut(1500,function(){//fade out the top image
		  $active.css('z-index',1).show().removeClass('active');//reset the z-index and unhide the image
	          $next.css('z-index',3).addClass('active');//make the next image the top one
  		
  });
}

$(document).ready(function(){
// run every 7s
	setInterval('cycleImages()', 7000);
})


$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 

    var a = $(".video");
   a.click(function(e)
   {

       e.preventDefault();

   });
});


$(document).ready(function() {
 
  $("#owl-demo").owlCarousel({
 
      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true
 
      // "singleItem:true" is a shortcut for:
      // items : 1, 
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false
 
  });
 
});





