<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script>

	$(document).ready(
		function() {
			
			var reviewId = <%= editReview %>
			if (reviewId > 0) {
				var reviewNota = <%= reviewNota %>
				$("#star" + reviewNota).prop("checked", true);
				
			}
		}
	);

	$(document).ready( 
		function() {
			$("input[type=button]").click(
				function() {
	
					var frmData = $("#frmAddReview").serialize();

			        $.post( "../models/addReview.jsp", frmData, function( data, status ) {
			        	
			           $("#msgAddReview").html("Review inserida com sucesso!");
			            
			    	});
			        
				}
			);
		}
	);
	
</script>