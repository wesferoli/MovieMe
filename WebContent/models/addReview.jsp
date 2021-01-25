<%@page import="classes.Reviews"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%

	int idReview = Integer.parseInt(request.getParameter("idReview"));
	String titulo = request.getParameter("titulo");
	String review = request.getParameter("review");
	float nota = Float.parseFloat(request.getParameter("nota"));
	int idFilme = Integer.parseInt(request.getParameter("idFilme"));
	int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

	Reviews newReview = new Reviews(idReview, titulo, review, nota, idUsuario, idFilme);
	newReview.save();
	
%>
