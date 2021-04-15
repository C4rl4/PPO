<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/dicionario.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
 
<title>Dicionario</title>
</head>
<body>

    <h1>Dicionário</h1>
    <div class="um">
    <table classe = "table"  border="1" width= 500  >
      <tr>
        <th classe ="tabela">Imagem</th>
        <th>Significado</th>
       <tbody>
      <c:forEach items="${DicionarioPronto} " var="dicionario">
      <tr>
      <td><c:out value="${dicionario.img} "/></td>
      <td><c:out value="${dicionario.nome} "/></td>
      </tr>
      
      </c:forEach>

    </table>   </div>
    


</body>
</html>