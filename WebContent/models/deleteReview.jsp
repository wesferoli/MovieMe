<%@page import="classes.Reviews"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idToDelete = Integer.parseInt(request.getParameter("deleteReview"));
	
	Reviews reviewDelete = new Reviews(idToDelete);
	
	reviewDelete.delete();
%>