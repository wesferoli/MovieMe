<%@page import="classes.Filmes"%>
<%@page import="classes.Categorias"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int editMovie = request.getParameter("editMovie") == null ? 0 : Integer.parseInt(request.getParameter("editMovie"));
	String movieTitulo = "";
	String movieDescricao = "";
	int movieAno = 0;
	String movieAtores = "";
	String movieDiretores = "";
	String movieFoto = "";
	
	if (editMovie > 0) {
		ResultSet movieSelect = new Filmes().select("idFilme = " + editMovie);
		movieSelect.next();
		
		movieTitulo = movieSelect.getString("nome");
		movieDescricao = movieSelect.getString("descricao");
		movieAno = movieSelect.getInt("ano");
		movieAtores = movieSelect.getString("atores");
		movieDiretores = movieSelect.getString("diretores");
		movieFoto = movieSelect.getString("poster");
	}
%>

<div class="add-movie-container">
  <div class="add-movie-header">
    <h3>Adicionar Filme</h3>
  </div>
  <form id="frmAddMovie" enctype="multipart/form-data">
    <div class="name-field">
      <label>Titulo</label>
      <br>
      <input type="hidden" name="idFilme" id="idFilme" value="<%= editMovie %>">
      <input type="text" name="titulo" id="titulo" placeholder="Ex: Os Incriveis 2" value="<%= movieTitulo %>" maxlength="50">
    </div>
    <div class="categoria-field">
      <label class="form-label">Categoria</label>
      <select name="categoria" class="form-control">
        <option value="">----------------</option>
   	  <%
   	  	  ResultSet categoriasList = new Categorias().selectAll();
    		  
   	 	  while(categoriasList.next()) {
   	 		  int idCategoria = categoriasList.getInt("idCategoria");
   	 		  String nomeCategoria = categoriasList.getString("categoria");
   	  %>
    	<option value="<%= idCategoria %>"><%= nomeCategoria %></option>
	  <% } %>
      </select>
    </div>
    <div class="descricao-field">
      <label>Descrição</label>
      <br>
      <textarea form="frmAddMovie" name="descricao" id="descricao" placeholder="Sinópse do filme"><%= movieDescricao %></textarea>
    </div>
    <div class="ano-field">
      <label>Ano</label>
      <br>
      <input type="text" name="ano" id="ano" placeholder="Ano de Lançamento" value="<%= movieAno %>" maxlength="4">
    </div>
    <div class="atores-field">
      <label>Atores</label>
      <br>
      <input type="text" name="atores" id="atores" placeholder="Ator1, Ator2, Ator3, ..." value="<%= movieAtores %>" maxlength="45">
    </div>
    <div class="diretores-field">
      <label>Diretores</label>
      <br>
      <input type="text" name="diretores" id="diretores" placeholder="Diretor1, Diretor2, Diretor3, ..." value="<%= movieDiretores %>">
    </div>
    <div class="poster-field">
      <label>Poster</label>
      <br>
      <input class="form-control" type="file" name="poster" id="poster" onchange="uploadPoster();"/>
      <input type="hidden" id="target" name="imagem" value="<%= movieFoto %>"/>
    </div>
    
    <div id="msgAddMovie" class="text-danger"></div>
      
    <input type="button" id="btnSendFrmAddMovie" value="Adicionar"> 
  </form>
</div>