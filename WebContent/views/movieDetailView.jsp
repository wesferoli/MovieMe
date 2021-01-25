<%@page import="classes.Usuario"%>
<%@page import="classes.Categorias"%>
<%@page import="classes.Reviews"%>
<%@page import="classes.Filmes"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	ResultSet detailUser = new Usuario().select("idUsuario = " + userLogin);
	int userNivelCheck = 0;
	
	if (detailUser.next()) {
		userNivelCheck = detailUser.getInt("idNivelUsuario");
	}
	
	int movieId = Integer.parseInt(request.getParameter("movieId"));
	ResultSet movie = new Filmes().select("idFilme = " + movieId);
	movie.next();
	
	String movieNome = movie.getString("nome");
	String movieAno = movie.getString("ano");
	String movieDescricao = movie.getString("descricao");
	String movieDiretores = movie.getString("diretores");
	String movieAtores = movie.getString("atores");
	String movieFoto = movie.getString("poster");
	
	int categId = movie.getInt("idCategoria");
	ResultSet categoria = new Categorias().select("idCategoria = " + categId);
	categoria.next();
	String categoriaName = categoria.getString("categoria");
	
%>
    
<div class="movie-detail-container">
  <div class="poster-container">
    <img class="movie-img" src="<%= movieFoto %>" alt="<%= movieNome %>">

    <div class="movie-detail-nota-buttons">
    <% if ( userNivelCheck > 1 ) { %>
      <a href="addMovie.jsp?editMovie=<%= movieId %>">Editar Filme</a>
     <button 
       type="button" 
       data-bs-toggle="modal" 
       data-bs-target="#deleteMovieModal"
       >
        Remover Filme
      </button>
    <% } %>
      <a href="addReview.jsp?movieId=<%= movieId %>" class="private">Avaliar Filme</a>
    </div>
  </div>

  <div class="movie-info-container">

    <div class="movie-info-header">
      <h2 class="title"><%= movieNome %></h2>

      <div class="movie-info-subheader">
        <h5><%= movieAno %></h5>
        <hr>
        <h5><%= categoriaName %></h5>
      </div>
    </div>

    <hr>

    <div class="movie-info-about">
      <p><%= movieDescricao %></p>
    </div>

    <hr>

    <div class="movie-info-team">
      <p class="title">Direção/Produção:</p>
      <p><%= movieDiretores %></p>

      <p class="title">Elenco:</p>
      <p><%= movieAtores %></p>
    </div>
  </div>

  <div class="movie-info-reviews">
    <hr>

    <h2 class="title">Reviews</h2>
    
    <hr>
	
	<% 
	  ResultSet reviews = new Reviews().selectBy("idFilme", String.valueOf(movieId));
	
	  while (reviews.next()) { 
		
		int reviewId = reviews.getInt("idReview");
		int reviewUserId = reviews.getInt("idUsuario");
		String reviewTitle = reviews.getString("titulo");
		
		ResultSet reviewUser = new Usuario().select("idUsuario = " + reviewUserId);
		reviewUser.next();
		String reviewUserName = reviewUser.getString("nome");
				
		float movieNota = reviews.getFloat("nota");
		
	%>
	
    <a href="reviewDetail.jsp?reviewId=<%= reviewId %>" class="movie-info-reviews-container private">
        <h5 class="title"><%= reviewUserName %></h5>
        <h5 class="review-title"><%= reviewTitle %></h5>
        <div class="reviews-images">
          <% for (float i = movieNota; movieNota > 0; movieNota--) { %>
     	    <img src="../img/star.svg" alt="Estrela de Avaliação">
          <% } %>
        </div>
    </a>
    <% } %>
  </div>
  
  <div class="modal fade" id="deleteMovieModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
	  <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLongTitle">Excluir Filme</h4>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Realmente deseja excluir o filme <%= movieNome %>?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
          <button 
            id="btnDeleteMovie" 
            name="deleteMovie" 
            value="<%= movieId %>"
            type="button" 
            class="btn"
            data-bs-dismiss="modal"
          >
            Sim
          </button>
        </div>
      </div>
    </div>
  </div>
</div>