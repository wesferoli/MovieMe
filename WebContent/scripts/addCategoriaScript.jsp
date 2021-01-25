<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	$(document).ready( 
		function() {
			$("#btnSendFrmAddCategoria").click(
				function() {

					var frmData = $("#frmAddCategoria").serialize();
			        $.post( "../models/addCategoria.jsp", frmData, function( data, status ) {
			        	
			            $("#msgAddCategoria").html("Categoria inserido com sucesso!");
			            
			    	});
			        
				}
			);
		}
	);
</script>
