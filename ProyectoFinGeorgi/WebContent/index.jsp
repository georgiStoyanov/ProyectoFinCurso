<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>El Martillo</title>

<!-- Bootstrap core CSS -->
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="themes/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets/custom/css/flexslider.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="assets/custom/css/parallax-slider.css"
	type="text/css">
<link rel="stylesheet"
	href="assets/font-awesome-4.0.3/css/font-awesome.min.css"
	type="text/css">

<!-- Custom styles for this template -->

<link href="assets/custom/css/business-plate.css" rel="stylesheet">
<link rel="shortcut icon" href="assets/custom/ico/favicon.ico">
<style>
.sidebar-nav {
	padding: 9px 0;
}

.dropdown-menu .sub-menu {
	left: 100%;
	position: absolute;
	top: 0;
	visibility: hidden;
	margin-top: -1px;
}

.dropdown-menu li:hover .sub-menu {
	visibility: visible;
}

.dropdown:hover .dropdown-menu {
	display: block;
}

.nav-tabs .dropdown-menu, .nav-pills .dropdown-menu, .navbar .dropdown-menu
	{
	margin-top: 0;
}

.navbar .sub-menu:before {
	border-bottom: 7px solid transparent;
	border-left: none;
	border-right: 7px solid rgba(0, 0, 0, 0.2);
	border-top: 7px solid transparent;
	left: -7px;
	top: 10px;
}

