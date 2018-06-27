<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.entity.Rol"%>
<%
	Rol aux = (Rol) request.getAttribute("miRol");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Rol</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimun-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/estilo.css">
<link rel="stylesheet" type="text/css" href="/css/style.css" >
</head>
<body>
	<header>
		<Label>Editar Rol</Label>
		<nav>
			<ul>
				<li><a href="/../..">Home Page</a></li>
				<li><a href="/ballots">Ballots</a></li>
				<li><a href="/roles">Roles</a></li>
				<li><a href="/users">Users</a></li>
				<li><a href="/resources">Resources</a></li>
				<li><a href="/access">Access</a></li>
				<li><a href="/users/login">Login</a></li>
				<li><a href="/users/logout">LogOut</a></li>
			</ul>
		</nav>
	</header>
	<form method="Post" action="/roles/edit?id=<%=aux.getId()%>" name="formulario">
		<label>Añadir Roles</label> <input type="text" name="Name"
			value="<%=aux.getName()%>" placeholder="Añada el nuevo Rol" autofocus
			required> <select name="estado" >
			<option value="true">True</option>
			<option value="false">False</option>
		</select> <input type="submit" value="Editar Rol" name="Enviar">
	</form>
	<script>
		(function(){
			var formulario = document.getElementsByName('formulario')[0],
				elementos = formulario.elements,
				boton = document.getElementById('submit');
			
			var validarNombre = function(e){
				if(formulario.Name.value.length < 1){
					alert("Llene el campo Rol.");
					e.preventDefault();
				}
				else if(isNaN(formulario.Name.value) == false){
					alert("El campo ROL tiene caracter/es no válidos.");
					e.preventDefault();
				}
				else{
					bloqueoBoton(e);
				}
			}
			var bloqueoBoton = function(e){
				document.forms['formulario']['Enviar'].disabled=true;
			}
			var validar = function(e){
				validarNombre(e);
			}
			formulario.addEventListener("submit",validar);
		}())
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
</body>
</html>