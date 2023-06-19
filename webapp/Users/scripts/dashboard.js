let pagina = document.querySelector('#innerpagina');
let pedidos = document.querySelector('.l1');
let personalizar = document.querySelector('.l2');
let loja = document.querySelector('.l3');
let conta = document.querySelector('.l4');
let titulo = document.querySelector('#titulo');
var pedido;


var nome = "José da Silva Souza Pacheco";
document.querySelector('#persona').innerHTML = nome;

var btxEdita = document.querySelectorAll('.edit');



//Pegar Mes atual (Usado em Pedidos)
var data = new Date();
mes = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];

//Cria Constante com o HTML a ser inserido
const innerPedidos = '<div class="conta"><div class="contaheader"><h3>Conta</h3><span id="conta-mes">Junho 2023</span></div><div id="valor-conta">R$ 605,80</div><a href="#" class="btx boleto">Pagar com Boleto</a><div class="historico-pedidos"><div class="historicoheader"> <h3>Histórico de Pedidos</h3></div></div><div id="lista-pedidos"><div class="pedidosheader"><span>Peça</span><span>Marca/Modelo</span><span>Solicitação</span><span>Status</span></div></div>';

const innerPersonalizar = '<form action="#"><div class="contentgrid"><h3>Veículo</h3><div class="gridveiculo"><div class="contentinput"><label for="montadora">Qual a montadora do Veículo?</label><input type="text" required id="montadora" placeholder="Ex. Fiat"></div><div class="contentinput"><label for="modelo">Qual o Modelo?</label><input type="text" required id="modelo" placeholder="Ex. Uno"></div><div class="contentinput"><label for="ano">Qual o Ano de Fabricação?</label><input type="number" max="2024" min="1960" required id="ano" placeholder="Digite o ano do veiculo" value="2023"></div></div></div><div class="contentgrid"><h3>Peça a ser Personalizada</h3><div class="gridveiculo"><div class="contentinput"><label for="peca">Qual Peça será personalizada?</label><input type="text" required id="peca" placeholder="Ex. Disco de Freio"></div><div class="contentinput"><label for="dimencoes">Quais as dimenções da Peça?</label><input type="text" required id="dimencoes" placeholder="Ex. 40cm x 40cm"></div><div class="contentinput"><label for="cor">Qual a cor da Peça?</label><input type="text" required id="cor" placeholder="Ex. Vermelho"></div></div><div class="contentinput textarea"><label for="descricao">Descrição</label><textarea id="descricao" required cols="30" rows="10" placeholder="Descreva como a Peça será personalizada"></textarea></div><div class="submit"><input type="submit" class="SolicitarSubmit" value="Solicitar Orçamento"></div></div></form>';

const innerLoja = '<h3>Produtos em Destaque</h3><div class="gridprodutos"><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="imagens/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="imagens/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="imagens/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="imagens/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="imagens/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="imagens/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="imagens/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="imagens/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div><div class="contentproduto"><div class="produto"><div class="detalhes"><img src="imagens/Disco.png" alt=""></div><div class="comprar"><h4 class="tituloproduto">Disco de Alguma coisa</h4><div class="contentpreco"><h5 class="precoantigo">de <b>R$ 329,80</b></h5><h3 class="preco">R$ 289,30</h3></div></div><div class="actcompra"><a href="" class="buy">Comprar agora<img src="imagens/Carrinho.svg" alt=""></a><a href="" class="vermais">Ver mais</a></div></div><div class="desconto">Economize <b>R$ 40,50</b></div></div></div>';

const innerConta = '<h3>Dados Pessoais</h3><div class="gridProfile"><img src="imagens/FotoPerfil.svg" alt="" class="fotoPerfil"><div class="contentProfile"><form method="post" class="contentinput"><label for="displayNome">Nome<img src="imagens/Editar.svg" alt="" onclick="EditaInput(0)" class="edit"><input class="EditarSubmit sub0" onclick="ConfirmaInput(0)" type="button" value="Confirmar Alterações"></label><input type="text" id="displayNome" required  disabled class="input0" value="'+nome+'" placeholder="Digite seu nome"></form><div class="MembroContent"><img src="imagens/Bronze.svg" alt=""><div class="MembroDisplay"><span>Membro</span><span id="Membro" class="Bronze">Bronze</span></div><span class="DisplayPedidosFeitos">23 Pedidos Concluídos</span></div></div></div><div class="gridProfile"><form method="post" class="contentinput"><label for="displayEmail">Email<img src="imagens/Editar.svg" alt="" onclick="EditaInput(1)" class="edit"><input class="EditarSubmit sub1" onclick="ConfirmaInput(1)" type="button" value="Confirmar Alterações"></label><input type="email" required  disabled id="displayEmail" class="input1" value="jsp@gmail.com" placeholder="Digite seu email"></form><form class="contentinput"><label for="displayTel">Telefone<img src="imagens/Editar.svg" alt="" onclick="EditaInput(2)" class="edit"><input class="EditarSubmit sub2" onclick="ConfirmaInput(2)" type="button" value="Confirmar Alterações"></label><input type="tel" id="displayTel" required  disabled class="input2" value="(91) 98280-9717" placeholder="(xx) xxxxx-xxxx"></form></div><div class="contentBank"><h3>Dados Bancários</h3><div class="gridBank"><div class="contentinput"><label for="displayPag">Forma de Pagamento</label><select id="displayPag"><option value="1" selected="selected">via Pix</option><option value="2" selected="">Cartão de Crédito</option><option value="3" selected="">Boleto Bancário</option></select></div><form class="contentinput credito"><label for="displayCartao">Número do Cartão<img src="imagens/Editar.svg" alt="" onclick="EditaInput(3)" class="edit"><input class="EditarSubmit sub3" onclick="ConfirmaInput(3)" type="button" value="Confirmar Alterações"></label><input type="number" id="displayCartao" required disabled class="input3" value="51***-*****-*80" placeholder="Digite o número do Cartão"></form></div></div>';

