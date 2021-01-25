<%@page import="classes.Usuario"%>
<%@page import="classes.Filmes"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="image-grid-container">

<%

	ResultSet filmes = new Filmes().selectAll();

	while(filmes.next()) {
	
		int movieId = filmes.getInt("idFilme");
		String poster = filmes.getString("poster");
		String titulo = filmes.getString("nome");
		int ano = filmes.getInt("ano");

%>


  <div class="image-grid">
    <a href="movieDetail.jsp?movieId=<%= movieId %>">
      <img src="<%= poster %>">
      <div class="hover-effect">
        <p class="title"><%= titulo %></p>
        <p class="year"><%= ano %></p>
      </div>
    </a>
  </div>

<% } %>

</div>