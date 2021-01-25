<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int userIdEdit = Integer.parseInt(request.getParameter("userId"));
	String nome = request.getParameter("name");
	String email = request.getParameter("email");
	
	ResultSet user = new Usuario().selectBy("idUsuario", String.valueOf(userIdEdit));
	user.next();
	
	int nivelUser = request.getParameter("nivel") == null 
		? user.getInt("idNivelUsuario")
		: Integer.parseInt(request.getParameter("nivel"));
	
	String pass = user.getString("senha");
	String photo = user.getString("foto");
	String ativo = user.getString("ativo");
	
	Usuario userToEdit = new Usuario(userIdEdit, email, nivelUser, pass, nome, photo, ativo);
	userToEdit.save();
	
	out.write("Usuário alterado com sucesso!");
%>