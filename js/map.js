$(document).ready(function(){
    	  	
      		$("#dil_map area").click(function() {
      		  
      		  fo = $(this).data('fo');
      		  
      		  $('.select_region .ps'+fo).addClass('show');
      		  $('.select_region .region_item:not(".show")').fadeOut(200);
      		  $('.select_region .ps'+fo).fadeIn(200);
      		  $('.select_region .ps'+fo).removeClass('show');
      		  
      		  $('.region_info .fo'+fo).addClass('show');
      		  $('.region_info .item').hide();
      		  $('.region_info .fo'+fo).show();
      		  $('.region_info .fo'+fo).removeClass('show');
				
      		  return false;
      	  });
      		
      		
    	});