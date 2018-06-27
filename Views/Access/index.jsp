<%@page import="java.util.*"%>
<%@page import="model.entity.Access"%>
<%
	List<Access> aux = (List<Access>) request.getAttribute("acceso");
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Recursos</title>
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
		<Label>Lista de Recursos</Label>
		<nav>
			<ul>
				<li><a href="/..">Home Page</a></li>
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
	<h4>Acciones Disponibles:</h4>
	<a href="/access/add">Añadir Nuevo Acceso</a>
	<br />
	<%
		if (aux.size() > 0) {
	%>
	<span class="heading"><%=aux.size()%></span> Accesos Generados:
	<table>
		<tr>
			<td>ID</td>
			<td>Rol</td>
			<td>URL</td>
			<td>Estado</td>
			<td>Creación</td>
			<td>Acción</td>
		</tr>
		<%
			for (int i = 0; i < aux.size(); i++) {
					Access a = (Access) aux.get(i);
					
		%>
		<tr>
			<td><%=a.getId()%></td>
			<td><%=a.getIdRole()%></td>
			<td><%=a.getIdResource()%></td>
			<td><%=a.isStatus()%></td>
			<td><%=a.getCreate()%></td>
			<td><a href="/access/edit?id=<%=a.getId()%>">Editar  </a><a
				href="/access/view?id=<%=a.getId()%>">Ver  </a><a
				href="/access/delete?id=<%=a.getId()%>">Borrar</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} else {
	%>
	<span class="heading">Sin accesos generados.</span>
	<%
		}
	%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	

</body>
</html>