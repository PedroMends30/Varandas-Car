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
	
	
    <header class="menuLateral">
        <img src="https://raw.githubusercontent.com/PedroMends30/img/main/LogoDashboard.svg" alt="">

        <div class="servicos">
            <h2>Serviços</h2>
            <a href="Pedidos.jsp" class="linkaction l1">Meus Pedidos</a>
            <a href="Personalizar.jsp" class="linkaction l2">Personalizar</a>
            <a href="Loja.jsp" class="linkaction l3 active">Loja</a>
            <a href="Conta.jsp" class="linkaction l4">Minha Conta</a>

        </div>

        <a href="../../Users/jsp/deslogar.jsp" class="sair">Sair</a>
    </header>
    <div class="alinhamento"></div>
    <main class="pagina">
        <div class="info">
            <h1 id="titulo">Loja</h1>
            <div class="span-hight">
                <span class="profile">
                    <h5 id="persona"><%=user.getNome_usuario() %></h5>
                    <h6 id="member-status">Membro Gold</h6>
                </span>
                <span class="notifications">
                    <img src="src/SinoIcon.svg" alt="">
                </span>
            </div>
        </div>
        <section id="innerpagina"><h3>Produtos em Destaque</h3><div class="gridprodutos"><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="https://raw.githubusercontent.com/PedroMends30/img/main/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="https://raw.githubusercontent.com/PedroMends30/img/main/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="https://raw.githubusercontent.com/PedroMends30/img/main/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="https://raw.githubusercontent.com/PedroMends30/img/main/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="https://raw.githubusercontent.com/PedroMends30/img/main/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="https://raw.githubusercontent.com/PedroMends30/img/main/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="https://raw.githubusercontent.com/PedroMends30/img/main/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="https://raw.githubusercontent.com/PedroMends30/img/main/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="https://raw.githubusercontent.com/PedroMends30/img/main/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="https://raw.githubusercontent.com/PedroMends30/img/main/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div></div></section>
    </main>


</body></html>