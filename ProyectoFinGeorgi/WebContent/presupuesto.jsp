<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="modelos.*,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Calcula Presupuesto-El Martillo</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="./assets/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<link href="./layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="./assets/custom/css/w3.css" rel="stylesheet" type="text/css"
	media="all">
<link href="./assets/MagnificPopUp/magnific-popup.css" rel="stylesheet"
	type="text/css" media="all">
<!-- /--------------------JSP-------------------------------------------- -->
<jsp:useBean id="comentBean" class="modelos.Comentario" scope="request" />
<jsp:setProperty name="comentBean" property="*" />
<%
	if (request.getParameter("content") != null && request.getParameter("email") != null) {
%>
<jsp:forward page="/ControladorComentario" />
<%
	}
%>
</head>
<style>
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

body {
	background: white;
	height:100%;
	min-height:100%;
}

@media ( min-width : 500px) {
	.indicador_pasos {
		text-align: center;
		margin-bottom: .5em;
	}
	.indicador_paso {
		margin-right: 1em;
		display: inline-block;
	}
}

@media ( max-width : 500px) {
	.indicador_paso {
		margin: auto;
		margin-bottom: .2em;
	}
	.row5{
	position:relative !important;
	margin-top:.5em;
}
}

fieldset {
	background: #44494C;
	padding: 1em;
	margin-bottom: .5em;
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
}

