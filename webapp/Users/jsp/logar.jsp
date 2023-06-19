<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UsuarioDao" %>
<% 
	UsuarioDao login = new UsuarioDao();
	boolean ok = false;	

	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	
	ok = login.login(email, senha);
	
	if(ok){
		int id = login.UserByLogin(email, senha);
		if (id == 0){
			session.setAttribute("id_user",-1);
			response.sendRedirect("../singin.html");
		} else {
			session.setAttribute("id_user",id);
			response.sendRedirect("../../Pedidos/dash/Pedidos.jsp");
		}
	} else {
			session.setAttribute("id_user",-1);
			response.sendRedirect("../singin.html");
	}
%>