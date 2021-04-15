
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*, java.text.*"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>

 
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/fabric2.min.js"></script>
<meta charset="ISO-8859-1">
<title>Editor</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" type="text/css" href="css/Csstext.css" media="screen" />
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>
 <div class="mdl-wrap">
<div class="mdl-toolbar">
<img src="" id="adicionar">
<button class="mdl-button mdl-js-button mdl-button--icon" id="add" title="Adicionar" onclick="adicionarImagem()"><i class="material-icons">add_circle_outline</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="copy" title="Copiar"><i class="material-icons">content_copy</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="paste" title="Pegar" onclick="salvar()"><i class="material-icons">content_paste</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="cut" title="Cortar"><i class="material-icons">content_cut</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="undo" title="Retroceder" onclick="limparImagem()"><i class="material-icons">undo</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="redo" title="Avanzar"><i class="material-icons">redo</i></button>
<button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect" id="fonts" title="Tipo de Fuente"><i class="material-icons">text_format</i></button>
<button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect" id="size" title="Tamaño de Fuente"><i class="material-icons">format_size</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="bold" title="Bold (Ctrl+B)"><i class="material-icons">format_bold</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="italic" title="Italic (Ctrl+I)"><i class="material-icons">format_italic</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="underline" title="Underline (Ctrl+U)"><i class="material-icons">format_underlined</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon mdl-button--color" id="hiliteColor" title="Resaltar"><i class="material-icons">format_paint</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon" id="strikeThrough" title="Trazado"><i class="material-icons">strikethrough_s</i></button>
<button class="mdl-button mdl-js-button mdl-button--icon mdl-button--table" id="table" title="Insertar tabla"><i class="material-icons">view_module</i></button>
</div>
 
<div style="width:300px; height:600px; border:solid; display:inline-block;"id="divcanva1">
<div class="um">
    <table classe = "table"  width= 300 >
      <tr>
        <th classe ="tabela">Imagem</th>
        <th>Significado</th>
      
     
      
      </tbody>

    </table>   </div>
    
</div>
<div style="width:900px; height:600px; border:solid;display:inline-block;"id="divcanva2">

<canvas id="canva" class="editor" width="700" height="600" ></canvas></div>

</div>
</div>
<script>
function adicionarImagem() {
	var canvas = window._canvas = new fabric.Canvas(canva);

	var img = fabric.Image.fromURL('img/conf1.1.3.png', function(img){
		canvas.add(img);
	});
	
	  }
	function salvar(){
	
		var canvas =window._canvas= document.getElementById("canva");
		var image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream"); //Convert image to 'octet-stream' (Just a download, really)
		window.location.href = image;

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


</body>
</html>