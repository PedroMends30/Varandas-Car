<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="model.*"%>

<%
UsuarioDao login = new UsuarioDao();
Usuario user = new Usuario();
Integer id_user = -1;
try {
	id_user = (Integer) session.getAttribute("id_user");
	if (id_user == -1 || id_user == null) {
		response.sendRedirect("../../Users/singin.html");
	} else {
		try {
	user = login.retornaUsuario(id_user);
		} catch (NullPointerException e) {
	out.println("Erro");
		}
	}
} catch (NullPointerException e) {
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
<script defer src="scripts/dashboard.js"></script>
<link rel="shortcut icon" href="src/FaviconDashboard.svg"
	type="image/x-icon">
<title>Dashboard | Varanda's Autopeças</title>
</head>
<body>


	<header class="menuLateral">
		<img src="https://raw.githubusercontent.com/PedroMends30/img/main/LogoDashboard.svg" alt="">

		<div class="servicos">
			<h2>Serviços</h2>
			<a href="Pedidos.jsp" class="linkaction l1">Meus Pedidos</a> <a
				href="Personalizar.jsp" class="linkaction l2">Personalizar</a> <a
				href="Loja.jsp" class="linkaction l3">Loja</a>
				<a href="Conta.jsp" class="linkaction l4 active">Minha Conta</a>

		</div>

		<a href="../../Users/jsp/deslogar.jsp" class="sair">Sair</a>
	</header>
	<div class="alinhamento"></div>
	<main class="pagina">
		<div class="info">
			<h1 id="titulo">Minha Conta</h1>
			<div class="span-hight">
				<span class="profile">
					<h5 id="persona"><%=user.getNome_usuario()%></h5>
					<h6 id="member-status">Membro Gold</h6>
				</span> <span class="notifications"> <img src="src/SinoIcon.svg"
					alt="">
				</span>
			</div>
		</div>
		<section id="innerpagina">
			<h3>Dados Pessoais</h3>
			<div class="gridProfile">
				<img src="https://raw.githubusercontent.com/PedroMends30/img/main/FotoPerfil.svg" alt="" class="fotoPerfil">
				<div class="contentProfile">
					<form method="post" class="contentinput">
						<label for="displayNome">Nome<img src="https://raw.githubusercontent.com/PedroMends30/img/main/Editar.svg"
							alt="" onclick="EditaInput(0)" class="edit"><input
							class="EditarSubmit sub0" onclick="ConfirmaInput(0)"
							type="button" value="Confirmar Alterações"></label><input
							type="text" id="displayNome" required disabled
							class="input0" value="<%=user.getNome_usuario() %>"
							placeholder="Digite seu nome">
					</form>
					<div class="MembroContent">
						<img src="https://raw.githubusercontent.com/PedroMends30/img/main/Bronze.svg" alt="">
						<div class="MembroDisplay">
							<span>Membro</span><span id="Membro" class="Bronze">Bronze</span>
						</div>
						<span class="DisplayPedidosFeitos">23 Pedidos Concluídos</span>
					</div>
				</div>
			</div>
			<div class="gridProfile">
				<form method="post" class="contentinput">
					<label for="displayEmail">Email<img
						src="https://raw.githubusercontent.com/PedroMends30/img/main/Editar.svg" alt="" onclick="EditaInput(1)"
						class="edit"><input class="EditarSubmit sub1"
						onclick="ConfirmaInput(1)" type="button"
						value="Confirmar Alterações"></label><input type="email"
						required="" disabled="" id="displayEmail" class="input1"
						value="<%=user.getEmail_usuario() %>" placeholder="Digite seu email">
				</form>
				<form class="contentinput">
					<label for="displayTel">Telefone<img
						src="https://raw.githubusercontent.com/PedroMends30/img/main/Editar.svg" alt="" onclick="EditaInput(2)"
						class="edit"><input class="EditarSubmit sub2"
						onclick="ConfirmaInput(2)" type="button"
						value="Confirmar Alterações"></label><input type="tel"
						id="displayTel" required="" disabled="" class="input2"
						value="<%=user.getTelefone_usuario()%>" placeholder="(xx) xxxxx-xxxx">
				</form>
			</div>
			<div class="contentBank">
				<h3>Dados Bancários</h3>
				<div class="gridBank">
					<div class="contentinput">
						<label for="displayPag">Forma de Pagamento</label><select
							id="displayPag"><option value="1" selected="selected">via
								Pix</option>
							<option value="2" selected="">Cartão de Crédito</option>
							<option value="3" selected="">Boleto Bancário</option></select>
					</div>
					<form class="contentinput credito">
						<label for="displayCartao">Número do Cartão<img
							src="https://raw.githubusercontent.com/PedroMends30/img/main/Editar.svg" alt="" onclick="EditaInput(3)"
							class="edit"><input class="EditarSubmit sub3"
							onclick="ConfirmaInput(3)" type="button"
							value="Confirmar Alterações"></label><input type="number"
							id="displayCartao" required="" disabled="" class="input3"
							value="51***-*****-*80" placeholder="Digite o número do Cartão">
					</form>
				</div>
			</div>
		</section>
	</main>


</body>
</html>