<%@page import="classes.Usuario"%>
<%@page import="classes.Filmes"%>
<%@page import="classes.Categorias"%>
<%@page import="classes.NivelUsuarios"%>
<%@page import="classes.Reviews"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	ResultSet loggedUser = new Usuario().selectBy("idUsuario", String.valueOf(userLogin));
	loggedUser.next();
	
	int loggedUserNivel = loggedUser.getInt("idNivelUsuario");
%>

<div class="user-container">
  <div class="left-menu">
    <a href="#" id="reviews-button">Meus Reviews</a>
    <a href="#" id="profile-button">Editar Dados</a>
    <a href="#" id="password-change-button">Alterar Senha</a>
    <a href="#" id="users-button">Usuários</a>
    <a href="#" id="categorias-button">Categorias</a>
    <a href="#" id="movies-button">Filmes</a>
  </div>

  <div id="review-menu" class="menu">
    <div class="menu-header">
      <p>Filme</p>
      <p>Avaliação</p>
    </div>

    <div class="menu-content">
    
      <%
      
      	ResultSet review = new Reviews().selectBy("idUsuario", String.valueOf(userLogin));
      	
      	String loggedUserName = loggedUser.getString("nome");
      	String loggedUserEmail = loggedUser.getString("email");
      
      	while(review.next()) {
      		int reviewId = review.getInt("idReview");
      		float nota = review.getFloat("nota");
      		int idFilme = review.getInt("idFilme");
      		
      		ResultSet filme = new Filmes().selectBy("idFilme", String.valueOf(idFilme));
      		filme.next();
      		
      		String tituloFilme = filme.getString("nome");
      	
      %>
    
      <a href="reviewDetail.jsp?reviewId=<%= reviewId %>" >
        <ul class="review-list-container">
          <li><%= tituloFilme %></li>
          <li>
          	  <% for(float i = nota; nota > 0; nota--) {%>
          		<img src="../img/star.svg" alt="Estrela de Avaliação">
          	  <% } %>
          </li>
        </ul>
      </a>
      
      <% } %>
      
    </div>
  </div>

  <div id="profile-menu" class="menu not-active">
    <div class="user-menu-header">
      <p>Dados do Usuário</p>
    </div>

    <div class="menu-content">
      <form class="user-form" id="frmUserEdit">
		<div class="mb-3">
          <input type="hidden" name="userId" class="form-control" id="userId" value="<%= userLogin %>">
        </div>
        <div class="mb-3">
          <label for="Nome" class="form-label">Nome</label>
          <input type="text" name="name" class="form-control" id="name" value="<%= loggedUserName %>" maxlength="50"> 
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="email" name="email" class="form-control" id="email" value="<%= loggedUserEmail %>" maxlength="45">
        </div>
        <div class="button">
          <input type="button" id="btnSendFrmUserEdit" value="Alterar"> 
        </div>
      </form>
      <div id="msgUserEdit" class="text-danger"></div>
    </div>
  </div>
  
  <div id="password-change-menu" class="menu not-active">
    <div class="user-menu-header">
      <p>Alterar Senha</p>
    </div>

    <div class="menu-content">
      <form class="user-form" id="frmPasswordChange">
        <div class="mb-3">
          <label for="Nome" class="form-label">Nova Senha</label>
          <input type="password" name="newpass" class="form-control" id="newpass" maxlength="32">
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Confirmar Senha</label>
          <input type="password" name="confpass" class="form-control" id="confpass" maxlength="32">
        </div>
        <div class="button">
          <input type="button" id="btnSendFrmPasswordChange" value="Alterar Senha"> 
        </div>
      </form>
      <div id="msgPasswordChange" class="text-danger"></div>
    </div>
  </div>

  <div id="users-list-menu" class="menu not-active">
    <div class="user-menu-header">
      <p>Lista de Usuários</p>
    </div>

    <div class="menu-content">
    
      <%

		ResultSet usuarios = new Usuario().selectAll();
        int idUser = 0;
        String nome_usuario = "";
        String email = "";
        int id_nivel_atual = 0;
        
		while(usuarios.next()) {
			
			idUser = usuarios.getInt("idUsuario");
			nome_usuario = usuarios.getString("nome");
			email = usuarios.getString("email");
			id_nivel_atual = usuarios.getInt("idNivelUsuario");
			
	        ResultSet nivel_usuario = new NivelUsuarios().selectBy("idNivelUsuario", String.valueOf(id_nivel_atual));
	        nivel_usuario.next();
	        
	        String nivel = nivel_usuario.getString("nivel");
		
	  %>
	  
	  <div class="user-list-container">
        <p><%= nome_usuario %></p>
        <p><%= nivel %></p>
        <div class="user-buttons">

		  <a href="editUser.jsp?edit=<%= idUser %>">
		    <img src="..\img\edit.svg" alt="Editar">
		  </a>
		  
          <a 
            type="button" 
            data-bs-toggle="modal" 
            data-bs-target="#exampleModalDelete<%= idUser %>"
          >
            <img src="..\img\delete.svg" alt="Excluir">
          </a>
          
        </div>
      </div>
      
      <div class="modal fade" id="exampleModalDelete<%= idUser %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="exampleModalLongTitle">Excluir usuário</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body">
	          Realmente deseja excluir o usuário <%= nome_usuario %>?
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
	          <button 
	            id="delete-btn" 
	            name="delete" 
	            value="<%= idUser %>"
	            type="button" 
	            class="btn opc<%= idUser %>"
	            data-button="opc<%= idUser %>"
	            data-bs-dismiss="modal"
	          >
	            Sim
	          </button>
	        </div>
	      </div>
	    </div>
   	  </div>
   	  
      <% } %>
      
	  <p id="msgUserMenu" class="text-danger"></p>

    </div>
  </div>
  
  <div id="categorias-list-menu" class="menu not-active">
    <div class="user-menu-header">
      <p>Lista de Categorias</p>
    </div>

    <div class="menu-content">
  
      <%

          ResultSet categoriaSelect = new Categorias().selectAll();
      
          int idCategoria = 0;
          String nomeCategoria = "";
      
          while(categoriaSelect.next()) {
		
	        idCategoria = categoriaSelect.getInt("idCategoria");
		    nomeCategoria = categoriaSelect.getString("categoria");

       %>
 
       <div class="categorias-list-container">
         <p><%= nomeCategoria %></p>
        
         <div class="categorias-buttons">
           <a href="addCategoria.jsp?editCategoria=<%= idCategoria %>">
             <img src="..\img\edit.svg" alt="Editar">
           </a>

           <a 
             type="button" 
             data-bs-toggle="modal" 
             data-bs-target="#categoriaDeleteModal<%= idCategoria %>"
           >
             <img src="..\img\delete.svg" alt="Excluir">
           </a>
         </div>
      </div>
    
      <div class="modal fade" id="categoriaDeleteModal<%= idCategoria %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Excluir Categoria</h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              Realmente deseja excluir a categoria <%= nomeCategoria %>?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
              <button 
                id="delete-btn" 
                name="deleteCategoria" 
                value="<%= idCategoria %>"
                type="button" 
                class="btn opc<%= idCategoria %>"
                data-button="opc<%= idCategoria %>"
                data-bs-dismiss="modal"
              >
                Sim
              </button>
           </div>
         </div>
       </div>
 	 </div>
 	  
     <% } %>
    
     <p id="msgCategoriasMenu" class="text-danger"></p>

    </div>
  </div>
  
  <div id="movies-list-menu" class="menu not-active">
    <div class="user-menu-header">
      <p>Lista de Filmes</p>
    </div>

    <div class="menu-content">
  
      <%

          ResultSet movieSelect = new Filmes().selectAll();
      
          int idFilme = 0;
          String nomeFilme = "";
          int anoFilme = 0;
          
          int idCategoriaFilme = 0;
          String nomeCategoriaFilme = "";
      
          while(movieSelect.next()) {
        	  
        	idFilme = movieSelect.getInt("idFilme");
        	nomeFilme = movieSelect.getString("nome");
        	anoFilme = movieSelect.getInt("ano");
		
        	idCategoriaFilme = movieSelect.getInt("idCategoria");
        	ResultSet categoriaFilme = new Categorias().select("idCategoria = " + idCategoriaFilme);
        	categoriaFilme.next();
        	nomeCategoriaFilme = categoriaFilme.getString("categoria");

       %>
 
       <div class="movies-list-container">
         <p><%= nomeFilme %></p>
         <p><%= anoFilme %></p>
         <p><%= nomeCategoriaFilme %></p>
        
         <div class="movies-buttons">
           <a href="addMovie.jsp?editMovie=<%= idFilme %>">
             <img src="..\img\edit.svg" alt="Editar">
           </a>

           <a 
             type="button" 
             data-bs-toggle="modal" 
             data-bs-target="#movieDeleteModal<%= idFilme %>"
           >
             <img src="..\img\delete.svg" alt="Excluir">
           </a>
         </div>
       </div>
    
       <div class="modal fade" id="movieDeleteModal<%= idFilme %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLongTitle">Excluir Categoria</h5>
	           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
               Realmente deseja excluir o filme <%= nomeFilme %>?
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
               <button 
                 id="delete-btn" 
                 name="deleteMovie" 
                 value="<%= idFilme %>"
                 type="button" 
                 class="btn opc<%= idFilme %>"
                 data-button="opc<%= idFilme %>"
                 data-bs-dismiss="modal"
               >
                 Sim
               </button>
             </div>
           </div>
         </div>
 	   </div>
 	  
       <% } %>
    
       <p id="msgMovieMenu" class="text-danger"></p>

     </div>
   </div>
  
</div>