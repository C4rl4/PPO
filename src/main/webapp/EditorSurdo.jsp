<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*, java.text.*"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.DaoDicionarioPronto" %>
<%@page import="classbeans.DicionarioPronto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
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
<script>alert("Seja Bem vindo");</script>

<!--Menu-->
<a href="principalouvinte.html"><div class="Slogan2"> <p class = "titulo">Sign Writing </p></div></a>
<div class="Inicio"><a href="principalsurdo.jsp"><i class="material-icons"style=" height:100%;">home</i></a></div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>

 <div class="mdl-wrap">

<form method="post" id="formpost" action="/ppo/Dicionario" enctype="multipart/form-data">
    <p>Nome:</p><input id="nome" name="nome"/>
    <p>Descrição:</p><input id="descricao" name="descricao"/>
    <p>Região:</p><input id="regiao" name="regiao"/>
      <input type="hidden"  id="img"name="img" value=""/>
          <button type="submit" class="mdl-button mdl-js-button mdl-button--icon" id="add" title="Adicionar" onclick="salvarbanco()">Salvar no dicionario</button>
</form>
    <div class="mdl-toolbar">

<!--Menu-->
<button style="height:30px"   id="paste" title="Pegar" onclick="salvar()"><i  class="material-icons">content_paste</i></button>
<button style="height:30px"    id="undo" title="Retroceder" onclick="deletar()"><i  class="material-icons">undo</i></button>
<button style="height:30px"    id="undo" title="Retroceder" onclick="deletar()"><i  class="material-icons">delete</i></button>

<div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon" title="mao" style="display:inline-block">
<button onclick="mostrar('seuformulario')">mão1</button>
    <form id="seuformulario" >
      <img src="img/conf1.1.2.png" id="conf1.1" width="70" heigth="50" onclick="adicionarImagem1()"/>
    </form>
  </div>

 <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario2')">mão2</button>

       <form id="seuformulario2" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario3')">mão3</button>

       <form id="seuformulario3" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario4')">mão4</button>

       <form id="seuformulario4" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario5')">mão5</button>

       <form id="seuformulario5" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario6')">mão6</button>

       <form id="seuformulario6" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario7')">mão7</button>

       <form id="seuformulario7" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario8')">mão8</button>

       <form id="seuformulario8" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario9')">mão9</button>

       <form id="seuformulario9" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
       </form>

  </div>
  <div class="mdl-toolbar" class="mdl-button mdl-js-button mdl-button--icon"  title="mao" style="display:inline-block">

    <button onclick="mostrar('seuformulario10')">mão10</button>

       <form id="seuformulario10" >
         <img src="conf2.26.4-removebg-preview.png" id="conf2.26" width="70" heigth="50" onclick="adicionarImagem6()"/>
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
</body>
</html>
