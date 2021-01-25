<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file='userSession.jsp'%>

<%
	
	String newpass = request.getParameter("newpass");
	String confpass = request.getParameter("confpass");
	
	String saida = "";
	
	if (newpass == "" || confpass == "") {
		saida = "Preencha os campos acima!";
		out.write(saida);
	} else {
		if (newpass.equals(confpass)) {
			
			ResultSet user = new Usuario("").selectBy("idUsuario", String.valueOf(userLogin));
			
			user.next();
			String email = user.getString("email");
			int nivel = user.getInt("idNivelUsuario");
			String nome = user.getString("nome");
			String foto = user.getString("foto");
			
			Usuario userInsert = new Usuario (userLogin, email, nivel, newpass, nome, foto, "S");
	
			userInsert.save();
			
			saida = "Senha alterada com sucesso!";
			
			out.write(saida);
			
		} else {
			saida = "Campos não estão preenchidos igualmente!";
			out.write(saida);
		}
	}
	
%>
