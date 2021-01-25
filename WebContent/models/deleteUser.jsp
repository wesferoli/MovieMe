<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idToDelete = Integer.parseInt(request.getParameter("delete"));

	Usuario userDelete = new Usuario(idToDelete, "", 0, "", "", "", "");
	
	userDelete.delete();
%>