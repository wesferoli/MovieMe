<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	int userLogin = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");

%>