<%@page import="model.entity.Ballot"%>
<%
	Ballot a = (Ballot) request.getAttribute("ballot");
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
		<Label>Pre-Emisi�n de Boleta</Label>
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
	<form method="post" action="/ballots/edit?id=<%=a.getId()%>">
		<label>Nombre Cliente: </label> <input class="inp-NomCli" type="text"
			name="Usuario" value="<%=a.getCliente()%>" placeholder="Su nombre: "
			autofocus required> <br /> <label>Direcci�n: </label> <input
			class="inp-NomCli" type="text" name="direccion"
			value="<%=a.getDireccion()%>" placeholder="Su direcci�n..." required>
		<br /> <label>Distrito: </label> <input class="inp-Tel" type="text"
			name="distrito" value="<%=a.getDistrito()%>"
			placeholder="Su distrito..." required> <label>Tel�fono:
		</label> <input class="inp-Tel" type="number" name="telefono"
			value="<%=a.getTelefono()%>" required> <br /> <label>Cantidad:
		</label> <input class="inp-Cant" type="number" name="cantidad"
			value="<%=a.getCantidad()%>" placeholder="N�" required> <input
			class="inp-Sub" type="submit" value="Guardar Boleta">
	</form>
	<script>
				(function(){
					
					var formulario = document.getElementsByName('Reci')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarCliente = function(e){
						if(formulario.Usuario.value == ""){
							alert("Llene el campo usuario");
							e.preventDefault();
						}
						else if(isNaN(formulario.Usuario.value)===false){
							alert("El campo USUARIO solo debe contener letras");
							e.preventDefault();
						}
					}
					var validarDireccion = function(e){
						if(formulario.direccion.value == ""){
							alert("Llene el campo direccion");
							e.preventDefault();
						}
					}
					var validarDistrito = function(e){
						if(formulario.distrito.value == ""){
							alert("Llene el campo distrito");
							e.preventDefault();
						}
						else if(isNaN(formulario.distrito.value)){
							alert("Complete el campo DISTRITO solo con letras");
							e.preventDefault();
						}
					var validarTelefono = function(e){
						if(formulario.telefono.value == ""){
							alert("Llene el campo telefono");
							e.preventDefault();
						}
						else if(isNaN(formulario.telefono.value)){
							alert("Compelete el campo TELEFONO solo con n�meros");
							e.preventDefault();
						}
						else if(formulario.telefono.value.length < 9 || formulario.celular.value.length > 9){
							alert("El campo telefono debe contener un n�mero de 9 digitos");
							e.preventDefault();
						}
					}

					}
					var validarCantidad = function(e){
						if(formulario.cantidad.value == ""){
							alert("Llene el campo cantidad");
							e.preventDefault();
						}
					}
					var bloqueoBoton = function(e){
						document.forms['Reci']['Enviar'].disabled=true;
					}
					var validar = function(e){
						validarCliente(e);
						validarDNI(e);
						validarDistrito(e);
						validarDireccion(e);
						validarTelefono(e);
						validarCantidad(e);
						bloqueoBoton(e);
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







