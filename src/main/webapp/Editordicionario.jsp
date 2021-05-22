<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*, java.text.*"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.DaoDicionarioPronto" %>
<%@page import="classbeans.DicionarioPronto" %>

<html>
<head>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script src="js/fabric2.min.js"></script>

<title>Editor</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/dicionario2.css">
<link rel="stylesheet" type="text/css" href="Csstext.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css3.css" media="screen" />
<link rel="stylesheet" type="text/css" href="Botao.css" media="screen" />
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
<a href="principalouvinte.html"><div class="Slogan2"> <p class = "titulo">Sign Writing </p></div></a>
<div class="Inicio"><a href="principalinterprete.jsp"><i class="material-icons"style=" height:100%;">home</i></a></div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>

 <div class="mdl-wrap">
<!-- formulario para mandar o documento para a conta -->
<form method="post" id="formpost"  enctype="multipart/form-data"  >
    <p>Nome:</p><input id="nome" name="nome"/>
    <p>Descrição:</p><input id="descricao" name="descricao"/>
 	<p>Faça o upload do arquivo:<input type="file"  id="img"name="img" onchange="uploadFile()"/>
     <img alt="Imagem" src="" id="im" width="200" height="200">
      
      </form>
      
<div class="mdl-toolbar">
<!--Menu-->
<button style="height:30px"   id="paste" title="Pegar" onclick="salvar()"><i  class="material-icons">content_paste</i></button>
<button style="height:30px"    id="undo" title="Retroceder" ><i  class="material-icons">delete</i></button>
<div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon" title="mao" style="display:inline-block">
<button onclick="mostrar('seuformulario')">mão1</button>
    <form id="seuformulario" >
      <img src="conf1/conf1.1.1.png" id="conf1.1" width="70" heigth="50" onclick="adicionar()"/>
      <img src="conf1/conf1.2.1-removebg-preview.png" id="conf1.2" width="70" heigth="50" onclick="adicionarimagem2()"/>
      <img src="conf1/conf1.3.1-removebg-preview.png" id="conf1.3" width="70" heigth="50" onclick="adicionarimagem3()"/>
      <img src="conf1/conf1.4.1-removebg-preview.png" id="conf1.4" width="70" heigth="50" onclick="adicionarimagem4()"/>
      <img src="conf1/conf1.5.1-removebg-preview.png" id="conf1.5" width="70" heigth="50" onclick="adicionarimagem5()"/>
      <img src="conf1/conf1.6.1-removebg-preview.png" id="conf1.6" width="70" heigth="50" onclick="adicionarimagem6()"/>
      <img src="conf1/conf1.7.1.png" id="conf1.7" width="70" heigth="50" onclick="adicionarimagem7()"/>
      <img src="conf1/conf1.8.1-removebg-preview.png" id="conf1.8" width="70" heigth="50" onclick="adicionarimagem8()"/>
      <img src="conf1/conf1.9.1-removebg-preview.png" id="conf1.9" width="70" heigth="50" onclick="adicionarimagem9()"/>
      <img src="conf1/conf1.10.1-removebg-preview.png" id="conf1.10" width="70" heigth="50" onclick="adicionarimagem10()"/>
    </form>
 </div>

