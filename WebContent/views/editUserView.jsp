<%@page import="classes.Usuario"%>
<%@page import="classes.NivelUsuarios"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	int idToEdit = Integer.parseInt(request.getParameter("edit"));

	ResultSet userToEdit = new Usuario().selectBy("idUsuario", String.valueOf(idToEdit));
	userToEdit.next();
	
	String userToEditName = userToEdit.getString("nome");
	String userToEditEmail = userToEdit.getString("email");

%>

<div class="cadastro-container">
  <div class="cadastro-header">
    <h3>Dados do Usuário</h3>
  </div>
  <form id="frmUserEdit">
  	<div class="mb-3">
      <input type="hidden" name="userId" id="userId" class="form-control" value="<%= idToEdit %>">
    </div>
    <div class="name-field">
      <label>Nome</label>
      <br>
      <input type="text" name="name" id="name" value="<%= userToEditName %>" placeholder="Wesley Ferreira">
    </div>
    <div class="email-field">
      <label>Email</label>
      <br>
      <input type="text" name="email" id="email" value="<%= userToEditEmail %>" placeholder="email@gmail.com">
    </div>
    <div class="nivel-field">
      <label for="nivel" class="form-label">Nivel</label>
      <select name="nivel" class="form-control">
   	  <%
   	  	  ResultSet nivelList = new NivelUsuarios().selectAll();
    		  
   	 	  while(nivelList.next()) {
   	 		  int idNivelUser = nivelList.getInt("idNivelUsuario");
   	 		  String nivelUser = nivelList.getString("nivel");
   	  %>
    	<option value="<%= idNivelUser %>"><%= nivelUser %></option>
	  <% } %>
      </select>
    </div>
    <input type="button" id="btnSendFrmUserEdit" value="Alterar"> 
  </form>
  <div id="msgUserEdit" class="text-danger"></div>
</div>
