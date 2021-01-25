<%@page import="classes.Usuario"%>
<%@page import="database.DBQuery"%>
<%@page import="multitool.RandomCode"%>
<%@page import="mail.SendMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//  faz a recepção de dados
	String email = request.getParameter("email");
	String nome = request.getParameter("name");
	if (email == null)
		email = "";
	
	// gera senha aleatoria
	String senha = new Usuario ( email ).newPassword();
	
	// insere usuario no banco
    Usuario user = new Usuario ( 0, email, 1, senha, nome, "default-user.png", "N");
	user.save();
	
	//  por onde eu vou mandar esse email
	String smtpHost = "smtp.gmail.com"; 
	String smtpPort = "587"; 
	String username = "teste.pwe@gmail.com";
	String password = "Teste4152";
	String auth     = "tls";
	SendMail sendMail =  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
	
	// a mensagem do email e pra quem vou enviar
	String mailFrom 	= "teste.pwe@gmail.com"; 
 	String mailTo 		= email; 
 	String mailSubject 	= "Cadastro MovieMe"; 
 	String mailBody 	= " Bem vindo(a) ao MovieMe, " + nome + "!\nSua senha provisória é " + senha; 
	sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
	
	String message = "Senha gerada automaticamente enviada para o email "+ mailTo +"";
	
	out.write(message);

%>
