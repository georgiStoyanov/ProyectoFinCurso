<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Iniciar sesión El Martillo</title>

<!-- Bootstrap Core CSS -->
<link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../assets/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../assets/custom/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../assets/font-awesome-4.0.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<jsp:useBean id="usuarioBean" class="modelos.Usuario" scope="request" />
<jsp:setProperty name="usuarioBean" property="*" />
<%if(request.getParameter("email")!=null && request.getParameter("pass")!=null){%>
<jsp:forward page="/ControladorUsuario" />
<%}%>

<!-- jQuery -->
<script src="./../assets/custom/js/jquery-1.8.2.min.js"></script>
<style>
.btn {
	background-color: #E84C3D;
	color: whitesmoke;
}
/* cambio el color de las cajas para que sea igual que las de pagina de inicio! Tambien se podia cambiar en el mismo css para tener los campos input iguales por toda la aplicacion*/
textarea:focus, input[type="text"]:focus, input[type="password"]:focus,
	input[type="datetime"]:focus, input[type="datetime-local"]:focus, input[type="date"]:focus,
	input[type="month"]:focus, input[type="time"]:focus, input[type="week"]:focus,
	input[type="number"]:focus, input[type="email"]:focus, input[type="url"]:focus,
	input[type="search"]:focus, input[type="tel"]:focus, input[type="color"]:focus,
	.uneditable-input:focus {
	border-color: #E84C3D !important;
	outline: 0 none;
}
</style>
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="">
				<div class="">
					<div class="">
						<h3 class="">Iniciar sesión</h3>
					</div>
					<div class="">
						<form role="form" id="user_form" action="../ControladorUsuario">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="Correo electrónico"
										name="email" id="email" type="email" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password" id="pass" name="pass"
										type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox" id="guarda_login"
										value="recuerda">¡Guarda estos datos!
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-block"
									value="Iniciar sesión"></a>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap Core JavaScript -->
	<script src="../assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../assets/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../assets/custom/js/sb-admin-2.js"></script>

	<script type="text/javascript">
	$( document ).ready(function() {
		var datosLogin=localStorage.getItem('ElMartillo');
	    if(localStorage.getItem('ElMartillo')!=null){
	    	datosLogin=JSON.parse(datosLogin);
	    	console.log('Datos estan guardados!');
	    	console.log('datos del login:_'+datosLogin['email']);
	    	$('#email').val(datosLogin['email']);
	    	$('#pass').val(datosLogin['pass'])
	    }
	});
	$( "#user_form" ).submit(function( event ) {
		if($('#guarda_login').is(':checked')){
			console.log('Grabando el login!');
			var usuarioElMartillo={"email":$('#email').val(),"pass":$('#pass').val()};
			localStorage.setItem("ElMartillo" , JSON.stringify(usuarioElMartillo ));	
		}
		});
	</script>

</body>

</html>