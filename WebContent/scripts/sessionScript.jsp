<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">

	$(document).ready( 
	  function() {
		var userLogin = <%= userLogin %>;
    	if( userLogin > 0) {
    		document.getElementById('user-container').style.display = 'none';
    	} else {
    		document.getElementById('logged-user-container').style.display = 'none';
    	}
	  }
	);
	
	$(document).ready(
		function() {
			$("#desconectar").click(
				function() {
					var formData = $("#desconectar");
					
					$.post( "../models/loginValidation.jsp", formData, function( data, status ) {
						
						window.location.href = "landingPage.jsp";
						
					}, "json");
				}		
			);
		}
	);
	
</script>