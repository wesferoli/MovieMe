<%@page import="classes.Usuario"%>
<%@page import="classes.Categorias"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int nivelToCheck = 0;

	if (userLogin > 0) {
		ResultSet user = new Usuario().selectBy("idUsuario", String.valueOf(userLogin));
		user.next();
		
		nivelToCheck = user.getInt("idNivelUsuario");
	}
%>

<nav class="secondary-navbar">
  <div class="secondary-navbar-content">
    <a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
      Lista de categorias
    </a>

    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <% 
      ResultSet categorias = new Categorias().selectAll();
  	
  	  while(categorias.next()) {
 	  	String categName = categorias.getString("categoria");
 	  	int categId = categorias.getInt("idCategoria");
    %>
      <li>
        <a class="dropdown-item" href="movieFilter.jsp?categoriaFilter=<%= categId %>">
       	  <%= categName %>
        </a>
      </li>
    <% } %>
    </ul>
    <% if (nivelToCheck > 1) { %>
	  <hr>
      <a href="addCategoria.jsp">Inserir Categoria</a>
	  <hr>
	  <a href="addMovie.jsp">Inserir Filmes</a>
    <% } %>
  </div>
</nav>