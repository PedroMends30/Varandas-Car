<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
    
<%
		ArrayList<Veiculo> vs = new ArrayList<Veiculo>();
		ArrayList<AutoPeca> ps = new ArrayList<AutoPeca>();
		VeiculoDao vdao = new VeiculoDao();
		AutoPecaDao p = new AutoPecaDao();
		
		
		UsuarioDao login = new UsuarioDao();
		Usuario user = new Usuario();
		Integer id_user = (Integer) session.getAttribute("id_user");
		try{
			if (id_user == -1 || id_user == null){
				response.sendRedirect("../../Users/jsp/singin.html");
			} else {
				try {
					user = login.retornaUsuario(id_user);
					vs = vdao.veiculosUser(id_user); 
				} catch (NullPointerException e) {
					 out.println("Erro");
				}
			}
		}catch (NullPointerException e) {
			response.sendRedirect("../../Users/singin.html");
		}
	%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../src/dashboard.css">
<script defer="" src="scripts/dashboard.js"></script>
<link rel="shortcut icon" href="src/FaviconDashboard.svg"
	type="image/x-icon">
<title>Dashboard | Varanda's Autopeças</title>
</head>
<body>


	<header class="menuLateral">
		<img src="https://raw.githubusercontent.com/PedroMends30/img/main/LogoDashboard.svg" alt="">

		<div class="servicos">
			<h2>Serviços</h2>
			<a href="Pedidos.jsp" class="linkaction l1 active">Meus Pedidos</a>
			<a href="Personalizar.jsp" class="linkaction l2">Personalizar</a> <a
				href="Loja.jsp" class="linkaction l3">Loja</a>
				<a href="Conta.jsp" class="linkaction l4">Minha Conta</a>

		</div>

		<a href="../../Users/jsp/deslogar.jsp" class="sair">Sair</a>
	</header>
	<div class="alinhamento"></div>
	<main class="pagina">
		<div class="info">
			<h1 id="titulo">Meus Pedidos</h1>
			<div class="span-hight">
				<span class="profile">
					<h5 id="persona"><%=user.getNome_usuario() %></h5>
					<h6 id="member-status">Membro Gold</h6>
				</span> <span class="notifications"> <img src="src/SinoIcon.svg"
					alt="">
				</span>
			</div>
		</div>
		<section id="innerpagina">
			<div class="conta">
				<div class="contaheader">
					<h3>Conta</h3>
					<span id="conta-mes">Junho de 2023</span>
				</div>
				<div id="valor-conta">R$ 605,80</div>
				<a href="#" class="btx boleto">Pagar com Boleto</a>
				<div class="historico-pedidos">
					<div class="historicoheader">
						<h3>Histórico de Pedidos</h3>
					</div>
				</div>
				<div id="lista-pedidos">
					<div class="pedidosheader">
						<span>Peça</span><span>Marca/Modelo</span><span>Solicitação</span><span>Status</span>
					</div>
					<%if(!vs.isEmpty()){
						try{
						for(int i = 0 ; i < vs.size();i++ ){
							Veiculo veiculo = vs.get(i);
							AutoPeca peca = new AutoPeca();
							
							peca = p.pecaPorVeiculo(veiculo.getId_veiculo()); 
							
					%>
					<a href="jsp/Veiculo/editarVeiculo.jsp?id_veiculo=<%= veiculo.getId_veiculo()%>" id="pedido1" class="pedido"><span id="peca1"><%=peca.getNome_peca()%></span>
					<span id="carro1"><%=veiculo.getMontadora_veiculo()+" "+veiculo.getModelo_veiculo()%></span>
					<span id="solicitacao1"><%=peca.getData_peca()%></span>
						<div class="content-status">
							<span id="status1">Entregue</span>
							<div id="corstatus1" class="divstatus"></div>
						</div>
					</a>
					<%}} catch (NullPointerException e){out.println("erro ao carregar peça");}}else {%>
						Nenhuma peça encomendada
					<%}%>
					<!-- <a href="#" id="pedido1" class="pedido"><span id="peca1">Peça</span><span
						id="carro1">Toyota Etios</span><span id="solicitacao1">06/06/2021</span>
					<div class="content-status">
							<span id="status1">Entregue</span>
							<div id="corstatus1" class="divstatus"></div>
						</div>
					</a> -->
				</div>
			</div>
		</section>
	</main>


</body>
</html>