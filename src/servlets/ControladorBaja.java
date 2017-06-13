package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelos.Precio;
import modelos.ServicioCalculado;
import services.CategoriaService;
import services.ComentarioGeneralService;
import services.PreciosService;
import services.RelacionesService;
import services.ServicioService;
import services.SubCategoriaService;

/**
 * Servlet implementation class ControladorBaja
 */
@WebServlet("/ControladorBaja")
public class ControladorBaja extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorBaja() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("bajaCategoria")!=null){
			new CategoriaService().bajaCategoria(request.getParameter("bajaCategoria"));
			RequestDispatcher rd=request.getRequestDispatcher("./panel/AltaCategoria.jsp");
			rd.forward(request, response);
		}
		if(request.getParameter("bajaSubCategoria")!=null){
			new SubCategoriaService().bajaSubCategoria(request.getParameter("bajaSubCategoria"));
			RequestDispatcher rd=request.getRequestDispatcher("./panel/AltaCategoria.jsp");
			rd.forward(request, response);
		}
		if(request.getParameter("bajaRelacion")!=null){
			new RelacionesService().bajaRelacion(request.getParameter("bajaRelacion"));
			RequestDispatcher rd=request.getRequestDispatcher("./panel/ServiciosRelaciones.jsp");
			rd.forward(request, response);
		}
		if(request.getParameter("bajaServicio")!=null){
			new ServicioService().borrarServicio(request.getParameter("bajaServicio"));
			RequestDispatcher rd=request.getRequestDispatcher("./panel/ServiciosRelaciones.jsp");
			rd.forward(request, response);
		}
		if(request.getParameter("borraComentaro")!=null){
			new ComentarioGeneralService().borraComentario(request.getParameter("borraComentaro"));
			RequestDispatcher rd=request.getRequestDispatcher("./panel/indexPanel.jsp");
			rd.forward(request, response);
		}
	}
}