//Definir Pedidos como Padrão
if(pedidos.classList.contains('active')){
    pagina.innerHTML = innerPedidos;

    document.querySelector('#conta-mes').innerHTML = mes[data.getMonth()] + ' de ' + data.getFullYear();

    for (var i = 1; i < 10; i++){
        console.log(i);
        pedido = '<a href="#" id="pedido'+ i +'" class="pedido"><span id="peca'+ i +'">Peça</span><span id="carro'+ i +'">Toyota Etios</span><span id="solicitacao'+ i +'">06/06/2021</span><div class="content-status"><span id="status'+ i +'">Entregue</span><div id="corstatus'+ i +'" class="divstatus"></div></div></a>';

        document.querySelector('#lista-pedidos').insertAdjacentHTML("beforeend", pedido);
    };
};

//Adiciona evento de CLICK e insere o HTML
pedidos.addEventListener('click', () =>{
    pedidos.classList.add('active');
    personalizar.classList.remove('active');
    loja.classList.remove('active');
    conta.classList.remove('active');
    pagina.innerHTML = innerPedidos;
    titulo.innerHTML = "Meus Pedidos";

    document.querySelector('#conta-mes').innerHTML = mes[data.getMonth()] + ' de ' + data.getFullYear();
   
    for (var i = 1; i < 5; i++){
        console.log(i);

        pedido = '<a href="#" id="pedido'+ i +'" class="pedido"><span id="peca'+ i +'">Peça</span><span id="carro'+ i +'">Toyota Etios</span><span id="solicitacao'+ i +'">06/06/2021</span><div class="content-status"><span id="status'+ i +'">Entregue</span><div id="corstatus'+ i +'" class="divstatus"></div></div></a>';

        document.querySelector('#lista-pedidos').insertAdjacentHTML("beforeend", pedido);
    };
});

personalizar.addEventListener('click', () =>{
    pedidos.classList.remove('active');
    personalizar.classList.add('active');
    loja.classList.remove('active');
    conta.classList.remove('active');
    pagina.innerHTML = innerPersonalizar;
    titulo.innerHTML = "Personalizar";
});

loja.addEventListener('click', () =>{
    pedidos.classList.remove('active');
    personalizar.classList.remove('active');
    loja.classList.add('active');
    conta.classList.remove('active');
    pagina.innerHTML = innerLoja;
    titulo.innerHTML = "Loja";
});




function EditaInput(y){
    document.querySelector(`.input${y}`).toggleAttribute("disabled");
    document.querySelector(`.sub${y}`).classList.add("visible");
}

function ConfirmaInput(y){
    console.log(y);
    document.querySelector(`.input${y}`).toggleAttribute("disabled");
    document.querySelector(`.sub${y}`).classList.remove("visible");


    //Nome
    if (y === 0 && document.querySelector('.input0').value.length > 3){
        nome = document.querySelector('.input0').value;
        document.querySelector('#persona').innerHTML = nome;
        document.querySelectorAll('.contentinput')[y].submit();
    };

    if (y === 0 && document.querySelector('.input0').value.length <= 3){
        document.querySelector('.input0').value = nome;
    };
}

conta.addEventListener('click', () =>{
    pedidos.classList.remove('active');
    personalizar.classList.remove('active');
    loja.classList.remove('active');
    conta.classList.add('active');
    pagina.innerHTML = innerConta;
    titulo.innerHTML = "Minha Conta";    


     //Cartão
     const selectPag = document.querySelector('#displayPag');
     const formCredito = document.querySelector('.credito');
 
     selectPag.addEventListener('change', function() {
         if (selectPag.selectedIndex === 1) {
             formCredito.style.display = 'block';
           } else {
             formCredito.style.display = 'none';
           }
       });
})

