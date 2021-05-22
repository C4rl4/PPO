<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="shortcut icon" href="img/ico.ico" >
<link rel="stylesheet" type="text/css" href="css/Csscadastro.css" media="screen" />
</head>
<body>
<div class="container">
  
  <h2>Login</h2>
 <h4><img id ="img" src="img/atencao2.png"> Utilizar nome ou email senha</h4>
  
  <form method="post" action="http://localhost:8080/ppo/login">
    
    <div class="group">      
      <input type="text" required name="nome">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Nome</label>
    </div>
    
    <div class="group">      
      <input type="password" required name="senha">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Senha</label>
    </div>
    
	<button type="submit" class="botao"><b>Entrar</b></button>
	<p><a href="recuperarsenha.html">Esqueci minha senha!</a></p>
	</form>
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

</body>
</html>