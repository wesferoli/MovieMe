<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	if (userLogin > 0) {
	    	ResultSet usuario = new Usuario().selectBy("idUsuario", String.valueOf(userLogin));
	    	usuario.next();
	    	
	    	int userNivel = usuario.getInt("idNivelUsuario");
    %>

<script type="text/javascript">

	$(document).ready( 
		function() {
			if ( <%= userNivel %> != 3 ) {
				document.getElementById('users-button').style.display = 'none';
			}
			
		    if ( <%= userNivel %> == 1 ) {
		    	document.getElementById('categorias-button').style.display = 'none';
		    	document.getElementById('movies-button').style.display = 'none';
		    }
		}
	);
	
	$(document).ready( 
		function() {
			$("#reviews-button").click(
				function() {
					document.getElementById('reviews-button').style.color = '#F8D98B';
					document.getElementById('profile-button').style.color = '#FFFFFF';
					document.getElementById('password-change-button').style.color = '#FFFFFF';
					document.getElementById('users-button').style.color = '#FFFFFF';
					document.getElementById('categorias-button').style.color = '#FFFFFF';
					document.getElementById('movies-button').style.color = '#FFFFFF';
					
					document.getElementById('review-menu').style.display = 'inline';
					document.getElementById('profile-menu').style.display = 'none';
					document.getElementById('password-change-menu').style.display = 'none';
					document.getElementById('users-list-menu').style.display = 'none';
					document.getElementById('categorias-list-menu').style.display = 'none';
					document.getElementById('movies-list-menu').style.display = 'none';
				}
			);
		}		
	);
	
	$(document).ready( 
		function() {
			$("#profile-button").click(
				function() {
					document.getElementById('reviews-button').style.color = '#FFFFFF';
					document.getElementById('profile-button').style.color = '#F8D98B';
					document.getElementById('password-change-button').style.color = '#FFFFFF';
					document.getElementById('users-button').style.color = '#FFFFFF';
					document.getElementById('categorias-button').style.color = '#FFFFFF';
					document.getElementById('movies-button').style.color = '#FFFFFF';
					
					document.getElementById('review-menu').style.display = 'none';
					document.getElementById('profile-menu').style.display = 'inline';
					document.getElementById('password-change-menu').style.display = 'none';
					document.getElementById('users-list-menu').style.display = 'none';
					document.getElementById('categorias-list-menu').style.display = 'none';
					document.getElementById('movies-list-menu').style.display = 'none';				
				}
			);
		}
	);
	
	$(document).ready( 
		function() {
			$("#users-button").click(
				function() {
					document.getElementById('reviews-button').style.color = '#FFFFFF';
					document.getElementById('profile-button').style.color = '#FFFFFF';
					document.getElementById('password-change-button').style.color = '#FFFFFF';
					document.getElementById('users-button').style.color = '#F8D98B';
					document.getElementById('categorias-button').style.color = '#FFFFFF';
					document.getElementById('movies-button').style.color = '#FFFFFF';
					
					document.getElementById('review-menu').style.display = 'none';
					document.getElementById('profile-menu').style.display = 'none';
					document.getElementById('password-change-menu').style.display = 'none';
					document.getElementById('users-list-menu').style.display = 'inline';
					document.getElementById('categorias-list-menu').style.display = 'none';
					document.getElementById('movies-list-menu').style.display = 'none';
				}
			);
		}
	);
	
	$(document).ready( 
		function() {
			$("#password-change-button").click(
				function() {
					document.getElementById('reviews-button').style.color = '#FFFFFF';
					document.getElementById('profile-button').style.color = '#FFFFFF';
					document.getElementById('password-change-button').style.color = '#F8D98B';
					document.getElementById('users-button').style.color = '#FFFFFF';
					document.getElementById('categorias-button').style.color = '#FFFFFF';
					document.getElementById('movies-button').style.color = '#FFFFFF';
					
					document.getElementById('review-menu').style.display = 'none';
					document.getElementById('profile-menu').style.display = 'none';
					document.getElementById('password-change-menu').style.display = 'inline';
					document.getElementById('users-list-menu').style.display = 'none';
					document.getElementById('categorias-list-menu').style.display = 'none';
					document.getElementById('movies-list-menu').style.display = 'none';
				}
			);
		}
	);
	
	$(document).ready( 
		function() {
			$("#categorias-button").click(
				function() {
					document.getElementById('reviews-button').style.color = '#FFFFFF';
					document.getElementById('profile-button').style.color = '#FFFFFF';
					document.getElementById('password-change-button').style.color = '#FFFFFF';
					document.getElementById('users-button').style.color = '#FFFFFF';
					document.getElementById('categorias-button').style.color = '#F8D98B';
					document.getElementById('movies-button').style.color = '#FFFFFF';
					
					document.getElementById('review-menu').style.display = 'none';
					document.getElementById('profile-menu').style.display = 'none';
					document.getElementById('password-change-menu').style.display = 'none';
					document.getElementById('users-list-menu').style.display = 'none';
					document.getElementById('categorias-list-menu').style.display = 'inline';
					document.getElementById('movies-list-menu').style.display = 'none';
				}
			);
		}
	);
	
	$(document).ready( 
		function() {
			$("#movies-button").click(
				function() {
					document.getElementById('reviews-button').style.color = '#FFFFFF';
					document.getElementById('profile-button').style.color = '#FFFFFF';
					document.getElementById('password-change-button').style.color = '#FFFFFF';
					document.getElementById('users-button').style.color = '#FFFFFF';
					document.getElementById('categorias-button').style.color = '#FFFFFF';
					document.getElementById('movies-button').style.color = '#F8D98B';
					
					document.getElementById('review-menu').style.display = 'none';
					document.getElementById('profile-menu').style.display = 'none';
					document.getElementById('password-change-menu').style.display = 'none';
					document.getElementById('users-list-menu').style.display = 'none';
					document.getElementById('categorias-list-menu').style.display = 'none';
					document.getElementById('movies-list-menu').style.display = 'inline';
				}
			);
		}
	);
	
	$(document).ready(
		function() {
			$('#btnSendFrmUserEdit').click(
				function() {

					var frmData = $('#frmUserEdit').serialize();
					
			        $.post( "../models/editUser.jsp", frmData, function( data, status ) {

			        	alert("Usuário alterado com sucesso!");
			        	window.location.href = "userMenu.jsp";
			            
			    	});
			        
				}
			);
		}	
	);
	
	$(document).ready(
		function() {
			$('button[name="delete"]').click(
				function() {

					var btnData = $('button.'+$(this).data('button'));

			        $.post( "../models/deleteUser.jsp", btnData, function( data, status ) {
			        	
			            $("#msgUserMenu").html("Usuário excluido com sucesso!");
			            
			    	});
			        
				}
			);
		}	
	);
	
	$(document).ready(
		function() {
			$('button[name="deleteCategoria"]').click(
				function() {

					var btnData = $('button.'+$(this).data('button'));

			        $.post( "../models/deleteCategoria.jsp", btnData, function( data, status ) {
			        	
			            $("#msgCategoriasMenu").html("Categoria excluida com sucesso!");
			            
			    	});
			        
				}
			);
		}	
	);
	
	$(document).ready(
		function() {
			$('button[name="deleteMovie"]').click(
				function() {

					var btnData = $('button.'+$(this).data('button'));

			        $.post( "../models/deleteMovie.jsp", btnData, function( data, status ) {
			        	
			            $("#msgMovieMenu").html("Filme excluido com sucesso!");
			            
			    	});
			        
				}
			);
		}	
	);
	
</script>

<% } %>