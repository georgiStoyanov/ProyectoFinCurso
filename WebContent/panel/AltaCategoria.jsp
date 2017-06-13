<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"
	import="modelos.*,services.*,java.util.ArrayList,java.util.List"%>
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
<%!List<Categoria> listaCategorias = new ArrayList<Categoria>();
	List<SubCategoria> listaSubCategorias = new ArrayList<SubCategoria>();
	List<Servicio> listaServicios = new ArrayList<Servicio>();

	public void jspInit() {
		listaCategorias = new CategoriaService().getCategorias();
		listaServicios = new ServicioService().getAllServicios();
		listaSubCategorias = new SubCategoriaService().getSubCategorias();
	}%>
<%
jspInit();
Usuario usu=new Usuario();
	if(request.getSession().getAttribute("usuario")!=null){
		usu=(Usuario)request.getSession().getAttribute("usuario");
		%>
			<title>El martillo de <% out.println(usu.getEmail());%></title>
<style>
.row {
	margin-top: .5em;
	margin-bottom: .5em;
}
</style>
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
					data-toggle="dropdown"><i class="fa fa-user"></i> <% out.print(usu.getEmail());%>
						<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-fw fa-user"></i>
								Información</a></li>
						<li><a href="#"><i class="fa fa-fw fa-gear"></i>
								Configuración</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/LogOut"><i class="fa fa-fw fa-power-off"></i>
								Cerrar sesión</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li><a href="${pageContext.request.contextPath}/panel/indexPanel.jsp"><i
							class="fa fa-fw fa-dashboard"></i> Indice</a></li>
					<% if(usu!=null){
								if(usu.getDerechos().equals("admin")){
								%><li class="active"><a href="${pageContext.request.contextPath}/panel/AltaCategoria.jsp"><i
							class="fa fa-fw fa-bar-chart-o"></i>Categorias/SubCategorias</a></li>
					<li><a href="${pageContext.request.contextPath}/panel/ServiciosRelaciones.jsp"><i
							class="fa fa-fw fa-bar-chart-o"></i>Servicios/Relaciones</a></li>
					<% }}%>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-6">
						<h1 class="page-header">Alta Categoria</h1>
					</div>
					<div class="col-lg-6">
						<h1 class="page-header">Categorias existentes</h1>
					</div>
				</div>
				<!-- /.row -->


				<div class="row">
					<div class="col-lg-6">
						<div class="form-gorup">
							<form action="${pageContext.request.contextPath}/ControladorAlta" method="post" id="alta_categoria_form">
								<div class="row">
									<div class="col-lg-6">
										<label>Categoria nombre:</label> <input style="width: 100%;"
											class="form-control" type="text" name="nombre_categoria" />
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<input style="width: 100%;" class="btn" type="submit"
											value="Crear" />
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<p style="color:red">${messages.categoria}</p>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nombre</th>
										<th>Operación</th>
									</tr>
								</thead>
								<tbody>
									<%if(this.listaCategorias.size()>0){
                                    	for(Categoria categoria:listaCategorias){
                                    		%><tr>
											<td>
												<%out.print(categoria.getId_categoria()); %>
											</td>
											<td>
												<%out.print(categoria.getNombre_categoria()); %>
											</td>
											<td><form action="${pageContext.request.contextPath}/ControladorBaja" method="post"> <input type="text" name="bajaCategoria" class="hidden" value="<%out.print(categoria.getId_categoria());%>"/><input type="submit" class="btn btn-danger"
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


				<div class="row">
					<div class="col-lg-6">
						<h1 class="page-header">Alta SubCategoria</h1>
					</div>
					<div class="col-lg-6">
						<h1 class="page-header">SubCategorias existentes</h1>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<div class="form-gorup">
							<form id="alta_categoria_form" action="${pageContext.request.contextPath}/ControladorAlta" method="post">
								<div class="col-lg-6 col-md-6">
									<label>Para la categoria:</label> <select name="subCategoria"
										id="categoria_select" class="form-control">
										<option selected disabled>Seleccione una categoría</option>
										<%
							if (this.listaCategorias!=null) {
									for(Categoria cat:listaCategorias){
													%>
														<option
												value="<%out.print(cat.getNombre_categoria());%>">
												<%out.println(cat.getNombre_categoria());%>
											</option>
													<%
										}												
								}else{%>
										<option selected disabled>Error de servidor!</option>
										<% 
							}
							%>
									</select>
								</div>
								<div class="col-lg-6 col-md-6">
									<label>SubCategoria nombre:</label> <input class="form-control"
										type="text" style="width: 100%;" name="nombre_sub_categoria" />
								</div>
								<div style="margin-top: .5em; margin-bottom: .5em;"
									class="col-lg-6 col-md-6">
									<input style="width: 100%;" class="btn" type="submit"
										value="Crear" />
								</div>
									<div class="col-lg-12">
										<p style="color:red">${messages.subCategoria}</p>
									</div>
							</form>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nombre</th>
										<th>Categoria</th>
										<th>Operación</th>
									</tr>
								</thead>
								<tbody>
									<%if(this.listaSubCategorias.size()>0){
                                    	for(SubCategoria subCat:listaSubCategorias){
                                    		%><tr>
											<td>
												<%out.print(subCat.getId_sub_categoria()); %>
											</td>
											<td>
												<%out.print(subCat.getNombre_sub_categoria()); %>
											</td>
											<td>
												<%out.print(subCat.getCategoria());%>
											</td>
											<td><form action="${pageContext.request.contextPath}/ControladorBaja" method="post"><input type="text" name="bajaSubCategoria" value="<%out.print(subCat.getId_sub_categoria());%>" class="hidden"/><input type="submit" class="btn btn-danger"
												value="Borrar"></form></td>
										</form>
									</tr>
									<% 
                                    	}
                                    } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- /.row -->
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
		response.sendRedirect("../index.jsp");
	}%>
