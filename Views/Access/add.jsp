<%@page import="model.entity.Rol" %>
<%@page import="model.entity.Resource" %>
<%@page import="java.util.List" %>
<%
	List<Rol> aux1 = (List<Rol>) request.getAttribute("roles");
	List<Resource> aux2 = (List<Resource>) request.getAttribute("recursos");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Acceso</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimun-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/estilo.css">

</head>
<body>
	<header>
		<Label>Añadir Acceso</Label>
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
	<h5>Acciones a realizar</h5>
	<a href="/..">Lista de Recursos</a>
	<form method="Post" action="/access/add" name="formulario" onsubmit="document.forms['formulario']['Enviar'].disabled=true;">
		<select name="rolUser">
			<%for(int i = 0 ; i < aux1.size() ; i ++){ %><%Rol a = (Rol) aux1.get(i); %>
			<option value="<%=a.getName() %>"><%=a.getName() %></option>
		<%} %></select>
		<select name="recursoUrl">
		<%for(int i = 0 ; i < aux2.size() ; i ++){ %><%Resource a = (Resource) aux2.get(i); %>
			<option value="<%=a.getUrl() %>"><%=a.getUrl() %></option>
		<%} %>
		</select>
		<input type="submit" name="Enviar" value="Crear Acceso" >
	</form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
</body>
</html>