<div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">
<button onclick="mostrar('seuformulario2')">mão2</button>
       <form id="seuformulario2" >
         <img src="conf2/conf2.1.1-removebg-preview.png" id="conf2.1" width="70" heigth="50" onclick="adicionarimagem11()"/>
         <img src="conf2/conf2.2.1-removebg-preview.png" id="conf2.2" width="70" heigth="50" onclick="adicionarimagem12()"/>
         <img src="conf2/conf2.3.1-removebg-preview.png" id="conf2.3" width="70" heigth="50" onclick="adicionarimagem13()"/>
         <img src="conf2/conf2.4.1-removebg-preview.png" id="conf2.4" width="70" heigth="50" onclick="adicionarimagem14()"/>
         <img src="conf2/conf2.5.1-removebg-preview.png" id="conf2.5" width="70" heigth="50" onclick="adicionarimagem15()"/>
         <img src="conf2/conf2.6.1-removebg-preview.png" id="conf2.6" width="70" heigth="50" onclick="adicionarimagem16()"/>
         <img src="conf2/conf2.7.1-removebg-preview.png" id="conf2.7" width="70" heigth="50" onclick="adicionarimagem17()"/>
         <img src="conf2/conf2.8.1-removebg-preview.png" id="conf2.8" width="70" heigth="50" onclick="adicionarimagem18()"/>
         <img src="conf2/conf2.9.1-removebg-preview.png" id="conf2.9" width="70" heigth="50" onclick="adicionarimagem19()"/>
         <img src="conf2/conf2.10.1-removebg-preview.png" id="conf2.10" width="70" heigth="50" onclick="adicionarimagem20()"/>
       </form>
  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">
    <button onclick="mostrar('seuformulario3')">mão3</button>
       <form id="seuformulario3" >
         <img src="conf3/conf3.1-removebg-preview.png" id="conf3.1" width="70" heigth="50" onclick="adicionarimagem21()"/>
         <img src="conf3/conf3.2-removebg-preview.png" id="conf3.2" width="70" heigth="50" onclick="adicionarimagem22()"/>
         <img src="conf3/conf3.3-removebg-preview.png" id="conf3.3" width="70" heigth="50" onclick="adicionarimagem23()"/>
         <img src="conf3/conf3.4-removebg-preview.png" id="conf3.4" width="70" heigth="50" onclick="adicionarimagem24()"/>
         <img src="conf3/conf3.5-removebg-preview.png" id="conf3.5" width="70" heigth="50" onclick="adicionarimagem25()"/>
         <img src="conf3/conf3.6-removebg-preview.png" id="conf3.6" width="70" heigth="50" onclick="adicionarimagem26()"/>
         <img src="conf3/conf3.7-removebg-preview.png" id="conf3.7" width="70" heigth="50" onclick="adicionarimagem27()"/>
         <img src="conf3/conf3.8-removebg-preview.png" id="conf3.8" width="70" heigth="50" onclick="adicionarimagem28()"/>
         <img src="conf3/conf3.9-removebg-preview.png" id="conf3.9" width="70" heigth="50" onclick="adicionarimagem29()"/>
         <img src="conf3/conf3.10-removebg-preview.png" id="conf3.10" width="70" heigth="50" onclick="adicionirimagem30()"/>      
       </form>
  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario4')">mão4</button>

       <form id="seuformulario4" >
          <img src="conf4/conf4.1-removebg-preview.png" id="conf4.1" width="70" heigth="50" onclick="adicionirimagem31()"/>
         <img src="conf4/conf4.2-removebg-preview.png" id="conf4.2" width="70" heigth="50" onclick="adicionirimagem32()"/>
         <img src="conf4/conf4.3-removebg-preview.png" id="conf4.3" width="70" heigth="50" onclick="adicionirimagem33()"/>
         <img src="conf4/conf4.4-removebg-preview.png" id="conf4.4" width="70" heigth="50" onclick="adicionirimagem34()"/>
         <img src="conf4/conf4.5-removebg-preview.png" id="conf4.5" width="70" heigth="50" onclick="adicionirimagem35()"/>
         <img src="conf4/conf4.6-removebg-preview.png" id="conf4.6" width="70" heigth="50" onclick="adicionirimagem36()"/>
         <img src="conf4/conf4.7-removebg-preview.png" id="conf4.7" width="70" heigth="50" onclick="adicionirimagem37()"/>
         <img src="conf4/conf4.8-removebg-preview.png" id="conf4.8" width="70" heigth="50" onclick="adicionirimagem38()"/>
         <img src="conf4/conf4.9-removebg-preview.png" id="conf4.9" width="70" heigth="50" onclick="adicionirimagem39()"/>
         <img src="conf4/conf4.10-removebg-preview.png" id="conf4.10" width="70" heigth="50" onclick="adicionirimagem40()"/>
      
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario5')">mão5</button>

       <form id="seuformulario5" >
         <img src="conf5/conf5.1-removebg-preview.png" id="conf5.1" width="70" heigth="50" onclick="adicionirimagem41()"/>
         <img src="conf5/conf5.2-removebg-preview.png" id="conf5.2" width="70" heigth="50" onclick="adicionirimagem42()"/>
         <img src="conf5/conf5.3-removebg-preview.png" id="conf5.3" width="70" heigth="50" onclick="adicionirimagem43()"/>
         <img src="conf5/conf5.4-removebg-preview.png" id="conf5.4" width="70" heigth="50" onclick="adicionirimagem44()"/>
         <img src="conf5/conf5.5-removebg-preview.png" id="conf5.5" width="70" heigth="50" onclick="adicionirimagem45()"/>
         <img src="conf5/conf5.6-removebg-preview.png" id="conf5.6" width="70" heigth="50" onclick="adicionirimagem46()"/>
         <img src="conf5/conf5.7-removebg-preview.png" id="conf5.7" width="70" heigth="50" onclick="adicionirimagem47()"/>
         <img src="conf5/conf5.8-removebg-preview.png" id="conf5.8" width="70" heigth="50" onclick="adicionirimagem48()"/>
         <img src="conf5/conf5.9-removebg-preview.png" id="conf5.9" width="70" heigth="50" onclick="adicionirimagem49()"/>
         <img src="conf5/conf5.10-removebg-preview.png" id="conf5.10" width="70" heigth="50" onclick="adicionirimagem50()"/>
      
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario6')">mão6</button>

       <form id="seuformulario6" >
         <img src="conf6/conf6.1-removebg-preview.png" id="conf6.1" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.2-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.3-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.5-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.6-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.7-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.8-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.9-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf6/conf6.10-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
      
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario7')">mão7</button>

       <form id="seuformulario7" >
         <img src="conf7/conf7.1-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.2-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.3-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.5-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.6-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.7-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.8-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.9-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf7/conf7.10-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
      
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario8')">mão8</button>

       <form id="seuformulario8" >
         <img src="conf8/conf8.1-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.2-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.3-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.5-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.6-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.7-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.8-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.9-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf8/conf8.10-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
      </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario9')">mão9</button>

       <form id="seuformulario9" >
         <img src="conf9/conf9.1-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.2-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.3-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.5-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.6-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.7-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.8-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.9-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf9/conf9.10-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
      </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario10')">mão10</button>

       <form id="seuformulario10" >
         <img src="conf10/conf10.1-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.2-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.3-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.5-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.6-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.7-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.8-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.9-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
         <img src="conf10/conf10.10-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
      </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulariot')">Toques</button>

       <form id="seuformulariot" >
         <img src="toque/toque1-removebg-preview.png" id="toque1" width="70" heigth="50" onclick="adicionarimagem101()"/>
         <img src="toque/toque2-removebg-preview.png" id="toque2" width="70" heigth="50" onclick="adicionarimagem102()"/>
         <img src="toque/toque3-removebg-preview.png" id="toque3" width="70" heigth="50" onclick="adicionarimagem103()"/>
         <img src="toque/toque4-removebg-preview.png" id="toque4" width="70" heigth="50" onclick="adicionarimagem104()"/>
         <img src="toque/toque5-removebg-preview.png" id="toque5" width="70" heigth="50" onclick="adicionarimagem105()"/>
         <img src="toque/toque6-removebg-preview.png" id="toque6" width="70" heigth="50" onclick="adicionarimagem106()"/>
         <img src="toque/toque7-removebg-preview.png" id="toque7" width="70" heigth="50" onclick="adicionarimagem107()"/>
         <img src="toque/toque8-removebg-preview.png" id="toque8" width="70" heigth="50" onclick="adicionarimagem108()"/>
         <img src="toque/toque9-removebg-preview.png" id="toque9" width="70" heigth="50" onclick="adicionarimagem109()"/>
         <img src="toque/toque10-removebg-preview.png" id="toque10" width="70" heigth="50" onclick="adicionarimagem110()"/>
      </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformularioc1')">Carinhas</button>

       <form id="seuformularioc1" >
         <img src="carinha1/carinha1-removebg-preview.png" id="carinha1" width="70" heigth="50" onclick="adicionarimagem111()"/>
         <img src="carinha1/carinha2-removebg-preview.png" id="carinha2" width="70" heigth="50" onclick="adicionarimagem112()"/>
         <img src="carinha1/carinha3-removebg-preview.png" id="carinha3" width="70" heigth="50" onclick="adicionarimagem113()"/>
         <img src="carinha1/carinha4-removebg-preview.png" id="carinha4" width="70" heigth="50" onclick="adicionarimagem114()"/>
         <img src="carinha1/carinha5-removebg-preview.png" id="carinha5" width="70" heigth="50" onclick="adicionarimagem115()"/>
         <img src="carinha1/carinha6-removebg-preview.png" id="carinha6" width="70" heigth="50" onclick="adicionarimagem116()"/>
         <img src="carinha1/carinha7-removebg-preview.png" id="carinha7" width="70" heigth="50" onclick="adicionarimagem117()"/>
         <img src="carinha1/carinha8-removebg-preview.png" id="carinha8" width="70" heigth="50" onclick="adicionarimagem118()"/>
         <img src="carinha1/carinha9-removebg-preview.png" id="carinha9" width="70" heigth="50" onclick="adicionarimagem119()"/>
         <img src="carinha1/carinha10-removebg-preview.png" id="carinha10" width="70" heigth="50" onclick="adicionarimagem120()"/>
      </form>

  </div>
  

            </div>
        </div>


