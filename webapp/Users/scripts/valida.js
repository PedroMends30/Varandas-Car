 function ValidaNovoUsuer(){
	 let nome = formAddUsuer.nomeup.value
	 let email = formAddUsuer.emailup.value
	 let fone = formAddUsuer.foneup.value
	 let senha = formAddUsuer.senhaup.value
	 
	 if(nome.length <= 5){
		 document.querySelector('#erro0').innerHTML = "Eita! Que nome curto, tente um maior!";
		 document.querySelector('#erro0').style.display = "block";
	 }
 };
 
 function ValidaNome(){
	 let nome = document.querySelector('#nomeup').value
	 
	 if(nome.length <= 10 && nome.length > 0){
		 document.querySelector('#erro0').innerHTML = "Égua do nome curto! Tente um maior!";
		 document.querySelector('#erro0').style.display = "block";
  	} else {
		  document.querySelector('#erro0').style.display = "none";
	}
 };
 
function ValidaFone() {
  let fone = document.querySelector('#foneup');
  let foneNumerico = fone.value.replace(/\D/g, '');
  let foneFormatado = '';

  if (foneNumerico.length > 0) {
    foneFormatado = '(' + foneNumerico.substring(0, 2) + ') ';

    if (foneNumerico.length > 2) {
      foneFormatado += foneNumerico.substring(2, 7);

      if (foneNumerico.length > 7) {
        foneFormatado += '-' + foneNumerico.substring(7, 11);
      }
    }
  }

  fone.value = foneFormatado;
}


function ValidaSenha(){
	let senha = document.querySelector('#senhaup').value;

	if (senha.length <= 5 && senha.length > 0) {
		document.querySelector('#erro3').innerHTML = "Sua senha está muito curta!";
		 document.querySelector('#erro3').style.display = "block";
	} else {
		document.querySelector('#erro3').style.display = "none";
	}
}

function VerSenha(){
	let senha = document.querySelector('#senhaup')
	let icone = document.querySelector('.IconSenha')
	
	if (senha.type === 'password') {
    senha.type = 'text';
    icone.src = 'imagens/EscSenha.svg';
  } else {
    senha.type = 'password';
    icone.src = 'imagens/VerSenha.svg';
  }
}