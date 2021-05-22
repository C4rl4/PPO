<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title> Cadastro</title>
<link rel="shortcut icon" href="img/ico.ico" >
<link rel="stylesheet" type="text/css" href="css/Csscadastro.css" media="screen" />
<script type="text/javascript" src="js/js.js"></script>
<link rel="stylesheet" type="text/css" href="css/css2.css" media="screen" />
<title>Insert title here</title>
</head>
<body>
<div class="container">
  
  <h2>Cadastro</h2>
 <h4><img id ="img" src="img/atencao2.png"> Utilizar nome data de nascimento email</h4>
  
  <form  method="post" action="http://localhost:8080/ppo/usuariocontrole" enctype="multipart/form-data">
 
    <div class="group">      
      <input type="text" required name="nome"/>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Nome</label>
    </div>
    
      
    <div class="group">      
      <input type="date" required name="data"/>
      <span class="highlight"></span>
      <span class="bar"></span>
      
    </div>
    <div class="group">      
      <input type="text" required name="email"/>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Email</label>
    </div>
  <div class="group">      
  
      <p><b>Qual o seu sexo?</b></p><br></br>
    <input type="radio"  name="sexo" value="M">
      <label id= "label" for="sexo">
        <b>M</b>
      </label>
        <input type="radio"  name="sexo" value="F" >
      <label id= "label" for="sexo">
        <b>F</b>
      </label>
    </div>
   
 	<div class="group">      
      <p><b> Que tipo de usuário você é ? (Surdo, Interprete ou Ouvinte)</b></p><br></br>
<div class="group">
<input type="radio" class="style-radio" name="tipo" id="surdo" value="Surdo">
  <label id= "label" for="tipo">
    <b>Surdo</b>
  </label>
    <input type="radio" class="style-radio" name="tipo" id="interprete" value="Interprete">
  <label id= "label" for="tipo">
    <b>Interprete</b>
  </label>
    <input type="radio" class="style-radio" name="tipo" id="ouvinte" value="Ouvinte">
  <label id= "label" for="tipo">
    <b>Ouvinte</b>
  </label>
      
    </div>
			
  
  <div class="group">
  <div class="max-width">
<div class="imagecontainer">
	<img src="img/upload-na-nuvem.png" alt="insira uma imagem" id="imgphoto">
</div>

</div>

 
	<h5>Se voce for Surdo ou interprete faça o upload do documento comprobatório*</h5>
  <input type="file"  name="fimage" >
  
  </div>
    <div class="group">      
      <input type="password" name="senhaForca" id="senhaForca"   required
       onkeyup= "validarSenhaForca()"><br><br>
        <div class="edite" id="impSenha"></div>
        <div class="edite" id="impForcaSenha"></div>
        <div class="edite" id="erroSenhaForca"></div>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Senha</label>
    </div>
    <div class="group">      
      <input type="password" name="senhaForca2" id="senhaForca"  required
       onkeyup= "validarSenhaForca()"><br><br>
        <div class="edite" id="impSenha"></div>
        <div class="edite" id="impForcaSenha"></div>
        <div class="edite" id="erroSenhaForca"></div>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label> Confirmar Senha</label>
    </div>
    
	<button type="submit"class="botao"><b>Cadastrar</b></button>
			
  </form>
  
  <script>
  
 function validarSenhaForca() {
	  var senha = document.getElementById('senhaForca').value;
	  var forca = 0;

	  document.getElementById("impSenha").innerHTML = "<span style= 'color: #ffffff'>Senha: </span>";
	 
	  if((senha.length >= 4) && (senha.length <=7)){
	    forca += 10;
	  }
	  else if(senha.length > 7){
	    forca +=25;
	  }
	  if((senha.length>= 5)&& (senha.match(/[a-z]+/))){
	    forca += 10;
	  }
	  if((senha.length >= 6) && (senha.match(/[A-Z]+/))){
	    forca += 20;
	  }
	  if((senha.length >= 7) && (senha.match(/[@#$%&;*]+/))){
	    forca += 25;
	  }
	    mostrarForca(forca);
	}

	function mostrarForca(forca){
	  document.getElementById("impForcaSenha").innerHTML= "<span style= 'color: #ffffff'>Força: </span>";

	  if(forca < 30){
	    document.getElementById("erroSenhaForca").innerHTML = "<span style= 'color: #ff0000'>Fraca</span>";
	  }
	  else if((forca >= 30) && (forca < 60)){
	    document.getElementById("erroSenhaForca").innerHTML = "<span style = 'color: #FFD700'> Média</span>";
	  }
	  else if((forca >= 50) && (forca < 70)){
	    document.getElementById("erroSenhaForca").innerHTML = "<span style = 'color: #7FFF00'> Forte</span>";
	  }
	  else if((forca >= 70) && (forca < 100)){
	    document.getElementById("erroSenhaForca").innerHTML = "<span style = 'color: #008000'> Excelente</span>";
	}

	}
	
 </script>
      
  <div vw class="enabled">
    <div vw-access-button class="active"></div>
    <div vw-plugin-wrapper>
      <div class="vw-plugin-top-wrapper"></div>
    </div>
  </div>
  <script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
  <script>
    new window.VLibras.Widget('https://vlibras.gov.br/app');
  </script>
  
</div>
<script src="js/js.js"></script>
</body>
</html>