<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8" import="modelos.*,services.*,java.util.ArrayList,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Calcula Presupuesto-El Martillo</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="${pageContext.request.contextPath}/assets/custom/css/w3.css" rel="stylesheet" type="text/css"
	media="all">
<link href="${pageContext.request.contextPath}/assets/MagnificPopUp/magnific-popup.css" rel="stylesheet"
	type="text/css" media="all">
<!-- /--------------------JSP-------------------------------------------- -->
<%!List<SubCategoria> listaSubCategorias = new ArrayList<SubCategoria>();
	List<Categoria> listaCategorias = new ArrayList<Categoria>();
	public void jspInit() {
		listaCategorias = new CategoriaService().getCategorias();
		listaSubCategorias = new SubCategoriaService().getSubCategorias();
	}%>
<%
	if (request.getParameter("content") != null && request.getParameter("email") != null) {
%>
<jsp:forward page="${pageContext.request.contextPath}/ControladorComentario" />
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
				<li class="active"><a href="${pageContext.request.contextPath}/index.jsp">El Martillo</a></li>
				<% 
				if (listaSubCategorias!= null && listaCategorias!=null) {
					for(Categoria cat:listaCategorias){
						%>
							<li><a class="drop" href="#"><%out.print(cat.getNombre_categoria()); %></a>
							<ul>
						<% 
						for(SubCategoria subCat: listaSubCategorias){
							if(subCat.getCategoria().equals(cat.getNombre_categoria())){
							%>
								<li><a href="${pageContext.request.contextPath}/ControladorPresupuesto?subCategoria=<%out.print(subCat.getId_sub_categoria());%>"><%out.print(subCat.getNombre_sub_categoria());%></a></li>		
							<%
							}
						}
						%>
							</ul></li>
						<% 
					} 
				}%>
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
			<div class="indicador_pasos">
				<div class="indicador_paso" style="background: rgb(242, 140, 130); padding: 0.5em; border-radius: 0.5em; width: 28%; color: whitesmoke;" ;="">Información obra</div><div class="indicador_paso" style="background: rgb(232, 76, 61); padding: 0.5em; border-radius: 0.5em; width: 28%; color: whitesmoke;" ;="">Precios orientativos</div><div class="indicador_paso" style="background:#EEEEEE;-webkit-border-radius:.5em;-moz-border-radius:.5em;padding:.5em;border-radius:.5em;width:28%" ;="">Informacion contacto</div>
			</div>
			<fieldset>
				<h2>Precios orientativos</h2>
				<div class="row" id="precios_orientativos">
					<%if(request.getAttribute("serviciosCalculados")!=null){
						List<ServicioCalculado> listaServicios=(ArrayList<ServicioCalculado>)request.getAttribute("serviciosCalculados");%>
						<table id='tabla_precios'><thead><th>Tipo servicio:</th><th>Cantidad</th><th>Total servicio:</th></thead><tbody>
						<%
						for(ServicioCalculado servicio:listaServicios){
							%><tr><td><%out.print(servicio.getServicio_nombre());%></td><td><%out.print(servicio.getCuanto_medida());%></td><td><%out.print(servicio.getTotal_precio());%></td></tr><% 
						}
					} %>
					</tbody></table>
				</div>
			</fieldset>
		<!-- Este campo es por si el usuario no ecuentra lo que busca y pide ayuda -->
		<input type="button" class="btn btn_anterior" href="./Presupuesto1.jsp" value="Anterior"/>
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
	<!-- IE9 Placeholder Support -->
	<script src="layout/scripts/jquery.placeholder.min.js"></script>
	<!-- / IE9 Placeholder Support -->

	<!-- Magnific PopUp -->
	<script src="./assets/MagnificPopUp/jquery.magnific-popup.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$(".btn_anterior")[0].addEventListener('click',function(){
			window.location.href="./Presupuesto1.jsp";
		});
		$(".btn_siguiente")[0].addEventListener('click',function(){
			window.location.href="./Presupuesto3.jsp";
		});
	});
	</script>
</body>
</html>