<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8" import="modelos.*,java.util.ArrayList"%>
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
				<li class="active"><a href="index.jsp">El Martillo</a></li>
				<% 
				if (request.getAttribute("listaSubCategorias") != null && request.getAttribute("listaCategorias")!=null) {
					ArrayList<SubCategoria> listaSubCategorias=(ArrayList<SubCategoria>) request.getAttribute("listaSubCategorias");
					ArrayList<Categoria> listaCategorias=(ArrayList<Categoria>) request.getAttribute("listaCategorias");

					for(Categoria cat:listaCategorias){
						%>
							<li><a class="drop" href="#"><%out.print(cat.getNombre_categoria()); %></a>
							<ul>
						<% 
						for(SubCategoria subCat: listaSubCategorias){
							if(subCat.getCategoria().equals(cat.getNombre_categoria())){
							%>
								<li><a href="./ControladorPresupuesto?subCategoria=<%out.print(subCat.getId_sub_categoria());%>"><%out.print(subCat.getNombre_sub_categoria());%></a></li>		
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
			<div class="indicador_pasos"></div>
			<fieldset>
				<h2>Información obra</h2>
				<div class="row">
					<div class="col-lg-offset-3 col-md-offset-3 col-lg-6 col-md-6" style="margin-bottom:1em">
						<label>Seleccione categoría del servicio deseado:</label> <select id="categoria_select"
							class="form-control">
							<%
							if (request.getAttribute("listaSubCategorias") != null && request.getAttribute("listaCategorias")!=null) {
								ArrayList<SubCategoria> listaSubCategorias=(ArrayList<SubCategoria>) request.getAttribute("listaSubCategorias");
								ArrayList<Categoria> listaCategorias=(ArrayList<Categoria>) request.getAttribute("listaCategorias");
								String catSeleccionada=request.getParameter("subCategoria");
								int categoriaSeleccionada;
								try{
									categoriaSeleccionada=Integer.parseInt(catSeleccionada);
									for(Categoria cat:listaCategorias){
										%> <optgroup label="<%out.print(cat.getNombre_categoria());%>"><%
									
									for(SubCategoria servicio:listaSubCategorias){
										if(servicio.getCategoria().equals(cat.getNombre_categoria())){
												if(categoriaSeleccionada==servicio.getId_sub_categoria()){
													%>
													<option selected value="<%out.println(servicio.getId_sub_categoria());%>"><%out.println(servicio.getNombre_sub_categoria());%></option>
													<%	
												}else{
													%>
													<option value="<%out.println(servicio.getId_sub_categoria());%>"><%out.println(servicio.getNombre_sub_categoria());%></option>
													<%
												}
											}
										}
									}%>
										</optgroup>
									<%
								}catch(Exception e){
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
								}
							}else{%>
								<option selected disabled>Error de servidor!</option>
								<% 
							}
							%>
						</select>
					</div>
				</div>
					<div id="servicios_compatibles" class="row">
					<div class="col-lg-offset-3 col-md-offset-3 col-lg-6 col-md-6" style="margin-bottom:1em;text-align:center"><label style="font-size:.7em;">Introduzca las medidas de los servicios que quiere calcular, el resto de los campos puede dejar en blanco</label></div>
					<form id="servicios_a_calcular" action="./CalculadoraPresupuestos">
						<% if(request.getAttribute("listaServicios")!=null){
							ArrayList<Servicio> listaServicios=(ArrayList<Servicio>) request.getAttribute("listaServicios");
							for(Servicio ser:listaServicios){
								//recojer todos los parametros en el servlet de control y ir iterando sobre estos parametros.En name del parametro pondre "Servicio:medida_del_servicio:id_Del_servicio"  y el valor sera la medida para calcular estos servicios simplificados.
								%><div class="col-lg-4 col-md-5"><label><%out.print(ser.getNombre());%></label><input style="width:100%" class="from-control" name="Servicio:<%out.print(ser.getNombre());%>:<%out.print(ser.getMedida());%>:<%out.print(ser.getId());%>" type="number" min="0" step="0.01" type="numeric" placeholder="<%out.print(ser.getNombre());%> <%out.print(ser.getMedida());%>"/></div><%
							}
						}
						%>
						</form>
					</div>
			</fieldset>
			<fieldset>
				<h2>Precios orientativos</h2>
				<div class="row" id="precios_orientativos">
				</div>
			</fieldset>
			<fieldset>
				<h2>Informacion contacto</h2>
					<form id="necesito_ayuda_calcular" action="./ControladorComentario" method="post">
					<div class="row">
						<div class="col-lg-6 col-md-6"><label>Persona de contacto:</label>
							<input class="btmspace-15" style="width:100%" type="text" name="NombreContacto" id="name" placeholder="Su nombre" />
						</div> 
						<div class="col-lg-6 col-md-6">
							<label>Correo electrónico:</label> <input style="width:100%"
								class="btmspace-15" type="email" name="emailContacto" id="val" placeholder="Email" />
						</div>
					<div class="col-lg-6 col-md-6">
							<label>Dirección de la obra:</label> <input style="width:100%"
								class="btmspace-15" type="text" name="direccionObra" id="val" placeholder="La completa direccion del edifico donde se va a realizar la obra." />
					</div>
					<div class="col-lg-6 col-md-6">
							<label>Teléfono de contacto:</label> <input style="width:100%"
								class="btmspace-15" type="tel" name="tel1" id="val" placeholder="Teléfono de contacto 1" />
					</div>
						<div class="col-lg-12 col-md-12">
							<label>Descripcion:</label>
							<textarea class="btmspace-15" style="width:100%" name="descripcion" id="content" style="width: 100%; height: 7em;" placeholder="Aqui puede describir la situacion de la obra o simplemente añadir información adicional que considera importante."></textarea>
						</div>
					</div>
					</form>
			</fieldset>
		<!-- Este campo es por si el usuario no ecuentra lo que busca y pide ayuda -->
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
	<!-- IE9 Placeholder Support -->
	<script src="layout/scripts/jquery.placeholder.min.js"></script>
	<!-- / IE9 Placeholder Support -->

	<!-- Magnific PopUp -->
	<script src="./assets/MagnificPopUp/jquery.magnific-popup.min.js"></script>

	<script type="text/javascript">
		
		$(document).ready(function() {
			$('#categoria_select').on('change',function(ev){
				console.log("Subcategoria seleccionada:_"+($(this)[0].options[this.selectedIndex].value)+":_! Redireccionando");
				window.location.href="./ControladorPresupuesto?subCategoria="+($(this)[0].options[this.selectedIndex].value);
			})
			$('#servicios_a_calcular').on('submit',function(e){
				e.preventDefault();
				console.log("Mandado el formulario a :_"+$(this).attr('action'));
					$.ajax({
						url : $(this).attr('action'),
			            type: "POST",
			            data: $(this).serialize(),
			            success: function (data, textStatus, request) {
			            	console.log("Tipo de data recibido:_"+request.getResponseHeader("content-type"));
			            	if(request.getResponseHeader("content-type")=="text/plain;charset=charset=UTF-8"){
				            	$('#precios_orientativos').empty();
				            	var preciosEnterosParts=data.split(";");
				            	$('#precios_orientativos').append("<table id='tabla_precios'><thead><th>Tipo servicio:</th><th>Cantidad</th><th>Total servicio:</th></thead><tbody id='cuerpo_tabla_precios'></tbody></table>");
				            	var contenidoTabla;
				            	/* pongo menor o igual porque me coje el último ; y la ultima posicion es undefined*/
				            	for(var e=0;e<preciosEnterosParts.length-1;e++){
				            		var precioParts=preciosEnterosParts[e].split("-");
				            			$('#cuerpo_tabla_precios').append("<tr><td>"+precioParts[0]+"</td><td>"+precioParts[1]+"</td><td>"+precioParts[2]+"</td></tr>");
				            	}
			            	}
			            },
			            error: function (xhr, status, error) {
			            	console.log(xhr.responseText);
			            	$('#precios_orientativos').append("<h2>Ha ocurrido un error!</h2>");
			            	Console.log("Error al enviar la peticion al servidor.Compruebe su coneccion!");
			            }
						})	
				});
			
			/* ---- SCRIPT DE PASOS -------------- esto esta hecho para evitar el refresco de las paginas.Se podria haber hecho en distintas paginas pero porque refrescar si se puede no refrescar la pagina al formsubmit*/
			
			
			var numeroFields = $('fieldset')['length'] - 1;
			var fieldsets = $("fieldset");

			/*
			 * los fieldsets son los pasos de formulario
			 */
			var currentField;
			if (fieldsets[0] !== null) {
				currentField = 0;
				for (var a = numeroFields; a > 0; a--) {
					fieldsets[a].setAttribute('class', 'hidden');
				}
				/*---------------------------Generacion de los indicadores de los pasos---------------------------*/
				if ($(window).width() > 500) {
					for (var a = 0; a <= numeroFields; a++) {
						($('<div class="indicador_paso" style="background:#EEEEEE;-webkit-border-radius:.5em;-moz-border-radius:.5em;padding:.5em;border-radius:.5em;width:'
								+ (parseInt(100 / (numeroFields + 1)) - 5)
								+ '%";>'
								+ fieldsets[a].firstElementChild.textContent
								+ '</div>'))
								.appendTo($('.indicador_pasos')[0]);
					}
				} else {
					for (var a = 0; a <= numeroFields; a++) {
						($('<div class="indicador_paso" style="background:#EEEEEE;-webkit-border-radius:.5em;-moz-border-radius:.5em;padding:.5em;border-radius:.5em;">'
								+ fieldsets[a].firstElementChild.textContent
								+ '</div>'))
								.appendTo($('.indicador_pasos')[0]);
					}
				}
			}
			var indicadores = $(".indicador_paso");
			if ($(indicadores[0]) != null) {
				$(indicadores[0]).css("background", "#E84C3D");
				$(indicadores[0]).css("color", "whitesmoke");
			}

			/*----------------------funcionalidad de los botones de paginacion--------------------------*/
			var btn_anterior = $(".btn_anterior");
			var btn_siguiente = $(".btn_siguiente");

			btn_anterior[0].setAttribute('class', 'btn disabled');
			btn_anterior[0].addEventListener("click", function() {
				if (currentField > 0) {
					fieldsets[currentField].setAttribute('class',
							'hidden');
					fieldsets[currentField - 1].setAttribute('class',
							'');
					currentField--;
					$(indicadores[currentField]).css("background",
							"#E84C3D");
					$(indicadores[currentField + 1]).css("background",
							"#f28c82");
				}
				if (currentField == 0) {
					btn_anterior[0].setAttribute('class',
							'boton btn disabled');
				} else if (currentField != numeroFields) {
					btn_siguiente.val('Siguiente');
				}
			})
			btn_siguiente[0].addEventListener("click", function() {
				if (currentField == numeroFields
						&& btn_siguiente[0].value == 'Enviar') {
					$('.enviar')[0].click();
				}
				if (currentField == 0) {
					$('#servicios_a_calcular').submit();
				}
				if (currentField < numeroFields) {
					fieldsets[currentField].setAttribute('class',
							'hidden');
					fieldsets[currentField + 1].setAttribute('class',
							'');
					currentField++;
					$(indicadores[currentField]).css("background",
							"#E84C3D");
					$(indicadores[currentField]).css("color",
							"whitesmoke");
					$(indicadores[currentField - 1]).css("background",
							"#f28c82");
				}
				if (currentField == numeroFields) {
					btn_siguiente.val('Quiero contactar');
				} else if (currentField > 0) {
					btn_anterior[0].setAttribute('class', 'btn');
				}
			})
		});
	</script>
</body>
</html>