<!--Texto-->
<div style="width:1000px; height:500px; border:solid 1px #ccc;display:inline-block; margin-left:20px; "id="divcanva2">

<canvas id="canva" name="canva"class="editor" width="700" height="600" ></canvas></div>




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
<script>

function mostrar(elemento){
	var display = document.getElementById(elemento).style.display;
	 if(display == "none"){
	     document.getElementById(elemento).style.display = 'block';
	 }else{
	     document.getElementById(elemento).style.display = 'none';
	 }
	}

</script>
<script>
var canvas = window._canvas = new fabric.Canvas(canva);
var context = document.getElementById('canva').getContext('2d');
var imagem= new Array();

function adicionar(){
if(document.getElementById('conf1.1')){
var img = fabric.Image.fromURL('conf1/conf1.1.1.png', function(img){
canvas.add(img);
imagem.push(img);
  context.save();
});}
}

function adicionarimagem2(){
if(document.getElementById('conf1.2')){
var img2 = fabric.Image.fromURL('conf1/conf1.2.1-removebg-preview.png', function(img2){

canvas.add(img2);

imagem.push(img2);
});}
}
function adicionarimagem3(){
	if(document.getElementById('conf1.3')){
	var img3 = fabric.Image.fromURL('conf1/conf1.3.1-removebg-preview.png', function(img3){

	canvas.add(img3);

	imagem.push(img3);
	});}
}
	function adicionarimagem4(){
		if(document.getElementById('conf1.4')){
		var img4 = fabric.Image.fromURL('conf1/conf1.4.1-removebg-preview.png', function(img4){

		canvas.add(img4);

		imagem.push(img4);
		});}
}
	function adicionarimagem5(){
		if(document.getElementById('conf1.5')){
		var img = fabric.Image.fromURL('conf1/conf1.5.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem6(){
		if(document.getElementById('conf1.6')){
		var img = fabric.Image.fromURL('conf1/conf1.6.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem7(){
		if(document.getElementById('conf1.7')){
		var img = fabric.Image.fromURL('conf1/conf1.7.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem8(){
		if(document.getElementById('conf1.8')){
		var img = fabric.Image.fromURL('conf1/conf1.8.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem9(){
		if(document.getElementById('conf1.9')){
		var img = fabric.Image.fromURL('conf1/conf1.9.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem10(){
		if(document.getElementById('conf1.10')){
		var img = fabric.Image.fromURL('conf1/conf1.10.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem11(){
		if(document.getElementById('conf2.1')){
		var img = fabric.Image.fromURL('conf2/conf2.1.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}

		function adicionarimagem12(){
		if(document.getElementById('conf2.2')){
		var img = fabric.Image.fromURL('conf2/conf2.2.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}

		function adicionarimagem13(){
		if(document.getElementById('conf2.3')){
		var img = fabric.Image.fromURL('conf2/conf2.3.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}

		function adicionarimagem14(){
		if(document.getElementById('conf2.4')){
		var img = fabric.Image.fromURL('conf2/conf2.4.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem15(){
		if(document.getElementById('conf2.5')){
		var img = fabric.Image.fromURL('conf2/conf2.5.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem16(){
		if(document.getElementById('conf2.6')){
		var img = fabric.Image.fromURL('conf2/conf2.6.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem17(){
		if(document.getElementById('conf2.7')){
		var img = fabric.Image.fromURL('conf2/conf2.7.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem18(){
		if(document.getElementById('conf2.8')){
		var img = fabric.Image.fromURL('conf2/conf2.8.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem19(){
		if(document.getElementById('conf2.9')){
		var img = fabric.Image.fromURL('conf2/conf2.9.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem20(){
		if(document.getElementById('conf2.10')){
		var img = fabric.Image.fromURL('conf2/conf2.10.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem21(){
		if(document.getElementById('conf3.1')){
		var img = fabric.Image.fromURL('conf3/conf3.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem22(){
		if(document.getElementById('conf3.2')){
		var img = fabric.Image.fromURL('conf3/conf3.2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem23(){
		if(document.getElementById('conf3.3')){
		var img = fabric.Image.fromURL('conf3/conf3.3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem24(){
		if(document.getElementById('conf3.4')){
		var img = fabric.Image.fromURL('conf3/conf3.4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem25(){
		if(document.getElementById('conf3.5')){
		var img = fabric.Image.fromURL('conf3/conf3.5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem26(){
		if(document.getElementById('conf3.6')){
		var img = fabric.Image.fromURL('conf3/conf3.6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem27(){
		if(document.getElementById('conf3.7')){
		var img = fabric.Image.fromURL('conf3/conf3.7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem28(){
		if(document.getElementById('conf3.8')){
		var img = fabric.Image.fromURL('conf3/conf3.8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem29(){
		if(document.getElementById('conf3.9')){
		var img = fabric.Image.fromURL('conf3/conf3.9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem30(){
		if(document.getElementById('conf3.10')){
		var img = fabric.Image.fromURL('conf3/conf3.10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem31(){
		if(document.getElementById('conf4.1')){
		var img = fabric.Image.fromURL('conf4/conf4.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem32(){
		if(document.getElementById('conf4.2')){
		var img = fabric.Image.fromURL('conf4/conf4.2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem33(){
		if(document.getElementById('conf4.3')){
		var img = fabric.Image.fromURL('conf4/conf4.3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem34(){
		if(document.getElementById('conf4.4')){
		var img = fabric.Image.fromURL('conf4/conf4.4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem35(){
		if(document.getElementById('conf4.5')){
		var img = fabric.Image.fromURL('conf4/conf4.5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem36(){
		if(document.getElementById('conf4.6')){
		var img = fabric.Image.fromURL('conf4/conf4.6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem37(){
		if(document.getElementById('conf4.7')){
		var img = fabric.Image.fromURL('conf4/conf4.7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem38(){
		if(document.getElementById('conf4.8')){
		var img = fabric.Image.fromURL('conf4/conf4.8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem39(){
		if(document.getElementById('conf4.9')){
		var img = fabric.Image.fromURL('conf4/conf4.9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem40(){
		if(document.getElementById('conf4.10')){
		var img = fabric.Image.fromURL('conf4/conf4.10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem41(){
		if(document.getElementById('conf5.1')){
		var img = fabric.Image.fromURL('conf5/conf5.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		
		function adicionarimagem42(){
		if(document.getElementById('conf5.2')){
		var img = fabric.Image.fromURL('conf5/conf5.2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem43(){
		if(document.getElementById('conf5.3')){
		var img = fabric.Image.fromURL('conf5/conf5.3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem44(){
		if(document.getElementById('conf5.4')){
		var img = fabric.Image.fromURL('conf5/conf5.4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem45(){
		if(document.getElementById('conf5.5')){
		var img = fabric.Image.fromURL('conf5/conf5.5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem46(){
		if(document.getElementById('conf5.6')){
		var img = fabric.Image.fromURL('conf5/conf5.6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem47(){
		if(document.getElementById('conf5.7')){
		var img = fabric.Image.fromURL('conf5/conf5.7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem48(){
		if(document.getElementById('conf5.8')){
		var img = fabric.Image.fromURL('conf5/conf5.8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem49(){
		if(document.getElementById('conf5.9')){
		var img = fabric.Image.fromURL('conf5/conf5.9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem50(){
		if(document.getElementById('conf5.10')){
		var img = fabric.Image.fromURL('conf5/conf5.10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem51(){
		if(document.getElementById('conf6.1')){
		var img = fabric.Image.fromURL('conf6/conf6.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem52(){
		if(document.getElementById('conf6.2')){
		var img = fabric.Image.fromURL('conf6/conf6.2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem53(){
		if(document.getElementById('conf6.3')){
		var img = fabric.Image.fromURL('conf6/conf6.3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem54(){
		if(document.getElementById('conf6.4')){
		var img = fabric.Image.fromURL('conf6/conf6.4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem55(){
		if(document.getElementById('conf6.5')){
		var img = fabric.Image.fromURL('conf6/conf6.5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem56(){
		if(document.getElementById('conf6.6')){
		var img = fabric.Image.fromURL('conf6/conf6.6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem57(){
		if(document.getElementById('conf6.7')){
		var img = fabric.Image.fromURL('conf6/conf6.7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem58(){
		if(document.getElementById('conf6.8')){
		var img = fabric.Image.fromURL('conf6/conf6.8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem59(){
		if(document.getElementById('conf6.9')){
		var img = fabric.Image.fromURL('conf6/conf6.9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem60(){
		if(document.getElementById('conf6.10')){
		var img = fabric.Image.fromURL('conf6/conf6.10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem61(){
		if(document.getElementById('conf7.1')){
		var img = fabric.Image.fromURL('conf7/conf7.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem62(){
		if(document.getElementById('conf7.2')){
		var img = fabric.Image.fromURL('conf6/conf7.2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem63(){
		if(document.getElementById('conf7.3')){
		var img = fabric.Image.fromURL('conf7/conf7.3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem64(){
		if(document.getElementById('conf7.4')){
		var img = fabric.Image.fromURL('conf7/conf7.4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem65(){
		if(document.getElementById('conf7.5')){
		var img = fabric.Image.fromURL('conf7/conf7.5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem66(){
		if(document.getElementById('conf7.6')){
		var img = fabric.Image.fromURL('conf7/conf7.6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem67(){
		if(document.getElementById('conf7.7')){
		var img = fabric.Image.fromURL('conf7/conf7.7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem68(){
		if(document.getElementById('conf7.8')){
		var img = fabric.Image.fromURL('conf7/conf7.8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem69(){
		if(document.getElementById('conf7.9')){
		var img = fabric.Image.fromURL('conf7/conf7.9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem70(){
		if(document.getElementById('conf7.10')){
		var img = fabric.Image.fromURL('conf7/conf7.10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem71(){
		if(document.getElementById('conf8.1')){
		var img = fabric.Image.fromURL('conf8/conf8.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem72(){
		if(document.getElementById('conf8.2')){
		var img = fabric.Image.fromURL('conf8/conf8.2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem73(){
		if(document.getElementById('conf8.3')){
		var img = fabric.Image.fromURL('conf8/conf8.3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem74(){
		if(document.getElementById('conf8.4')){
		var img = fabric.Image.fromURL('conf8/conf8.4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem75(){
		if(document.getElementById('conf8.5')){
		var img = fabric.Image.fromURL('conf8/conf8.5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem76(){
		if(document.getElementById('conf8.6')){
		var img = fabric.Image.fromURL('conf8/conf8.6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem77(){
		if(document.getElementById('conf8.7')){
		var img = fabric.Image.fromURL('conf8/conf8.7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem78(){
		if(document.getElementById('conf8.8')){
		var img = fabric.Image.fromURL('conf8/conf8.8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem79(){
		if(document.getElementById('conf8.9')){
		var img = fabric.Image.fromURL('conf8/conf8.9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem80(){
		if(document.getElementById('conf8.10')){
		var img = fabric.Image.fromURL('conf8/conf8.10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem81(){
		if(document.getElementById('conf9.1')){
		var img = fabric.Image.fromURL('conf9/conf9.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem82(){
		if(document.getElementById('conf9.2')){
		var img = fabric.Image.fromURL('conf9/conf9.2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem83(){
		if(document.getElementById('conf9.3')){
		var img = fabric.Image.fromURL('conf9/conf9.3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem84(){
		if(document.getElementById('conf9.4')){
		var img = fabric.Image.fromURL('conf9/conf9.4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem85(){
		if(document.getElementById('conf9.5')){
		var img = fabric.Image.fromURL('conf9/conf9.5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem86(){
			if(document.getElementById('conf9.6')){
			var img = fabric.Image.fromURL('conf9/conf9.6-removebg-preview.png', function(img){
			canvas.add(img);
			imagem.push(img);
			  context.save();
			});}
			}
		function adicionarimagem87(){
		if(document.getElementById('conf9.7')){
		var img = fabric.Image.fromURL('conf9/conf9.7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem88(){
		if(document.getElementById('conf9.8')){
		var img = fabric.Image.fromURL('conf9/conf9.8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem89(){
		if(document.getElementById('conf9.9')){
		var img = fabric.Image.fromURL('conf9/conf9.9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem90(){
		if(document.getElementById('conf9.10')){
		var img = fabric.Image.fromURL('conf9/conf9.10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem91(){
		if(document.getElementById('conf10.1')){
		var img = fabric.Image.fromURL('conf10/conf10.1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem92(){
		if(document.getElementById('conf10.2')){
		var img = fabric.Image.fromURL('conf10/conf10.2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem93(){
		if(document.getElementById('conf10.3')){
		var img = fabric.Image.fromURL('conf10/conf10.3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem94(){
		if(document.getElementById('conf10.4')){
		var img = fabric.Image.fromURL('conf10/conf10.4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem95(){
		if(document.getElementById('conf10.5')){
		var img = fabric.Image.fromURL('conf10/conf10.5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem96(){
		if(document.getElementById('conf10.6')){
		var img = fabric.Image.fromURL('conf10/conf10.6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem97(){
		if(document.getElementById('conf10.7')){
		var img = fabric.Image.fromURL('conf10/conf10.7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem98(){
		if(document.getElementById('conf10.8')){
		var img = fabric.Image.fromURL('conf10/conf10.8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem99(){
		if(document.getElementById('conf10.9')){
		var img = fabric.Image.fromURL('conf10/conf10.9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem100(){
		if(document.getElementById('conf10.10')){
		var img = fabric.Image.fromURL('conf10/conf10.10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem101(){
		if(document.getElementById('toque1')){
		var img = fabric.Image.fromURL('toque/toque1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem102(){
		if(document.getElementById('toque2')){
		var img = fabric.Image.fromURL('toque/toque1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem103(){
		if(document.getElementById('toque3')){
		var img = fabric.Image.fromURL('toque/toque1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem104(){
		if(document.getElementById('toque4')){
		var img = fabric.Image.fromURL('toque/toque4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem105(){
		if(document.getElementById('toque5')){
		var img = fabric.Image.fromURL('toque/toque5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem106(){
		if(document.getElementById('toque6')){
		var img = fabric.Image.fromURL('toque/toque6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem107(){
		if(document.getElementById('toque7')){
		var img = fabric.Image.fromURL('toque/toque7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem108(){
		if(document.getElementById('toque8')){
		var img = fabric.Image.fromURL('toque/toque8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem109(){
		if(document.getElementById('toque9')){
		var img = fabric.Image.fromURL('toque/toque9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem110(){
		if(document.getElementById('toque10')){
		var img = fabric.Image.fromURL('toque/toque10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem111(){
		if(document.getElementById('carinha1')){
		var img = fabric.Image.fromURL('carinha1/carinha1-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem112(){
		if(document.getElementById('carinha2')){
		var img = fabric.Image.fromURL('carinha1/carinha2-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem113(){
		if(document.getElementById('carinha3')){
		var img = fabric.Image.fromURL('carinha1/carinha3-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem114(){
		if(document.getElementById('carinha4')){
		var img = fabric.Image.fromURL('carinha1/carinha4-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem115(){
		if(document.getElementById('carinha5')){
		var img = fabric.Image.fromURL('carinha1/carinha5-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem116(){
		if(document.getElementById('carinha6')){
		var img = fabric.Image.fromURL('carinha1/carinha6-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem117(){
		if(document.getElementById('carinha7')){
		var img = fabric.Image.fromURL('carinha1/carinha7-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem118(){
		if(document.getElementById('carinha8')){
		var img = fabric.Image.fromURL('carinha1/carinha8-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem119(){
		if(document.getElementById('carinha9')){
		var img = fabric.Image.fromURL('carinha1/carinha9-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}
		function adicionarimagem120(){
		if(document.getElementById('carinha10')){
		var img = fabric.Image.fromURL('carinha1/carinha10-removebg-preview.png', function(img){
		canvas.add(img);
		imagem.push(img);
		  context.save();
		});}
		}

$('#undo').click(function(){
    var object = canvas.getActiveObject();
    if (!object){
        alert('Please select the element to remove');
        return '';
    }
    canvas.remove(object);
});

 
function salvar(){
var canvas =window._canvas= document.getElementById("canva");
var image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream"); //Convert image to 'octet-stream' (Just a download, really)
window.location.href = image;
}



</script>

<script type="text/javascript">

function uploadFile(){
var image = document.querySelector("img");
var nome=document.getElementById("nome");
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
};
if(file){
	reader.readAsDataURL(file);

}else{
	imagem.src="";
}

}


</script>
</body>
</html>