.navbar .sub-menu:after {
	border-top: 6px solid transparent;
	border-left: none;
	border-right: 6px solid #fff;
	border-bottom: 6px solid transparent;
	left: 10px;
	top: 11px;
	left: -6px;
}
</style>
</head>
<!-- NAVBAR
================================================== -->
<body>
	<div class="top">
		<div class="container">
			<div class="row-fluid">
				<ul class="phone-mail">
					<li><i class="fa fa-phone"></i><span>+34/ 642 296 450</span></li>
					<li><i class="fa fa-envelope"></i><span>dzhondzhov@hotmail.com</span></li>
				</ul>
				<ul class="loginbar">
					<li><a href="#" class="login-btn">Crear cuenta</a></li>
					<li class="devider">&nbsp;</li>
					<li><a href="#" class="login-btn">Iniciar Session</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- topHeaderSection -->
	<div class="topHeaderSection">
		<div class="header">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" style="width: 70%; height: 70%;"
						href="index.html"><img src="assets/custom/img/logo2.png"
						alt="El martillo logo" /></a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="#">Inicio</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Servicios <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Reformas</a></li>
								<li><a href="#">Instalaciones</a></li>
								<li><a href="#">Mantenimiento</a></li>
							</ul></li>
							<li><div><a class="btn btn-brand" href="#">Pedir presupuesto</a></div></li>
						<li><a href="#about">Quienes somos</a></li>
						<li><a href="#contact">Contacto</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<!-- bannerSection -->
	<div class="bannerSection">
		<div class="slider-inner">
			<div id="da-slider" class="da-slider">
				<div class="da-slide">
					<h2>
						<i>Pide</i> <br> <i>Presupuestos</i> <br> <i>ilimitados
							gratis</i>
					</h2>
					<p>
						<i>Precios competitivos</i> <br> <i>Trabajo limipio</i> <br>
						<i>Y de calidad</i>
					</p>
					<div class="da-img">
						<img src="assets/custom/img/construction-tools-alpha.png" alt="" />
					</div>
				</div>

				<div class="da-slide">
					<h2>
						<i>Reformas</i> <br> <i>de todo tipo</i>
					</h2>
					<p>
						<i>Profesionales experenciados</i> <br> <i>Uso de nuevas
							tecnologías</i> <br>
					</p>
					<div class="da-img">
						<img src="assets/custom/img/construction-tools2.png" alt="" />
					</div>
				</div>



				<div class="da-slide">
					<h2>
						<i>Obras menores</i> <br> <i>Instaladores</i> <br> <i>Mantenimiento</i>
					</h2>
					<p>
						<i>Pintores Parquetistas Instaladores Fontaneros Electricistas</i>
					</p>
					<div class="da-img">
						<img src="assets/custom/img/construction-worker.png" alt="" />
					</div>
				</div>
				<nav class="da-arrows"> <span class="da-arrows-prev"></span> <span
					class="da-arrows-next"></span> </nav>
			</div>
			<!--/da-slider-->
		</div>
		<!--/slider-->
		<!--=== End Slider ===-->


	</div>
	<!-- highlightSection -->
	<div class="highlightSection">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<h2>El Martillo</h2>
					<em> es una empresa que proporciona gran variedad de servicios
						relacionados con el mantenimineto,instalacaiones,reformas y
						rehabilitaciones de todo tipo de locales y viviendas.</em><br> <br>

				</div>
				<div class="col-md-4 align-right">
					<h4>Pede presupuestos orientativos ilimitados!
					<br></h4>
					<a class="btn btn btn-brand" href="#">Pedir presupuesto!</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- bodySection -->
	<div class="serviceBlock">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-compress"></i>
						<div class="desc">

							<h4>Fully Responsive</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-code"></i>
						<div class="desc">

							<h4>HTML5 + CSS3</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-thumbs-up"></i>
						<div class="desc">

							<h4>Launch Ready</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-desktop"></i>
						<div class="desc">

							<h4>Fully Responsive</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-html5"></i>
						<div class="desc">

							<h4>HTML5 + CSS3</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-css3"></i>
						<div class="desc">

							<h4>Launch Ready</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-github"></i>
						<div class="desc">

							<h4>Fully Responsive</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-android"></i>
						<div class="desc">

							<h4>HTML5 + CSS3</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="clearfix">
						<i class="fa fa-tablet"></i>
						<div class="desc">

							<h4>Launch Ready</h4>
							<p>Lorem ipsum dolor sit amet, Morem ipsum dolor sit amet
								consectetur adipisicing elit.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>


	<div class="bodySection" style="display: none">
		<div class="container">
			<div class="ourServices">
				<div class="row">
					<div class="col-md-3">
						<div class="cntr">
							<img src="assets/custom/img/Office.png" class="img-circle"
								title="project one">
							<h3>
								<a href="#">Responsive Design</a>
							</h3>
						</div>
						<p>
							At vero eos et accusamus et iusto odio dignissimos ducimus qui
							blanditiis praesentium voluptatum deleniti atque corrupti quos
							dolores et quas molestias excepturi sint occaecati cupiditate non
							provident <br> <br> <a href="#">more details</a>
						</p>
					</div>
					<div class="col-md-3">
						<div class="cntr">
							<img src="assets/custom/img/Office.png" class="img-circle"
								title="project one">
							<h3>
								<a href="#">CSS & HTML5</a>
							</h3>
						</div>
						<p>
							At vero eos et accusamus et iusto odio dignissimos ducimus qui
							blanditiis praesentium voluptatum deleniti atque corrupti quos
							dolores et quas molestias excepturi sint occaecati cupiditate non
							provident <br> <br> <a href="#">more details</a>
						</p>
					</div>
					<div class="col-md-3">
						<div class="cntr">
							<img src="assets/custom/img/Office.png" class="img-circle"
								title="project one">
							<h3>
								<a href="#">Clean</a>
							</h3>
						</div>
						<p>
							At vero eos et accusamus et iusto odio dignissimos ducimus qui
							blanditiis praesentium voluptatum deleniti atque corrupti quos
							dolores et quas molestias excepturi sint occaecati cupiditate non
							provident <br> <br> <a href="#">more details</a>
						</p>
					</div>
					<div class="col-md-3">
						<div class="cntr">
							<img src="assets/custom/img/Office.png" class="img-circle"
								title="project one">
							<h3>
								<a href="#">SEO Frendly</a>
							</h3>
						</div>
						<p>
							At vero eos et accusamus et iusto odio dignissimos ducimus qui
							blanditiis praesentium voluptatum deleniti atque corrupti quos
							dolores et quas molestias excepturi sint occaecati cupiditate non
							provident <br> <br> <a href="#">more details</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>




	<div class="services">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<img src="assets/custom/img/bootstrap-templates-office3.png"
						class="" title="project one">
					<h3>
						<a class="hover-effect" href="#">Huge Work</a>
					</h3>
					<p>Donec id elit non mi porta gravida at eget metus. Fusce
						dapibus, justo sit amet risus etiam porta sem.</p>
				</div>
				<div class="col-md-3">
					<img src="assets/custom/img/bootstrap-templates-office2.png"
						class="" title="project one">

					<h3>
						<a class="hover-effect" href="#">Huge Work</a>
					</h3>
					<p>Donec id elit non mi porta gravida at eget metus. Fusce
						dapibus, justo sit amet risus etiam porta sem.</p>
				</div>
				<div class="col-md-3">
					<img src="assets/custom/img/bootstrap-templates-office1.png"
						class="" title="project one">

					<h3>
						<a class="hover-effect" href="#">Huge Work</a>
					</h3>
					<p>Donec id elit non mi porta gravida at eget metus. Fusce
						dapibus, justo sit amet risus etiam porta sem.</p>
				</div>
				<div class="col-md-3">
					<img src="assets/custom/img/bootstrap-templates-office4.png"
						class="" title="project one">

					<h3>
						<a class="hover-effect" href="#">Huge Work</a>
					</h3>
					<p>Donec id elit non mi porta gravida at eget metus. Fusce
						dapibus, justo sit amet risus etiam porta sem.</p>
				</div>
			</div>
		</div>
	</div>

