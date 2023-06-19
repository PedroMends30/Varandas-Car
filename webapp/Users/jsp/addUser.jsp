<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="dao.UsuarioDao" %>
<%@ page import="model.Usuario" %>
<% 
	boolean ok = false;

	Usuario novo = new Usuario();
	novo.setNome_usuario(request.getParameter("nome"));
	novo.setEmail_usuario(request.getParameter("email"));
	novo.setTelefone_usuario(request.getParameter("fone"));
	novo.setSenha_usuario(request.getParameter("senha"));
	
	UsuarioDao dao = new UsuarioDao();
	ok = dao.inserirUsuario(novo);
	if (ok){%>
	<script type="text/javascript">
		alert("Usuario cadastrado com sucesso");
		window.location.href = "../singin.html";
		
	</script>
	<%}else{%>
	<script type="text/javascript">
		alert("Erro ao cadastrar Usuario!!");
		window.location.href = "../singin.html";
	</script>
	<%}%>