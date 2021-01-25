<%@page import="classes.Filmes"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idFilme = Integer.parseInt(request.getParameter("idFilme"));
    String titulo = request.getParameter("titulo");
	int categoria = Integer.parseInt(request.getParameter("categoria"));
	String descricao = request.getParameter("descricao");
	int ano = Integer.parseInt(request.getParameter("ano"));
	String atores = request.getParameter("atores");
	String diretores = request.getParameter("diretores");
	String imagem = request.getParameter("imagem");
	
	Filmes newMovie = new Filmes(idFilme, titulo, categoria, descricao, ano, atores, diretores, imagem);
	newMovie.save();
%>