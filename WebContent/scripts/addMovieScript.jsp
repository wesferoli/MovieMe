<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">

	function uploadPoster() {
		var target = document.getElementById("target");
		var file = document.querySelector("input[type=file]").files[0];
		
		var reader = new FileReader();
		
		reader.onloadend = function() {
			target.value = reader.result;
			
			// Upload com ajax
			$.ajax({
				method: "POST",
				url: "posterUpload",
				data: { posterUpload: reader.result },
			}).done(function(response) {
				
				$("#msgAddMovie").html(response);
				
			}).fail(function(xhr, status, errorThrown) {
				
				$("#msgAddMovie").html(xhr.responseText);
				
			});
		};
		
		if (file) {
			
			reader.readAsDataURL(file);
			
		} else {
			target.value = "";
		}
	}

	$(document).ready( 
		function() {
			$("input[type=button]").click(
				function() {
	
					var frmData = $("#frmAddMovie").serialize();
				
			        $.post( "../models/addMovie.jsp", frmData, function( data, status ) {
			        	
			            $("#msgAddMovie").html("Filme inserido com sucesso!");
			            
			    	});
			        
				}
			);
		}
	);
	
</script>