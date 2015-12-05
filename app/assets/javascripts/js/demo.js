$(document).ready(function(){
	function update(id){
		$("#editem"+id).editInPlace({		
		callback: function(original_element, html, original){
			$("#updateDiv1").html("The original html was: " + original);
			$("#updateDiv2").html("The updated text is: " + html);
			return(html);
		}
	});
	}



});