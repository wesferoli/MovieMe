<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	String nome = "";
	String foto = "";
	
	if (userLogin > 0) {
		ResultSet user = new Usuario().selectBy("idUsuario", Integer.toString(userLogin));
		
		user.next();
		nome = user.getString("nome");
		foto = user.getString("foto");
	}
	
%>

<header id="header">
  <a href="landingPage.jsp" class="logo">MovieMe</a>

  <form class="search">
    <input type="text" placeholder="Procure filmes ou categorias">
    <button type="button"><i class="fa fa-search"></i></button>
  </form>

  <ul id="user-container">
    <li class="user-button"><a href="cadastro.jsp" id="sign-up">Cadastre-se</a></li>
    <li class="user-button"><a href="login.jsp" id="sign-in">Login</a></li>
  </ul>

  <div id="logged-user-container">
    <p><%= nome %></p>
    <a class="dropdown" 
       href="#" 
       role="button" 
       id="dropdownMenuLink" 
       data-bs-toggle="dropdown" 
       aria-expanded="false"
    >
      <img src="../img/<%= foto %>" alt="Foto do usuário">
    </a>
    
    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" id="user-menu-collapse">
      <a href="userMenu.jsp" class="profile">Meu perfil</a>
  	  <button class="logout" id="desconectar" type="button" value="0">Desconectar</button>
    </div>
  </div>
</header>
