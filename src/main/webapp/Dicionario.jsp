<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="dao.DaoDicionarioPronto" %>
<%@page import="classbeans.DicionarioPronto" %>
<%@page import="java.util.ArrayList" %>

<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="css/dicionario2.css">
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<body>
  <!--Menu-->

      <a href="principalouvinte.html"><div class="Slogan2"> <p class = "titulo">Sign Writing </p></div></a>
      <div class="Inicio"><a href="principalouvinte.jsp"><i class="material-icons"style=" height:100%;">home</i></a></div>

<br>
  <h1 >Dicionario</h1>

  <!--Barra de pesquisa-->

  <!-- Barra de search(procurar) ou filtro -->
       <form class='box'>
        <!-- Lupa -->
        <span class='material-icons bloom' onclick="buscar()">search</span>
        <!-- Input de procura do usuário -->
        <input id='inputUser' list="opcoes" onchange='searchBar()' type='text' placeholder='Pesquisa'>
        
        <datalist id="opcoes">
        <%
	ArrayList<DicionarioPronto>lista = new ArrayList<DicionarioPronto>();
		
	try{
		DaoDicionarioPronto dDao = new DaoDicionarioPronto();
	lista=dDao.getallDicionario();
	}catch(Exception e){
		out.println(e);
	}
	for(DicionarioPronto p: lista){
	
	%>
          <option ><%=p.getNome() %></option>
          <%} %>
        </datalist>
      </form>
      <p id="resultadonome"></p><br></br>
       <p id="resultacategoria"></p>
  <input id="resultadoimg" type="image" style="width:100px"  src=""/>

<!--tabela-->
<br>
       <section class="main">
<%
ArrayList<DicionarioPronto> dici = new ArrayList<DicionarioPronto>();
try{
	DaoDicionarioPronto dDao = new DaoDicionarioPronto();
	dici= dDao.getallDicionario();
}catch(Exception e){
	out.println(e);
}
for(DicionarioPronto p: dici){


%>

  <div class="wrap wrap--1" style="display:inline-block">
    <div class="container container--1" style="width:150px;height:90px" >
   		<input type="image" style="width:60%; height:70px; padding-top:20px;"  src="<%=p.getReceber().getAbsolutePath() %>"/>
   		<p style="color:black; font-size:12px"><%=p.getNome()%></p><br></br>
   		<p style="color:black; font-size:12px"><%=p.getCategoria()%></p>
  </div>
     </div>
 
<%} %>
</section>
<script>
var captura="";
function buscar(){
	captura=document.getElementById('inputUser').value;
	document.getElementById('resultadonome').innerHTML=captura;
	document.getElementById('resultadoimg').src="img/"+captura+".png";
}
</script>
   <script src= "cad.js"></script>


</body>
</html>
