<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
<% 
	VeiculoDao vdao = new VeiculoDao();
	Veiculo v = new Veiculo();
	AutoPecaDao adao = new AutoPecaDao();
	AutoPeca auto = new AutoPeca();
	
	v.setId_usuario((int)session.getAttribute("id_user"));
	v.setMontadora_veiculo(request.getParameter("montadora"));
	v.setModelo_veiculo(request.getParameter("modelo"));
	v.setAno_veiculo(Integer.parseInt(request.getParameter("ano")));
	
	auto.setNome_peca(request.getParameter("nome_peca"));
	auto.setId_veiculo(vdao.idVeiculoAutoPeca());
	auto.setData_peca(request.getParameter("data"));
	auto.setCor_peca(request.getParameter("cor"));
	auto.setVolume_peca(Double.parseDouble(request.getParameter("volume")));
	auto.setDesc_peca(request.getParameter("descricao"));

	if (vdao.inserirVeiculo(v) && adao.inserirPeca(auto)){%>	
	<script>
		alert("Pedido cadastrado com sucesso")
		window.location.href="../../Personalizar.jsp";
	</script>
	<%} else {%>
	<script type="text/javascript">
		alert("Ocorreu um erro ao inserir novo pedido")
		window.location.href="../../Personalizar.jsp";
	</script>
		
	<%}%>