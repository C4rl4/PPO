<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Cadastro</title>
<link rel="shortcut icon" href="img/ico.ico" >
<link rel="stylesheet" type="text/css" href="css/Csscadastro.css" media="screen" />
</head>
<body>

<div class="container">
  
  <h2>Cadastro</h2>
 <h4><img id ="img" src="img/atencao2.png"> Utilizar nome data de nascimento email</h4>
  
    <script>
	var leitorDeCSV= new FileReader();
	window.onload = function init(){
		leitorDeCSV.onload = leCSV;
		}
	function  pegarCSV(inputFile){
		var file = inputFile.files[0];
		var text= leitroDeCSV.readAsText(file);
			return text;
		}
	function gerarid(){
		Math.floor(Math.random() * 10000);

		}

  </script>
  <form  method="post" action="csadastro">
    <div class="group">      
      <label>ID:</label>
      <input type="number" name="id"  />
      <span class="highlight"></span>
      <span class="bar"></span>
      
    </div>
    <div class="group">      
      <input type="text" required name="nome" />
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Nome</label>
    </div>
    
      
    <div class="group">      
      <input type="date"  data-date-format="YYYY MM DD" required name="data" />
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
  <p><b>Sexo: Feminino ou Masculino</b></p>
 	<input type="radio" class="style-radio" name="sexo" id="mulher" />
			<label id= "label" for="hombre">
				<b>F</b>
			</label>
	<input type="radio" class="style-radio" name="sexo" id="hombre"  />
			<label id= "label" for="hombre">
				<b>M</b>
			</label>
				
  </div>
   <div class="group"> 
    <p><b>Que tipo de usuário voce é? Surdo, Interprete ou ouvinte?</b></p>
 	<input type="radio" class="style-radio" name="tipo" id="hombre" value="<c:out value="${usuario.tipo} " />"/>
			<label id= "label" for="hombre">
				<b>Surdo</b>
			</label>
				<input type="radio" class="style-radio" name="tipo" id="hombre"/>
			<label id= "label" for="hombre">
				<b>Interprete</b>
			</label>
				<input type="radio" class="style-radio" name="tipo" id="hombre"/>
			<label id= "label" for="hombre">
				<b>Ouvinte</b>
			</label>
  </div>
  <div class="group">
  
  <input type="file" name="documento" onchange="pegaCsv(this)" />
  
  </div>
    <div class="group">      
      <input type="password" name="senhaForca" id="senhaForca"   required
       onkeyup= "validarSenhaForca()" ><br><br>
        <div class="edite" id="impSenha"></div>
        <div class="edite" id="impForcaSenha"></div>
        <div class="edite" id="erroSenhaForca"></div>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Senha</label>
    </div>
    <div class="group">      
      <input type="password" name="senhaForca2" id="senhaForca"  required
       onkeyup= "validarSenhaForca()"/><br><br>
        <div class="edite" id="impSenha"></div>
        <div class="edite" id="impForcaSenha"></div>
        <div class="edite" id="erroSenhaForca"></div>
      <span class="highlight"></span>

      <span class="bar"></span>
      <label> Confirmar Senha</label>
    </div>
    
	<button type="submit" class="botao" ><b>Cadastrar</b></button>
			
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
     
</div>
</body>
</html>