<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	<%
		ResultSet userLoginSelect = new Usuario().select("idUsuario = " + userLogin);
		userLoginSelect.next();
		
  		int userLoginNivel = userLoginSelect.getInt("idNivelUsuario");
	%>
	
	var reviewUserId = <%= reviewUserId %>
	var userLogin = <%= userLogin %>
	var userLoginNivel = <%= userLoginNivel %>
	
	$(document).ready(
		function() {

			if (reviewUserId != userLogin) {
				document.getElementById('reviewButtons').style.display = 'none';
			}
		}	
	);

	$(document).ready(
		function() {
			$('button[name="deleteReview"]').click(
				function() {

					var btnData = $('#btnDeleteReview');
			        $.post( "../models/deleteReview.jsp", btnData, function( data, status ) {
			        	
			        	alert("Review excluida com sucesso!");
			        	window.location.href = "landingPage.jsp";
			            
			    	});
			        
				}
			);
		}	
	);
</script>