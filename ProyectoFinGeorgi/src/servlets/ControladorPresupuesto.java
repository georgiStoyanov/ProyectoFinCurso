package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelos.Servicio;
import modelos.SubCategoria;
import services.CategoriaService;
import services.ServicioService;
import services.SubCategoriaService;

/**
 * Servlet implementation class ControladorPresupuesto
 */
@WebServlet("/ControladorPresupuesto")
public class ControladorPresupuesto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorPresupuesto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subCategoria=request.getParameter("subCategoria");
		if(subCategoria!=null){
			System.out.println("Sacando servicios por SubCategoria!");
			try {
				ServicioService serviciosService=new ServicioService();
				List<Servicio> listaServicios=serviciosService.getServiciosPorSubCat(Integer.parseInt(subCategoria));
				request.setAttribute("listaServicios", listaServicios);
			} catch (Exception e) {
				System.out.println("-------------------------------------------------------El parseado de integer fallo al intentar recoger servicios de la base de datos!--------------------------------------");
			}
		}
		request.setAttribute("listaSubCategorias", new SubCategoriaService().getSubCategorias());
		request.setAttribute("listaCategorias", new CategoriaService().getCategorias());
		RequestDispatcher rd=request.getRequestDispatcher("./presupuesto.jsp");
		rd.forward(request, response);
	}

}
