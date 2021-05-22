<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="classbeans.Conta" %>
<%@page import="classbeans.Usuario" %>
<%@page import="dao.DaoConta" %>
<%@page import="dao.DaoUsuario" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="css/surdo.css">
    <link rel="stylesheet" href="css/cart.css">
   <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/Botao.css" media="screen" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  </head>

<body>
<%
	String usuario = (String)session.getAttribute("usuario");
	if(usuario==null){
		response.sendRedirect("Login.jsp");
	}else{
	%><script>alert("Seja Bem vindo");</script>
	<% }
%>


<!--Menu-->
<div class="principal">
    <div class="slogan"> <p class = "titulo">Sign Writing </p></div>
<ul id="nav">
    <li><div class=dropdown>
      <button style="border-radius:50%; height:50px;">
        <i class="material-icons"style=" height:100%;">account_circle</i>
      </button>
       </div>

     <a href="#">Usuario</a>
      <ul>
        <li class="usu"><a href="http://localhost:8080/ppo/recupAlteraSenha.html">Redefinir Senha</a></li>
        <li class="usu2"><a href="Logout.jsp">Sair</a></li>
      </ul>
    <li><a href="http://localhost:8080/ppo/Editorintepretesurdo.jsp">Adicionar Simbolo</a></li>
    <li><a href="http://localhost:8080/ppo/Editorintepretesurdo.jsp">Elaborar Texto</a>
    <li><a href="http://localhost:8080/ppo/Dicionario.jsp">Dicionario</a>
    </li>
</div>
<!--Menu-->
<div  id="menu" class="left show">
    <div class="slogan"> <p class = "titulo">Sign Writing </p></div>
<ul id="nav">

    <li  class="active">
      <br><br>
     <a href="#" >  <i class="material-icons"style=" height:100%;">account_circle</i> Usuario	<i class="material-icons"style=" height:100%;">arrow_drop_down</i></a>

      <ul>
        <li ><a href="http://localhost:8080/ppo/recupAlteraSenha.html">Redefinir Senha</a></li>
        <li class="botao"><a href="Logout.jsp"><i class="material-icons"style=" height:100%;">close</i>Sair</a></li>
      </ul>
</li>

    <li><a href="pricipalouvinte.html"> <i class="material-icons"style=" height:100%;">home</i>Inicio</a></li>
      <li><a href="http://localhost:8080/ppo/Editorintepretesurdo.jsp"><i class="material-icons"style=" height:100%;">add</i>Adicionar Simbolo</a></li>
    <li><a href="http://localhost:8080/ppo/Editorintepretesurdo.jsp"> <i class="material-icons"style=" height:100%;">app_registration</i>Elaborar Texto</a>
    <li><a href="http://localhost:8080/ppo/Dicionario.jsp"> <i class="material-icons"style=" height:100%;">book</i>Dicionario</a>
    </li>

  </ul>
</div>
<!--Barra de pesquisa-->
<br><br>
<!-- Barra de search(procurar) ou filtro -->
      <form class='box'>
        <!-- Lupa -->
        <span class='material-icons bloom' onclick="buscar()">search</span>
        <!-- Input de procura do usuÃ¡rio -->
        <input id='inputUser' list="opcoes" onchange='searchBar()' type='text' placeholder='Pesquisa'>
        
        <datalist id="opcoes">
        <%
	ArrayList<Conta>lista = new ArrayList<Conta>();
		
	try{
		DaoConta dDao = new DaoConta();
	lista=dDao.getallConta();
	}catch(Exception e){
		out.println(e);
	}
	for(Conta p: lista){
	
	%>
          <option ><%=p.getNome() %></option>
          <%} %>
        </datalist>
      </form>
      
<!--Textos-->
<input id="resultadoimg"type="image" style="width:60%; height:70px; padding-top:20px;"  src=""/>
<p id="resultadonome"></p>
<form method="post" action="http://localhost:8080/ppo/Contaexcluir">
<p>Excluir texto:</p>
<input id="excluirnome" name="excluirtexto"/>
<button type="submit"><i  class="material-icons">delete</i></button>
</form>

<form method="post" id="formpost"  enctype="multipart/form-data"  action="http://localhost:8080/ppo/DicionarioDici"  >
    <p>Nome:</p><input id="nome" name="nome"/>
    <p>Descrição:</p><input id="descricao" name="descricao"/>
 	<p>Faça o upload do arquivo:</p><input type="file"  id="img"name="img" onchange="uploadFile()"/>
     <img alt="Imagem" src="" id="im" width="200" height="200">
      
      </form>
<section>
<%
	ArrayList<Conta>listadici = new ArrayList<Conta>();
		
	try{
		DaoConta dDao = new DaoConta();
	listadici=dDao.getallConta();
	}catch(Exception e){
		out.println(e);
	}
	for(Conta p: listadici){
	
	%>
	      <div class="wrap wrap--1" style="display:inline-block">
    <div class="container container--1" style="width:150px;height:90px" >
   		<input type="image" style="width:100%; height:70px; padding-top:20px;"  src="<%=p.getReceber().getAbsolutePath() %>"/>
   		<p style="color:black; font-size:12px"><%=p.getNome()%></p>
  </div>
     </div>

 
<% }%>
</section>
<script>
var captura="";
function buscar(){
	captura=document.getElementById('inputUser').value;
	document.getElementById('resultadonome').innerHTML=captura;
	document.getElementById('resultadoimg').src="img/"+captura+".png";
}


</script>

<script>
function uploadFile(){
	
	var image = document.querySelector("img");
	var d1=document.getElementById("nome").value;
	var d2=document.getElementById("descricao").value;
	var descricao =document.getElementById("descricao");
	var file=document.querySelector("input[type=file]").files[0];
	var reader = new FileReader();
	reader.onloadend=function(){
		image.src=reader.result;
		$.ajax({
			method: "POST",
			url: "http://localhost:8080/ppo/DicionarioDici",
			data: {fileUpload : reader.result,nome: $("#nome").val(), descricao: $("#descricao").val()}
		}).done(function(){
			alert("Sucesso ");
		}).fail(function(xhr, status, errorThrown){
			alert("Error: "+xhr.responseText);
		});
		alert("saiu!");
	};
	if(file){
		alert("entrou no file" );
		reader.readAsDataURL(file);

	}else{
		alert("não entrou no file" );
		image.src="";
	}

	}
</script>
<!--Vlibras-->

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

</body>
</html>
