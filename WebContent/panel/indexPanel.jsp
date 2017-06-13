<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="modelos.*,services.*,java.util.ArrayList,java.util.List"%>
<!DOCTYPE html>
<html lang="es">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/panel/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/panel/css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="${pageContext.request.contextPath}/panel/css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/panel/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%! Usuario usu=new Usuario();
    
    List<Comentario> listaComentarios = new ArrayList<Comentario>();
    List<Contacto> listaContactos = new ArrayList<Contacto>();

	public void jspInit() {
		listaComentarios = new ComentarioGeneralService().getComentarios();
		listaContactos=new ContactoService().getContactos();
	}
    %>
<%
if(request.getSession().getAttribute("usuario")!=null){
	this.usu=(Usuario)request.getSession().getAttribute("usuario");
	jspInit();
	%>
			<title>El martillo de <% out.println(usu.getEmail());%></title>
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">El Martillo</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i> <% out.println(usu.getEmail());%> <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-fw fa-user"></i> Información</a>
						</li>
						<li><a href="#"><i class="fa fa-fw fa-gear"></i> Configuración</a>
						</li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/LogOut"><i class="fa fa-fw fa-power-off"></i> Cerrar sesión</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li class="active"><a href="${pageContext.request.contextPath}/panel/indexPanel.jsp"><i
							class="fa fa-fw fa-dashboard"></i> Indice</a></li>
							<% if(this.usu!=null && usu.getDerechos().equals("admin")){
								%><li><a href="${pageContext.request.contextPath}/panel/AltaCategoria.jsp"><i
							class="fa fa-fw fa-bar-chart-o"></i> Categorias/SubCategorias</a></li>
							<li><a href="${pageContext.request.contextPath}/panel/ServiciosRelaciones.jsp"><i
							class="fa fa-fw fa-bar-chart-o"></i> Servicios/Relaciones</a></li>
							<% }%>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							El martillo
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> Pagina de inicio de <%out.print(usu.getEmail());%>
							</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="row">
			<div class="col-lg-6">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Email</th>
										<th>Telefono</th>
										<th>Direccion</th>
										<th>Descripcion</th>
									</tr>
								</thead>
								<tbody>
									<%if(this.listaContactos.size()>0){
                                    	for(Contacto contacto:listaContactos){
                                    		%><tr>
											<td>
												<%out.print(contacto.getPersonaContacto()); %>
											</td>
											<td>
												<%out.print(contacto.getEmail()); %>
											</td>
											<td>
												<%out.print(contacto.getTelefono()); %>
											</td>
											<td>
												<%out.print(contacto.getDireccion()); %>
											</td>
											<td>
												<%out.print(contacto.getDescripcion()); %>
											</td>
									</tr>
									<% 
                                    	}
                                    } %>
								</tbody>
							</table>
						</div>
					</div>
				<div class="col-lg-6">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Email</th>
										<th>Contenido</th>
									</tr>
								</thead>
								<tbody>
									<%if(this.listaComentarios.size()>0){
                                    	for(Comentario comentario:listaComentarios){
                                    		%><tr>
											<td>
												<%out.print(comentario.getName()); %>
											</td>
											<td>
												<%out.print(comentario.getEmail()); %>
											</td>
											<td>
												<%out.print(comentario.getContent()); %>
											</td>
											<td><form action="${pageContext.request.contextPath}/ControladorBaja" method="post"> <input type="text" name="borraComentaro" class="hidden" value="<%out.print(comentario.getId());%>"/><input type="submit" class="btn btn-danger"
												value="Borrar"></form></td>
									</tr>
									<% 
                                    	}
                                    } %>
								</tbody>
							</table>
						</div>
					</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>

</body>
</html>
		
	<%
}else{
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}
%>
