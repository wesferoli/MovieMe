<%@page import="classes.Usuario"%>
<%@page import="classes.Categorias"%>
<%@page import="classes.Reviews"%>
<%@page import="classes.Filmes"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	
	// Dados Review
	int reviewId = Integer.parseInt(request.getParameter("reviewId"));
	ResultSet review = new Reviews().select("idReview = " + reviewId);
	review.next();
	
	String reviewTitulo = review.getString("titulo");
	String reviewText = review.getString("review");
	int reviewNota = review.getInt("nota");
	int reviewUserId = review.getInt("idUsuario");
	int reviewMovieId = review.getInt("idFilme");
	
	// Nome Usuario
	ResultSet reviewUser = new Usuario().select("idUsuario = " + reviewUserId);
	reviewUser.next();
	
	String reviewUserName = reviewUser.getString("nome");
	String reviewUserFoto = reviewUser.getString("foto");

	// Dados Filme
	ResultSet reviewMovie = new Filmes().select("idFilme = " + reviewMovieId);
	reviewMovie.next();
	
	String moviePoster = reviewMovie.getString("poster");
	String movieNome = reviewMovie.getString("nome");
	String movieDescricao = reviewMovie.getString("descricao");
	int movieAno = reviewMovie.getInt("ano");
	// Categoria
	int movieCategoria = reviewMovie.getInt("idCategoria");
	ResultSet categoriaNome = new Categorias().select("idCategoria = " + movieCategoria);
	categoriaNome.next();
	
	String movieCateg = categoriaNome.getString("categoria");
	
%>

<div class="movie-detail-container">
  <div class="poster-container">
    <img class="movie-img" src="<%= moviePoster %>" alt="<%= movieNome %>">

    <div class="movie-detail-nota-buttons">
      <a href="addReview.jsp?movieId=<%= reviewMovieId %>">Avaliar Filme</a>
    </div>
  </div>

  <div class="movie-info-container">

    <div class="movie-info-header">
      <h2 class="title"><%= movieNome %></h2>

      <div class="movie-info-subheader">
        <h5><%= movieAno %></h5>
        <hr>
        <h5><%= movieCateg %></h5>
      </div>
    </div>

    <hr>

    <div class="movie-info-about">
      <p><%= movieDescricao %></p>
    </div>

    <hr>
    
  </div>
  
  <div class="movie-info-reviews">
    <hr>
    
	<div class="review-title">
	
	  <h2 class="title"><%= reviewTitulo %></h2>
	  
	  <div id="reviewButtons">
	  	<a href="addReview.jsp?editReview=<%= reviewId %>&movieId=<%= reviewMovieId %>">
          <img src="..\img\edit.svg" alt="Editar">
        </a>
        
        <a 
	      type="button" 
	      data-bs-toggle="modal" 
	      data-bs-target="#reviewDeleteModal<%= reviewId %>"
	    >
	      <img src="..\img\delete.svg" alt="Excluir">
	    </a>
	  </div>
      
	</div>

    <hr>
	
	<div class="review-user-container">
	
	  <div class="review-user">
		<img alt="Foto do criador da Review" src="../img/<%= reviewUserFoto %>">
		<p><%= reviewUserName %></p>
	  </div>

      <div class="review-nota">
		<p>Avaliação: </p>
        <% for (float i = reviewNota; reviewNota > 0; reviewNota--) { %>
     	  <img id="star" src="../img/star.svg" alt="Estrela de Avaliação">
        <% } %>
      </div>
	</div>
	
	<hr>
	
	<div class="review-text">
	  <p><%= reviewText %></p>
	</div>
	
    <div class="modal fade" id="reviewDeleteModal<%= reviewId %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLongTitle">Excluir Review</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            Realmente deseja excluir essa review?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
            <button 
              id="btnDeleteReview" 
              name="deleteReview" 
              value="<%= reviewId %>"
              type="button" 
              class="btn opc<%= reviewId %>"
              data-button="opc<%= reviewId %>"
              data-bs-dismiss="modal"
            >
              Sim
            </button>
          </div>
        </div>
      </div>
    </div>
	
  </div>
  
</div>