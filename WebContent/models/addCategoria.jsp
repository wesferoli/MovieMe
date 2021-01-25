<%@page import="classes.Categorias"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
	String categoria = request.getParameter("categoria");
	
	Categorias newCategoria = new Categorias(idCategoria, categoria);
	newCategoria.save();
%>