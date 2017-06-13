package servlets;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelos.Precio;
import modelos.ServicioCalculado;
import services.CategoriaService;
import services.RelacionesService;
import services.ServicioService;
import services.SubCategoriaService;

/**
 * Servlet implementation class ControladorAlta
 */
@WebServlet("/ControladorAlta")
public class ControladorAlta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorAlta() {
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
		System.out.println("Recibiendo post en ControladorAlta!");
		Map<String, String> messages = new HashMap<String, String>();
		if(request.getParameter("nombre_categoria")!=null){
			int categoriaID=new CategoriaService().grabaCategoria(request.getParameter("nombre_categoria"));
			if(categoriaID>0){
				messages.put("categoria", "La categoria se ha grabado!");
			}else{
				messages.put("categoria", "Ha ocurrido un error!");
			}
			request.setAttribute("messages", messages);
			RequestDispatcher rd=request.getRequestDispatcher("./panel/AltaCategoria.jsp");
			rd.forward(request, response);
		}
		if(request.getParameter("subCategoria")!=null && request.getParameter("nombre_sub_categoria")!=null){
			int subCategoriaID=new SubCategoriaService().grabaSubCategoria(request.getParameter("nombre_sub_categoria"),request.getParameter("subCategoria"));
			if(subCategoriaID>0){
				messages.put("subCategoria", "La Subcategoria se ha grabado!");
			}else{
				messages.put("subCategoria", "Ha ocurrido un error!");
			}
			request.setAttribute("messages", messages);
			RequestDispatcher rd=request.getRequestDispatcher("./panel/AltaCategoria.jsp");
			rd.forward(request, response);
		}
		if(request.getParameter("relacion_subCategoria")!=null && request.getParameter("relacion_servicio")!=null){
			int relacionID=new RelacionesService().grabaRelacion(request.getParameter("relacion_subCategoria"), request.getParameter("relacion_servicio"));
			if(relacionID>0){
				messages.put("relacion", "La Relacion se ha grabado!");
			}else{
				messages.put("relacion", "Ha ocurrido un error!");
			}
			request.setAttribute("messages", messages);
			RequestDispatcher rd=request.getRequestDispatcher("./panel/ServiciosRelaciones.jsp");
			rd.forward(request, response);
		}
		if(request.getParameter("alta_servicio_nombre")!=null && request.getParameter("alta_servicio_medida")!=null && request.getParameter("alta_servicio_precio")!=null){
			int servicioID=0;
			try{
				servicioID=new ServicioService().altaServicios(request.getParameter("alta_servicio_nombre"), request.getParameter("alta_servicio_medida"), Double.parseDouble(request.getParameter("alta_servicio_precio")));
			}catch (Exception e) {
				if(servicioID>0){
					messages.put("servicio", "EL servicio se ha grabado!");
				}else{
					messages.put("servicio", "Ha ocurrido un error!");
				}
				request.setAttribute("messages", messages);
				RequestDispatcher rd=request.getRequestDispatcher("./panel/ServiciosRelaciones.jsp");
				rd.forward(request, response);
			}
			request.setAttribute("messages", messages);
			RequestDispatcher rd=request.getRequestDispatcher("./panel/ServiciosRelaciones.jsp");
			rd.forward(request, response);
		}
	}

}