<!-- 
	<div class="testimonails">
		<div class="container">
			<blockquote class="">
				<p>At vero eos et accusamus et iusto odio dignissimos ducimus
					qui blanditiis praesentium voluptatum deleniti atque corrupti quos
					dolores et quas molestias excepturi sint occaecati cupiditate non
					provident,</p>
				<small>- Rob & Kelly</small>
			</blockquote>
		</div>
	</div>
 -->
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<h3 class="title">¿Porque elegir a nosotros?</h3>
				<p>Nuestra empresa cuida a sus clientes y sus pertenecias inmobiliarias tal como las mobiliarias.</p>
				<p>Usted puede contar con nuestra empresa para todo relacionado con
					las reformas y el mantenimiento de su local,vivienda o
					edificio sin ninguna preocupacion.Disponemos de muchos profesionales experenciados en
					reformas de baños, hoteles, cocinas, oficinas, fachadas, locales
					comerciales, viviendas y mucho mas. Relizamos varios tipos de
					instalaciones como las de electrodomesticos y cocinas,montajes de
					muebles etc.</p>
				<p>Disponemos de un servicio de atención al cliente.Durante todo el proceso del trabajo en la obra Y A POSTERIORI.</p>
				<p>Esta plataforma web esta especialmente diseñada para nuestros clientes.Y con ella intentamos a facilitar lo máximo posible el proceso de contratación,facturación,segumiento del trabajo realizado por nosotros y la plaificación del plazo en que el trabajo se va realizar.</p>
				<p>Esta una de las primeras plataformas que proporciona herramientas como:</p>
				<ul>
					<li>Seguimiento orientativo del progreso del trabajo en estadistica cada dia.</li>
					<li>Facturacion automática.</li>
					<li>Proceso de pago automatizado.</li>
					<li>Generación autmática de fechas aproximadas de la realización del trabajo.</li>
				</ul>
			</div>
			<div class="col-md-8">
				<div class="projectList">
					<h3 class="title">Latest Projects</h3>
					<div class="media">
						<a class="pull-left" href="#"> <img
							src="assets/custom/img/project1.jpg" class="projectImg"
							title="project one">
						</a>
						<div class="media-body">
							<h4 class="media-heading">
								<a href="#">Projects One</a>
							</h4>
							<p>On the other hand, we denounce with righteous indignation
								and dislike men who are so beguiled and demoralized by the
								charms of pleasure of the moment, so blinded by desire</p>
							<a class="pull-right" href="#">more details</a>
						</div>
					</div>

					<div class="media">
						<a class="pull-left" href="#"> <img
							src="assets/custom/img/project2.jpg" class="projectImg"
							title="project one">
						</a>
						<div class="media-body">
							<h4 class="media-heading">
								<a href="#">Projects Two</a>
							</h4>
							<p>On the other hand, we denounce with righteous indignation
								and dislike men who are so beguiled and demoralized by the
								charms of pleasure of the moment, so blinded by desire</p>
							<a class="pull-right" href="#">more details</a>
						</div>
					</div>
					<div class="media">
						<a class="pull-left" href="#"> <img
							src="assets/custom/img/project1.jpg" class="projectImg"
							title="project one">
						</a>
						<div class="media-body">
							<h4 class="media-heading">
								<a href="#">Projects One</a>
							</h4>
							<p>On the other hand, we denounce with righteous indignation
								and dislike men who are so beguiled and demoralized by the
								charms of pleasure of the moment, so blinded by desire</p>
							<a class="pull-right" href="#">more details</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- clientSection -->
	<div class="container">
		<h3 class="title">Our Clients</h3>
		<div class="clientSection">
			<div class="row">
				<div class="col-md-2">
					<a href="#"><img alt="" src="assets/custom/img/14.png"></a>
				</div>
				<div class="col-md-2">
					<a href="#"><img alt="" src="assets/custom/img/35.png"></a>
				</div>
				<div class="col-md-2">
					<a href="#"><img alt="" src="assets/custom/img/1.png"></a>
				</div>
				<div class="col-md-2">
					<a href="#"><img alt="" src="assets/custom/img/2.png"></a>
				</div>
				<div class="col-md-2">
					<a href="#"><img alt="" src="assets/custom/img/3.png"></a>
				</div>
				<div class="col-md-2">
					<a href="#"><img alt="" src="assets/custom/img/4.png"></a>
				</div>
			</div>
		</div>
	</div>



	<!-- footerTopSection -->
	<div class="footerTopSection">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h3>About</h3>
					<p>
						Best service provicer for<br> <strong>web and
							application </strong> design and development.
					</p>

					<h3>Monthly news letter</h3>
					<p>If you intended to get monthly newsletters and offers from
						us?</p>
					<div>
						<form class="form-inline" role="form">
							<div class="form-group">
								<label class="sr-only" for="exampleInputEmail2">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail2" placeholder="Enter email">
							</div>
							<button type="submit" class="btn btn-brand">Subscribe</button>
						</form>
					</div>

				</div>
				<div class="col-md-3">
					<h3>Recent NEWS</h3>
					<p>
						Best service provicer for<br> <strong>web and
							application </strong> design and development.
					</p>
					<p>
						Best service provicer for<br> <strong>web and
							application </strong> design and development.
					</p>
					<p>
						Best service provicer for<br> <strong>web and
							application </strong> design and development.
					</p>
				</div>
				<div class="col-md-3">
					<h3>Useful Links</h3>
					<p>
						<span>This may be the very useful and quick link for proper
							information</span><br> <br> <a href="#">Our Services</a><br>
						<a href="#">About us</a><br> <a href="#">Our Network</a><br>
						<a href="#">Our Products</a><br>
					</p>
					<h3>Friends</h3>
					<p>
						<a href="#">Yahoo.com</a><br> <a href="#">Canon</a>
					</p>

				</div>
				<div class="col-md-3">
					<h3>Contact us</h3>
					<p>
						<strong>Business plate Ltd.</strong><br> 480 Bridgewater
						Road, London, W1<br> United Kingdon<br> P : +44 (0)
						1234567890<br> E : info@businessplate.com<br> W :
						www.businessplate.com<br>
					</p>
					<h3>Stay Connected</h3>
					<p>We are available at all social networks</p>
					F , t, G, T, Ln, P, Y
				</div>
			</div>
		</div>
	</div>
	<!-- footerBottomSection -->
	<div class="footerBottomSection">
		<div class="container">
			&copy; 2017, Todos los derechos reservados. <a href="#">Términos y condiciones</a> |
			<a href="#">Condiciones de privacidad</a>
			<div class="pull-right">
				<a href="index.html"><img style="width:30%;height:30%;" src="assets/custom/img/logofooter.png"
					alt="My web solution" /></a>
			</div>
		</div>
	</div>

	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="assets/custom/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript"
		src="assets/custom/js/modernizr.custom.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- JS Implementing Plugins -->
	<script type="text/javascript"
		src="assets/custom/js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="assets/custom/js/modernizr.js"></script>
	<script type="text/javascript" src="assets/custom/js/jquery.cslider.js"></script>
	<script type="text/javascript" src="assets/custom/js/back-to-top.js"></script>
	<script type="text/javascript" src="assets/custom/js/jquery.sticky.js"></script>

	<!-- JS Page Level -->
	<script type="text/javascript" src="assets/custom/js/app.js"></script>
	<script type="text/javascript" src="assets/custom/js/index.js"></script>


	<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
        App.initSliders();
        Index.initParallaxSlider();
    });
</script>


</body>
</html>