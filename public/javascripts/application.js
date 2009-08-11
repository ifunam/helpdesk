// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){
	$("#filter_category_id").change(function(){
              $.ajax({
		      url: "/tickets/search/?search[category_id]=" + $("#filter_category_id").val(),
		      success: function(data){ $("#tickets_collection").html(data); },
		      });
		
	});
});
