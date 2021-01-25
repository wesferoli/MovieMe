<%@page import="classes.Filmes"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idToDelete = Integer.parseInt(request.getParameter("deleteMovie"));
	
	Filmes movieDelete = new Filmes(idToDelete);
	
	movieDelete.delete();
%>