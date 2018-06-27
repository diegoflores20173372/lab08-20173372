<%@page import="java.util.List"%>
<%@page import="model.entity.Ballot"%>
<%
	List<Ballot> ballots = (List<Ballot>) request.getAttribute("ballots");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Llantas D&J</title>
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
		<Label>Pre-Emisión de Boleta</Label>
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
	<h4>Acciones Disponibles</h4>
	<a href="/ballots/add">Nuevo Recibo</a>
	<%
		if (ballots.size() > 0) {
	%>
	<span class="heading"><%=ballots.size()%> Recibos generados: </span>
	<table >
		<tr >
			<td >ID</td>
			<td >Usuario</td>
			<td >DNI</td>
			<td >Dirección</td>
			<td >Distrito</td>
			<td >Teléfono</td>
			<td >N° Boleta</td>
			<td >Cantidad</td>
			<td >Llanta</td>
			<td >PrecioUnitario</td>
			<td >Precio</td>
			<td >Opciones</td>		
		</tr>
		<%
			for (int i = 0; i < ballots.size(); i++) {
		%>
		<%
			Ballot a = (Ballot) ballots.get(i);
		%>
		<tr style="background: #ffffff"
			onMouseOver="this.style.background='#eeeeee';"
			onMouseOut="this.style.background='#ffffff';">
			<td><%=a.getId()%></td>
			<td><%=a.getCliente()%></td>
			<td><%=a.getDni()%></td>
			<td><%=a.getDireccion()%></td>
			<td><%=a.getDistrito()%></td>
			<td><%=a.getTelefono()%></td>
			<td><%=a.getNBoleta()%></td>
			<td><%=a.getCantidad()%></td>
			<td><%=a.getLlanta()%></td>
			<td><%=a.getPrecioUnitario()%></td>
			<td><%=a.getPrecioFinal()%></td>
			<td><a href="/ballots/edit?id=<%=a.getId() %>">Editar</a><a href="/ballots/view?id=<%=a.getId() %>">Ver</a><a href="/ballots/delete?id=<%=a.getId() %>">Borrar</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} else {
	%>
	<span class="heading">Sin recibos generados.</span>
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