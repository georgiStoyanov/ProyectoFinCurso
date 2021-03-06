<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="modelos.*,services.*,java.util.ArrayList,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>El Martillo</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="./layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="./assets/custom/css/w3.css" rel="stylesheet" type="text/css"
	media="all">
<link href="./assets/MagnificPopUp/magnific-popup.css" rel="stylesheet" type="text/css"
	media="all">
	<%!
private List<Categoria> listaCategorias;
private List<SubCategoria> listaSubCategorias;
public void jspInit() {    
this.listaCategorias=new CategoriaService().getCategorias();
this.listaSubCategorias=new SubCategoriaService().getSubCategorias();
}
%>
<!-- /--------------------JSP-------------------------------------------- -->
<!-- Esta parte esta omitida y controlada con JavaScript abajo para prevenir el refresco de la página al mandar el form
-->
<%
	jspInit();
if(request.getParameter("content")!=null && request.getParameter("email")!=null){%>
<jsp:forward page="/ControladorComentario" />
<%}%>
</head>
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
				<% if(this.listaCategorias!=null && this.listaCategorias.size()>0){
					for(Categoria cat:this.listaCategorias){
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
				<!-- <li><a class="drop" href="#">Reformas</a>
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
						<li><a href="#">Muebles</a></li>
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
				-->
				<li><a href="./ControladorPresupuesto" class="btn" style="padding: .8em">Calcula
						presupuesto</a></li>
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
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper bgded overlay"
		style="background: #44494C; background-image: url('./assets/custom/img/living-room.jpg'); background-size: 100% 100%;"
		id="img-bgbed">
		<div id="pageintro" class="hoc clear">
			<!-- ################################################################################################ -->
			<article class="introtxt">
			<h2 class="heading">Calcula tu presupuesto online</h2>
			<p>Calcula presupuestos ilimitados.</p>
			<footer>
			<ul class="nospace inline pushright">
				<li><a class="btn" href="./ControladorPresupuesto">Calcula Presupuesto</a></li>
				<li><a class="btn inverse" id="soyCliente" href="#">Administrar</a></li>
			</ul>
			</footer> </article>
			<button class="w3-button w3-display-left"
				onclick="changeBackground(-1)">&#10094;</button>
			<button class="w3-button w3-display-right"
				onclick="changeBackground(1)">&#10095;</button>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row3">
		<main class="hoc container clear"> <!-- main body --> <!-- ################################################################################################ -->
		<div class="center btmspace-50">
			<h2 class="heading font-x3">El Martillo</h2>
			<p>es una empresa que proporciona gran variedad de servicios
				relacionados con el mantenimineto,instalacaiones,reformas y
				rehabilitaciones de todo tipo de locales y viviendas.</p>
		</div>
		<div class="group center">
			<article class="one_quarter first"> <i
				class="icon fa fa-wrench"></i>
			<h4 class="font-x1 uppercase">
				<a href="#">Reformas</a>
			</h4>
			<p>de todo tipo de viviendas, baños, oficinas y locales
				comerciales.</p>
			</article>
			<article class="one_quarter"> <i class="icon fa fa-cogs"></i>
			<h4 class="font-x1 uppercase">
				<a href="#">Instalaciones</a>
			</h4>
			<p>de electrodomesticos, cocinas , aires acondicionados, sistemas
				eléctricos y mas.</p>
			</article>
			<article class="one_quarter"> <i
				class="icon fa fa-paint-brush"></i>
			<h4 class="font-x1 uppercase">
				<a href="#">Obras Menores</a>
			</h4>
			<p>Parquetistas, pintores, fontaneros, carpinteros, albañiles.</p>
			</article>
			<article class="one_quarter"> <i class="icon fa fa-truck"></i>
			<h4 class="font-x1 uppercase">
				<a href="#">Otros servicios</a>
			</h4>
			<p>Servicios completos o por separado de tranposrtar materiales,desescombrar,
				montaje de muebles o cualquier utilidad del interior.</p>
			</article>
		</div>
		<!-- ################################################################################################ -->
		<!-- / main body -->
		<div class="clear"></div>
		</main>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper">
		<div class="split clear light"
			style="background-image: url('images/demo/backgrounds/02.png');">
			<section style="width:100%;height:100%" class="box center">
			<!-- ################################################################################################ -->
			<div class="center btmspace-50">
				<h2 class="heading font-x3">Últimos proyectos</h2>
			</div>
			<figure id="logos">
			<ul class="nospace group">
				<li style="width: 30%; height: 30%;"><img
					src="./assets/custom/img/project1.jpg" alt=""></li>
				<li style="width: 30%; height: 30%;"><img
					src="./assets/custom/img/project2.jpg" alt=""></li>
				<li style="width: 30%; height: 30%;"><img
					src="./assets/custom/img/bootstrap-templates-office1.png" alt=""></li>
				<li style="width: 50%; height: 50%;"><img
					src="assets/custom/img/bootstrap-templates-office4.png" alt=""></li>
			</ul>
			<figcaption class="hidden"> <a href="#">More &raquo;</a>
			</figcaption> </figure> <!-- ################################################################################################ -->
			</section>
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->

	<div class="wrapper row3">
		<div class="hoc container clear">
			<!-- ################################################################################################ -->
			<div class="group">
				<section class="one_half first">
				<h6 class="heading font-x2 btmspace-50">¿Porque elegir a
					nosotros?</h6>
				<ul class="nospace">
					<li class="btmspace-30"><article> -Nuestra empresa
						cuida a sus clientes y sus pertenecias inmobiliarias tal como las
						mobiliarias. </article></li>
					<li class="btmspace-30"><article> Usted puede contar
						con nuestra empresa para todo relacionado con las reformas y el
						mantenimiento de su local,vivienda o edificio sin ninguna
						preocupacion.Disponemos de muchos profesionales experenciados en
						reformas de baños, hoteles, cocinas, oficinas, fachadas, locales
						comerciales, viviendas y mucho mas. Relizamos varios tipos de
						instalaciones como las de electrodomesticos y cocinas,montajes de
						muebles etc. </article></li>
					<li><article> Disponemos de un servicio de atención
						al cliente.Durante todo el proceso del trabajo en la obra Y A
						POSTERIORI.</article></li>
					<li style="margin-top: 2em; margin-bottom: 2em;"><article>
						Esta una de las primeras plataformas que proporciona herramientas
						como:
						<ul>
							<li>Seguimiento orientativo del progreso del trabajo en
								estadistica cada dia.</li>
							<li>Facturacion automática.</li>
							<li>Proceso de pago automatizado.</li>
							<li>Generación autmática de fechas aproximadas de la
								realización del trabajo.</li>
						</ul>
						</article></li>
					<li><article> Esta plataforma web esta especialmente
						diseñada para nuestros clientes.Y con ella intentamos a facilitar
						lo máximo posible el proceso de
						contratación,facturación,segumiento del trabajo realizado por
						nosotros y la plaificación del plazo en que el trabajo se va
						realizar.</article></li>
				</ul>
				</section>
				<section class="one_half">
				<h6 class="heading font-x3 btmspace-50">Escríbenos</h6>
				<p>Se puede poner en contacto con nosotros para cualquier duda
					que tiene.Un agente le contestara lo antes posible.</p>
				<div id="error_messages">
				
				</div>
				<form id="newsletter" action="./ControladorComentario" method="post">
					<fieldset>	
						<legend>Contacto</legend>
						Nombre: 
						<input class="btmspace-15" type="text" name="name" id="name"
							placeholder="Nombre" /> 
						Correo electrónico: <input
							class="btmspace-15" type="email" name="email" id="val" placeholder="Email" />
						Comentario:
						<textarea class="btmspace-15" name="content" id="content" style="width: 100%; height: 7em;" placeholder="Su comentario..."></textarea>
										<div id="mensajes_servidor">
					
				</div>
						<button type="submit" value="submit">Enviar</button>
					</fieldset>
				</form>
				</section>
			</div>
			<!-- ################################################################################################ -->
			<div class="clear"></div>
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->

	<div class="wrapper row5">
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
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<!-- IE9 Placeholder Support -->
	<script src="layout/scripts/jquery.placeholder.min.js"></script>
	<!-- / IE9 Placeholder Support -->
	
	<!-- Magnific PopUp -->
	<script src="./assets/MagnificPopUp/jquery.magnific-popup.min.js"></script>
	
	<script type="text/javascript">
	//
	$(document).ready(function() {

	        
		$('#soyCliente').magnificPopup({
			  items: {
			      src:'./Modals/login.jsp',
			      type: 'iframe'
			  }
			});
		$('#newsletter').on('submit',function(e){
			e.preventDefault();
			if($('#content').val()!="" && $('#email').val()!=""){
				$.ajax({
					url : $(this).attr('action'),
		            type: "POST",
		            data: $(this).serialize(),
		            success: function (data, textStatus, request) {
		            	console.log("Tipo de data recibido:_"+request.getResponseHeader("content-type"));
		            	if(request.getResponseHeader("content-type")=="text/plain;charset=charset=UTF-8"){
			            	console.log('Mensaje recibido del servidor:_"'+data+'"');
			            	$('#mensajes_servidor').empty();
			            	$('#mensajes_servidor').append("<p style='text-align:center;color:red;'>"+data+"<p>");	
		            	}
		            },
		            error: function (xhr, status, error) {
		            	console.log(xhr.responseText);
		            	$('#mensajes_servidor').append("Error al enviar la peticion al servidor.Compruebe su coneccion!");
		            }
					})
			}
			});
	    });
		var currentSlide = 0;
		var images = new Array();
		images[0] = "./assets/custom/img/living-room.jpg";
		images[1] = "./assets/custom/img/living-room2.jpg";
		function changeBackground() {
			if (arguments[0] == 1) {
				if ((currentSlide + 1) > images.length - 1) {
					currentSlide = 0;
				} else {
					currentSlide++;
				}
			} else if (arguments[0] == -1) {
				if ((currentSlide - 1) < 0) {
					currentSlide = images.length - 1;
				} else {
					currentSlide--;
				}
			}
			$('#img-bgbed').css({
				"background-image" : "url('" + images[currentSlide] + "')",
				"background-size" : "100% 100%",
				"repeat" : "no-repeat"
			});
		}
	</script>
</body>
</html>