<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
<% 
	boolean ok = false;
	UsuarioDao login = new UsuarioDao();
	Usuario user = new Usuario();
	Integer id_user = (Integer) session.getAttribute("id_user");
	try{
		if (id_user == -1 || id_user == null){
			response.sendRedirect("../../Users/jsp/singin.html");
		} else {
			try {
				user = login.retornaUsuario(id_user);
				
			} catch (NullPointerException e) {
				 out.println("Erro");
			}
		}
	}catch (NullPointerException e) {
		response.sendRedirect("../../Users/singin.html");
	}
	
	
	if (request.getParameter("id_veiculo") != null){
		VeiculoDao delete = new VeiculoDao();
		ok = delete.apagarVeiculo(Integer.parseInt(request.getParameter("id_veiculo")));
	}
	
	if(ok){%>
	<script type="text/javascript">
		alert("Veículo Deletado com sucesso")
		window.location.href="../../Pedidos.jsp"
	</script>
	
	<%} else {%>
	<script type="text/javascript">
		alert("Erro ao apagar Veículo")
		window.location.href="../../Pedidos.jsp"
	</script>
	<%}%>