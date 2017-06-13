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
<link
	href="${pageContext.request.contextPath}/panel/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/panel/css/sb-admin.css"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link
	href="${pageContext.request.contextPath}/panel/css/plugins/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/panel/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<%!List<Categoria> listaCategorias = new ArrayList<Categoria>();
	List<SubCategoria> listaSubCategorias = new ArrayList<SubCategoria>();
	List<Servicio> listaServicios = new ArrayList<Servicio>();
	List<RelacionSubCatServ> listaRelaciones = new ArrayList<RelacionSubCatServ>();
	List<Precio> listaPrecios = new ArrayList<Precio>();

	public void jspInit() {
		listaPrecios=new PreciosService().getPrecios();
		listaCategorias = new CategoriaService().getCategorias();
		listaServicios = new ServicioService().getAllServicios();
		listaSubCategorias = new SubCategoriaService().getSubCategorias();
		listaRelaciones = new RelacionesService().getRelaciones();
	}%>
<%
	Usuario usu = new Usuario();
	if (request.getSession().getAttribute("usuario") != null) {
		jspInit();
		usu = (Usuario) request.getSession().getAttribute("usuario");
%>
<title>El martillo de <%
	out.println(usu.getEmail());
%></title>
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
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/index.jsp">El Martillo</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i> <%
 	out.println(usu.getEmail());
 %> <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-fw fa-user"></i>
								Información</a></li>
						<li><a href="#"><i class="fa fa-fw fa-gear"></i>
								Configuración</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/LogOut"><i
								class="fa fa-fw fa-power-off"></i> Cerrar sesión</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li><a
						href="${pageContext.request.contextPath}/panel/indexPanel.jsp"><i
							class="fa fa-fw fa-dashboard"></i> Indice</a></li>
					<%
						if (usu != null) {
								if (usu.getDerechos().equals("admin")) {
					%><li><a
						href="${pageContext.request.contextPath}/panel/AltaCategoria.jsp"><i
							class="fa fa-fw fa-bar-chart-o"></i>Categorias/SubCategorias</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/panel/ServiciosRelaciones.jsp"><i
							class="fa fa-fw fa-bar-chart-o"></i>Servicios/Relaciones</a></li>
					<%
						}
							}
					%>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6">
						<h1 class="page-header">Alta Servicio</h1>
					</div>
					<div class="col-lg-6">
						<h1 class="page-header">Servicios Existentes</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-6">
						<div class="form-gorup">
							<form action="${pageContext.request.contextPath}/ControladorAlta" method="post">
								<div class="col-lg-6 col-md-6">
									<label>Servicio nombre:</label> <input class="form-control"
										type="text" style="width: 100%;" name="alta_servicio_nombre" required/>
								</div>
								<div class="col-lg-6 col-md-6">
									<label>Medida a cobrar:</label> <input class="form-control"
										type="text" style="width: 100%;" name="alta_servicio_medida" required />
								</div>
								<div class="col-lg-6 col-md-6">
									<label>Precio por medida:</label> <input class="form-control"
										type="number" min='0' step="0.1" style="width: 100%;"
										name="alta_servicio_precio" required/>
								</div>
								<div style="margin-top: .5em; margin-bottom: .5em;"
									class="col-lg-6 col-md-6">
									<input style="width: 100%;" class="btn" type="submit"
										value="Crear" />
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
										<th>Medida</th>
										<th>Precio</th>
										<th>Operación</th>
									</tr>
								</thead>
								<tbody>
									<%
										if (this.listaServicios != null) {
												for (Servicio servicio : listaServicios) {
									%><tr>
											<td>
												<%
													out.print(servicio.getId());
												%>
											</td>
											<td>
												<%
													out.print(servicio.getNombre());
												%>
											</td>
											<td>
												<%
													out.print(servicio.getMedida());
												%>
											</td>
											<td>
												<%
													if(listaPrecios!=null){
														for(Precio precio:listaPrecios){
															if(precio.getServicio_id()==servicio.getId()){
																out.print(precio.getPrecio_servicio());
															}
														}
													}
												%>
											</td>
											<td><form action="${pageContext.request.contextPath}/ControladorBaja"><input type="text" class="hidden" name="bajaServicio" value="<%out.print(servicio.getId());%>"><input type="submit" class="btn btn-danger" value="Borrar"></form></td>
									</tr>
									<%
										}
											}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<h1 class="page-header">Relacionar servicios</h1>
					</div>
					<div class="col-lg-6">
						<h1 class="page-header">Relaciones existentes</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 ">
									<form action="${pageContext.request.contextPath}/ControladorAlta" method="post">
						<h4 style="color: red;">Atencion:</h4>
						<h6>Si duplica alguna relacion van a salir dos campos iguales
							en la parte del presupuesto.Si esto ocurre asegurese de borrar la
							relacion.</h6>
						<div class="col-lg-6">
							<label>Para la sub categoria:</label> <select
								name="relacion_subCategoria" id="categoria_select"
								class="form-control">
								<option selected disabled>Seleccione una categoría</option>
								<%
									if (this.listaSubCategorias != null && this.listaCategorias != null) {
											for (Categoria cat : listaCategorias) {
								%>
								<optgroup label="<%out.print(cat.getNombre_categoria());%>">
									<%
										for (SubCategoria servicio : listaSubCategorias) {
														if (servicio.getCategoria().equals(cat.getNombre_categoria())) {
									%>
									<option value="<%out.print(servicio.getId_sub_categoria());%>">
										<%
											out.println(servicio.getNombre_sub_categoria());
										%>
									</option>
									<%
										}
													}
												}
									%>
								</optgroup>
								<%
									} else {
								%>
								<option selected disabled>Error de servidor!</option>
								<%
									}
								%>
							</select>
						</div>
						<div class="col-lg-6">
							<label>Servicio:</label> <select name="relacion_servicio" class="form-control">
								<option selected disabled>Seleccione un servicio</option>
								<%
									if (this.listaServicios != null) {
											for (Servicio servicio : listaServicios) {
								%>
								<option value="<%out.print(servicio.getId());%>">
									<%
											out.println(servicio.getNombre());
										%>
								</option>
								<%
										}
													}
												
									 else {
								%>
								<option selected disabled>Error de servidor!</option>
								<%
									}
								%>
							</select>
						</div>
						<div class="col-lg-12">${messages.relacion}</div>
						<div style="margin-top: .5em; margin-bottom: .5em;"
									class="col-lg-6 col-md-6">
									<input style="width: 100%;" class="btn" type="submit"
										value="Crear" />
								</div>
							</form>
					</div>
					<div class="col-lg-6">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>SubCategoria</th>
										<th>Servicio</th>
									</tr>
								</thead>
								<tbody>
									<%
										if (this.listaRelaciones != null) {
												for (RelacionSubCatServ relacion : listaRelaciones) {
									%><tr>
										<td>
											<%
												out.print(relacion.getId_relacion());
											%>
										</td>
										<td>
											<%
												out.print(relacion.getNombre_subCategoria());
											%>
										</td>
										<td>
											<%
												out.print(relacion.getNombre_servicio());
											%>
										</td>
										<td><form
												action="${pageContext.request.contextPath}/ControladorBaja">
												<input type="text" name="bajaRelacion"
													value="<%out.print(relacion.getId_relacion());%>"
													class="hidden" /><input type="submit"
													class="btn btn-danger" value="Borrar">
											</form></td>
									</tr>
									<%
										}
											}
									%>
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
	} else {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
%>