.btn:hover, .btn.inverse {
	color: black;
	background-color: transparent;
	border-color: inherit;
}
}
</style>
<body id="top">
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row0">
		<div id="topbar" class="hoc clear">
			<!-- ################################################################################################ -->
			<nav id="mainav" class="fl_left">
			<ul class="clear">
				<li class="active"><a href="index.jsp">El Martillo</a></li>
				<li><a class="drop" href="#">Reformas</a>
					<ul>
						<li><a href="#">Reformas Viviendas</a></li>
						<li><a href="#">Reformas Baños</a></li>
						<li><a href="#">Reformas Cocinas</a></li>
						<li><a href="#">Reformas Oficinas</a></li>
						<li><a href="#">Locales Comerciales</a></li>
					</ul></li>

				<li><a class="drop" href="#">Obras menores</a>
					<ul>
						<li><a href="#">Parquetistas</a></li>
						<li><a href="#">Fontaneros</a></li>
						<li><a href="#">Pintores</a></li>
						<li><a href="#">Tejados</a></li>
						<li><a href="#">Albañiles</a></li>
						<li><a href="#">Carpinteros</a></li>
					</ul></li>

				<li><a class="drop" href="#">Instalaciones</a>
					<ul>
						<li><a href="#">Electrodomésticos</a></li>
						<li><a href="#">Aire acondicionado</a></li>
						<li><a href="#">Antenas</a></li>
						<li><a href="#">Electricistas</a></li>
					</ul></li>
				<li><a class="drop" href="#">Otros</a>
					<ul>
						<li><a href="#">Desescombrar</a></li>
						<li><a href="#">Montaje Muebles</a></li>
						<li><a href="#">Instalación complementos</a></li>
						<li><a href="#">Más</a></li>
					</ul></li>
				<li><a href="#" class="active">Contacto</a></li>
			</ul>
			</nav>
			<!-- ################################################################################################ -->
			<!--<div class="fl_right">
      <ul class="faico clear">
        <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
        <li><a class="faicon-pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
        <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
        <li><a class="faicon-dribble" href="#"><i class="fa fa-dribbble"></i></a></li>
        <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
        <li><a class="faicon-google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
        <li><a class="faicon-rss" href="#"><i class="fa fa-rss"></i></a></li>
      </ul>
    </div> -->
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row1">
		<header id="header" class="hoc clear"> <!-- ################################################################################################ -->
		<div id="logo" class="fl_left">
			<img style="width: 60%; height: 60%;"
				src="./assets/custom/img/logo2.png" />
		</div>
		<div id="quickinfo" class="fl_right">
			<ul class="nospace inline">
				<li style="text-align: center; margin-top: 1.5em;"><strong>Contacta
						con nosotros:</strong><br> +34 611 381 940</li>
			</ul>
		</div>
		<!-- ################################################################################################ -->
		</header>
	</div>

	<div style="background: white; width: 80%; margin: auto;">

			<div class="indicador_pasos"></div>
			<fieldset>
				<h2>Información obra</h2>
				<div class="row">
					<div class=" col-lg-6 col-md-6">
						<label>Seleccione categoría del servicio deseado:</label> <select id="categoria_select"
							class="form-control">
							<%
							if (request.getAttribute("listaSubCategorias") != null && request.getAttribute("listaCategorias")!=null) {
								ArrayList<SubCategoria> listaSubCategorias=(ArrayList<SubCategoria>) request.getAttribute("listaSubCategorias");
								ArrayList<Categoria> listaCategorias=(ArrayList<Categoria>) request.getAttribute("listaCategorias");
							%>
							<option selected disabled>Seleccione una categoría</option>
							<%
							
							for(Categoria cat:listaCategorias){
									%> <optgroup label="<%out.print(cat.getNombre_categoria());%>"><%
								
								for(SubCategoria servicio:listaSubCategorias){ 
									if(servicio.getCategoria().equals(cat.getNombre_categoria())){
							%>
							<option value="<%out.println(servicio.getId_sub_categoria());%>"><%out.println(servicio.getNombre_sub_categoria());%></option>

							<%
							
									}
								}
							}%>
								</optgroup>
							<%
							}else{%>
								<option selected disabled>Error de servidor!</option>
								<% 
							}
							%>
						</select>
					</div>
					<div id="servicios_compatibles" class="row">
						<% if(request.getAttribute("listaServicios")!=null){
							ArrayList<Servicio> listaServicios=(ArrayList<Servicio>) request.getAttribute("listaServicios");
							for(Servicio ser:listaServicios){
								out.print(ser.getNombre());
							}
						}
						%>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<h2>Precios orientativos</h2>
				<div class="row" id="informacion_obra"></div>
				<input type="text" class="form-control" />
			</fieldset>
			<fieldset>
				<h2>Informacion contacto</h2>
				<input type="text" class="form-control" />
			</fieldset>
		<!-- Este campo es por si el usuario no ecuentra lo que busca y pide ayuda
						<form id="necesito_ayuda_calcular" class="hidden" action="./ControladorComentario" method="post">
						<legend>Contacto</legend>
						Nombre: 
						<input class="btmspace-15" type="text" name="name" id="name"
							placeholder="Nombre" /> 
						Correo electrónico: <input
							class="btmspace-15" type="email" name="email" id="val" placeholder="Email" />
						Descripcion del problema:
						<textarea class="btmspace-15" name="content" id="content" style="width: 100%; height: 7em;" placeholder="Descripcion"></textarea>
						<button type="submit" value="submit">Enviar</button>
		</form>-->
		<input type="button" class="btn btn_anterior" value="Anterior">
		<input type="button" class="btn btn_siguiente pull-right"
			value="Siguente">
	</div>

	<div class="wrapper row5" style="position:absolute;bottom: 0;">
		<div id="copyright" class="hoc clear">
			<!-- ################################################################################################ -->
			<p class="fl_left">
				Copyright &copy; 2017 - Todos los derechos reservados - <a href="#">El
					Martillo</a>
			</p>
			<p class="fl_right">
				Template by <a target="_blank" href="http://www.os-templates.com/"
					title="Free Website Templates">OS Templates</a>
			</p>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="./assets/bootstrap/js/bootstrap.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<script src="./assets/custom/js/georgiSteps.js"></script>
	<!-- IE9 Placeholder Support -->
	<script src="layout/scripts/jquery.placeholder.min.js"></script>
	<!-- / IE9 Placeholder Support -->

	<!-- Magnific PopUp -->
	<script src="./assets/MagnificPopUp/jquery.magnific-popup.min.js"></script>

	<script type="text/javascript">
		//
		$(document).ready(function() {
			$('#categoria_select').on('change',function(ev){
				sacaServicios($(this)[0].options[this.selectedIndex].text);
			})
		});
		function sacaServicios(valor){
			switch(valor){
				case "Reforma Vivienda":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Reforma Baño":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Reforma Cocina":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Reforma Oficina":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Reforma Local Comercial":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Parquetista":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Fontanero":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Pintor":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Carpintero":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Tejados":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Albañil":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Desescombrar":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Montar muebles":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Instalación complementos":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Electricistas":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Electrodomésticos":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Aire acondicionado":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
				case "Montar muebles":
					console.log('Seleccionado:_'+valor);
					reformaVivienda();
					break;
			}
		}
		function reformaVivienda(){
			$('#servicios_compatibles').append();
		}
	</script>
</body>
</html>