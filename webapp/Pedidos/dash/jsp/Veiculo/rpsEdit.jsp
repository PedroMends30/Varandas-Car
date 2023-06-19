<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="model.*" %>
<% 
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

	boolean ok = false;

	Veiculo editadoV = new Veiculo();
	AutoPeca editadoA = new AutoPeca();
	VeiculoDao editadoVDao = new VeiculoDao();
	AutoPecaDao editadoADao = new AutoPecaDao();
	
	editadoV.setId_veiculo(Integer.parseInt(request.getParameter("id")));
	editadoV.setId_usuario(id_user);
	editadoV.setMontadora_veiculo(request.getParameter("montadora"));
	editadoV.setModelo_veiculo(request.getParameter("modelo"));
	editadoV.setAno_veiculo(Integer.parseInt(request.getParameter("ano")));
	
	editadoA.setId_peca(editadoV.getId_veiculo());
	editadoA.setId_veiculo(editadoV.getId_veiculo());
	editadoA.setNome_peca(request.getParameter("nome_peca"));
	editadoA.setVolume_peca(Double.parseDouble(request.getParameter("volume")));
	editadoA.setCor_peca(request.getParameter("cor"));
	editadoA.setDesc_peca(request.getParameter("descricao"));
	editadoA.setData_peca(request.getParameter("data"));
	
	out.println("id_peca: "+editadoA.getId_peca());
	out.println("<hr>");
	out.println("id_veiculo: "+editadoA.getId_veiculo());
	out.println("<hr>");
	out.println("nome_peca: "+editadoA.getNome_peca());
	out.println("<hr>");
	out.println("volume_peca: "+editadoA.getVolume_peca());
	out.println("<hr>");
	out.println("desc_peca: "+editadoA.getDesc_peca());
	out.println("<hr>");
	out.println("data_peca: "+editadoA.getData_peca());
	out.println("<hr>");
	
	if (editadoVDao.editarVeiculo(editadoV) && editadoADao.editarPeca(editadoA)){%>
		<script type="text/javascript">
			alert("Veículo Editado com Sucesso!")
			window.location.href = "../../Pedidos.jsp"
		</script>
	<%}	else {%>
		<script type="text/javascript">
			alert("Ocorreu um erro ao editar o Veículo!!")
			window.location.href = "../../Pedidos.jsp"
		</script>
	<%} %>