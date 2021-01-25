<%@page import="classes.Reviews"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script>
	var userLogin = <%= userLogin %>
	if (userLogin <= 0) {
		
		$(document).ready(
			function() {
				$('.private').click(
					function() {
						$('.private').attr("href", "login.jsp");
						alert("É preciso estar conectado para acessar esta área!");
					}
				);
			}
		);
		
	}

	$(document).ready(
		function() {
			$('button[name="deleteMovie"]').click(
				function() {

					var btnData = $('#btnDeleteMovie');

			        $.post( "../models/deleteMovie.jsp", btnData, function( data, status ) {
			        	
			        	alert("Filme excluido com sucesso!");
			        	window.location.href = "landingPage.jsp";
			            
			    	});
			        
				}
			);
		}	
	);
</script>
	