<%@page import="classes.Categorias"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int editCategoria = request.getParameter("editCategoria") == null ? 0 : Integer.parseInt(request.getParameter("editCategoria"));
	String categoriaNome = "";
	
	if (editCategoria > 0) {
		ResultSet categoriaSelect = new Categorias().select("idCategoria = " + editCategoria);
		categoriaSelect.next();
		
		categoriaNome = categoriaSelect.getString("categoria");
	}
%>
    
<div class="add-categoria-container">
  <div class="add-categoria-header">
    <h3>Adicionar Categoria</h3>
  </div>
  <form id="frmAddCategoria">
    <div class="categoria-field">
      <label>Nome Categoria</label>
      <br>
      <input type="hidden" name="idCategoria" id="idCategoria" value="<%= editCategoria %>">
      <input type="text" name="categoria" id="categoria" placeholder="Ex: Ação" value="<%= categoriaNome %>" maxlength="40">
    </div>
    
    <div id="msgAddCategoria" class="text-danger"></div>
      
    <input type="button" id="btnSendFrmAddCategoria" value="Adicionar"> 
  </form>
</div>