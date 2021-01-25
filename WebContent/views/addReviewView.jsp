<%@page import="classes.Reviews"%>
<%@page import="classes.Filmes"%>
<%@page import="classes.Categorias"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int editReview = request.getParameter("editReview") == null 
		? 0 
		: Integer.parseInt(request.getParameter("editReview"));

	String reviewTitulo = "";
	String reviewText = "";
	int reviewNota = 0;
	int reviewUser = userLogin;
	
	int movieToReview = request.getParameter("movieId") == null ? 0 : Integer.parseInt(request.getParameter("movieId"));
	
	ResultSet movieSelect = new Filmes().select("idFilme = " + movieToReview);
	movieSelect.next();
	
	String movieTitulo = movieSelect.getString("nome");
	int movieAno = movieSelect.getInt("ano");
	String movieDescricao = movieSelect.getString("descricao");
	int movieCategoriaId = movieSelect.getInt("idCategoria");
	String movieFoto = movieSelect.getString("poster");
	
	ResultSet categoriaSelect = new Categorias().select("idCategoria = " + movieCategoriaId);
	categoriaSelect.next();
	
	String movieCategoriaNome = categoriaSelect.getString("categoria");
	
	if (editReview > 0) {
		ResultSet reviewSelect = new Reviews().select("idReview = " + editReview);
		reviewSelect.next();
		
		reviewTitulo = reviewSelect.getString("titulo");
		reviewText = reviewSelect.getString("review");
		reviewNota = reviewSelect.getInt("nota");
		reviewUser = reviewSelect.getInt("idUsuario");
	}
%>

<div class="add-review-container">
  <div class="add-review-header">
    <img src="<%= movieFoto %>" alt="<%= movieTitulo %>">
    <div class="year-categ-container">
      <h2><%= movieTitulo %></h2>
      
      <div class="year-categ">
        <h6><%= movieAno %></h6>
        <hr>
        <h6><%= movieCategoriaNome %></h6>
      </div>
      
      <hr>
      
      <h6><%= movieDescricao %></h6>
    </div>
  </div>
  
  <hr>
  
  <div class="add-review-form">
  	<form id="frmAddReview">
  	  <label>Avaliação</label>
  	  <div class="star-inputs">
  	    <input type="radio" id="star5" name="nota" value="5" /><label for="star5"></label>
  	  	<input type="radio" id="star4" name="nota" value="4" /><label for="star4"></label>
  	    <input type="radio" id="star3" name="nota" value="3" /><label for="star3"></label>
  	    <input type="radio" id="star2" name="nota" value="2" /><label for="star2"></label>
  	    <input type="radio" id="star1" name="nota" value="1" /><label for="star1"></label>
  	  	
  	  </div>
  	  <div>
  	  	<label>Título</label>
  	  	<input type="hidden" name="idReview" id="idReview" value="<%= editReview %>">
  	  	<input type="text" name="titulo" id="titulo" placeholder="Adicione um titulo a sua review" value="<%= reviewTitulo %>" maxlength="60">
  	  </div>
  	  <div>
  	  	<label>Review</label>
  	  	<textarea form="frmAddReview" name="review" id="review" placeholder="Digite aqui sua review"><%= reviewText %></textarea>
  	  </div>
  	  <div>
		<input type="hidden" name="idFilme" id="idFilme" value="<%= movieToReview %>">
  	  </div>
  	  <div>
		<input type="hidden" name="idUsuario" id="idUsuario" value="<%= reviewUser %>">
  	  </div>
  	  
  	  <div id="msgAddReview" class="text-danger"></div>
      
      <div class="button">
        <input type="button" id="btnSendFrmAddReview" value="Adicionar">
      </div>
      
  	</form>
  </div>
</div>