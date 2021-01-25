<%@page import="classes.Categorias"%>
<%@page import="classes.Filmes"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	int categoriaFilter = Integer.parseInt(request.getParameter("categoriaFilter"));
	
	ResultSet categSelect = new Categorias().select("idCategoria = " + categoriaFilter);
	categSelect.next();
	String categName = categSelect.getString("categoria");
%>
   
<div class="search-description">
  <h3>
  	Filtro da categoria "<%= categName %>"
  </h3>
</div> 
    
<div class="search-container">

<% 
	ResultSet movieSelect = new Filmes().select("idCategoria = " + categoriaFilter);
	int movieId = 0;
	String movieTitle = "";
	int movieAno = 0;
	String moviePoster = "";
	
	while (movieSelect.next()) {
		movieId = movieSelect.getInt("idFilme");
		movieTitle = movieSelect.getString("nome");
		movieAno = movieSelect.getInt("ano");
		moviePoster = movieSelect.getString("poster");
%>

  <div class="image-grid">
    <a href="movieDetail.jsp?movieId=<%= movieId %>">
      <img src="<%= moviePoster %>">
      <div class="hover-effect">
        <p class="title"><%= movieTitle %></p>
        <p class="year"><%= movieAno %></p>
      </div>
    </a>
  </div>
  
  <% } %>
  
</div>