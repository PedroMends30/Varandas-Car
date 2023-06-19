<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
    
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
%>
<!DOCTYPE html>
<html lang="pt-br"><head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../src/dashboard.css">
    <script defer="" src="scripts/dashboard.js"></script>
    <link rel="shortcut icon" href="src/FaviconDashboard.svg" type="image/x-icon">
    <title>Dashboard | Varanda's Autopeças</title>
</head>
<body>
	<script defer type="text/javascript">
		function today(){
		    m = document.getElementById("data")
			n = new Date()
		    day = (n.getUTCDate()).toString()
		    month = (n.getUTCMonth()).toString()
		    year = (n.getUTCFullYear()).toString()
		    
		    if (month.length == 1){
				month = "0" + month
		    }
		    
		    if (day.length == 1){
				day = "0" + month
		    }
		    data = [year,month,day]
		    m.value = data[0]+"-"+data[1]+"-"+data[2]
		}
	</script>
	
    <header class="menuLateral">
        <img src="https://raw.githubusercontent.com/PedroMends30/img/main/LogoDashboard.svg" alt="">

        <div class="servicos">
            <h2>Serviços</h2>
            <a href="Pedidos.jsp" class="linkaction l1">Meus Pedidos</a>
            <a href="Personalizar.jsp" class="linkaction l2 active">Personalizar</a>
            <a href="Loja.jsp" class="linkaction l3">Loja</a>
            <a href="Conta.jsp" class="linkaction l4">Minha Conta</a>

        </div>

        <a href="../../Users/jsp/deslogar.jsp" class="sair">Sair</a>
    </header>
    <div class="alinhamento"></div>
    <main class="pagina">
		<div class="info">
			<h1 id="titulo">Personalizar</h1>
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
			<form action="jsp/Veiculo/inserirVeiculo.jsp" method="post">
				<div class="contentgrid">
					<h3>Veículo</h3>
					<div class="gridveiculo">
						<div class="contentinput">
							<label for="montadora">Qual a montadora do Veículo?</label>
							<input type="text" name="montadora" onblur="today()" required="" id="montadora" placeholder="Ex. Fiat">
						</div>
						<div class="contentinput">
							<label for="modelo">Qual o Modelo?</label>
							<input type="text" name="modelo" required="" id="modelo" placeholder="Ex. Uno">
						</div>
						<div class="contentinput">
							<label for="ano">Qual o Ano de Fabricação?</label>
							<input type="number" name="ano" max="2024" min="1960" required="" id="ano" placeholder="Digite o ano do veiculo" value="2023">
						</div>
					</div>
				</div>
				<div class="contentgrid">
					<h3>Peça a ser Personalizada</h3>
					<div class="gridveiculo">
						<div class="contentinput">
							<label for="peca">Qual Peça será personalizada?</label>
							<input type="text" name="nome_peca" required="" id="peca" placeholder="Ex. Disco de Freio">
						</div>
						<div class="contentinput">
							<label for="dimencoes">Qual o volume da Peça?</label>
							<input type="text" name="volume" required="" id="dimencoes" placeholder="Ex. 40cm x 40cm">
						</div>
						<div class="contentinput">
							<label for="cor">Qual a cor da Peça?</label>
							<input type="color" name="cor" required="" id="cor" placeholder="Ex. Vermelho">
						</div>
					</div>
					<div class="contentinput textarea">
						<label for="descricao">Descrição</label>
						<textarea id="descricao" name="descricao" required="" cols="30" rows="10" placeholder="Descreva como a Peça será personalizada"></textarea>
					</div>
					<input type="hidden" id="data" name="data" value="">
					<div class="submit">
						<input type="submit" class="SolicitarSubmit" value="Solicitar Orçamento">
					</div>
				</div>
			</form>
		</section>
    </main>


</body></html>