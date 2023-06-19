<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.UsuarioDao" %>
<%  
 	UsuarioDao d = new UsuarioDao();
 	
 	boolean ok = d.verificaCampo("email_usuario", request.getParameter("email_user"));

	if(ok){
%>
	{
		"name_disponibility":false
	}
<%} else {%>
	{
		"name_disponibility":true
	}
<%}%>