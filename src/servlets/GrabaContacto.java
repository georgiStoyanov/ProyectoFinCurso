package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.ContactoService;

/**
 * Servlet implementation class GrabaContacto
 */
@WebServlet("/GrabaContacto")
public class GrabaContacto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GrabaContacto() {
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
		if(request.getParameter("NombreContacto")!=null && request.getParameter("emailContacto") != null && request.getParameter("direccionObra") != null && request.getParameter("telefono")  != null && request.getParameter("descripcion") != null){
			new ContactoService().grabaContacto(request.getParameter("NombreContacto"), request.getParameter("emailContacto"), request.getParameter("direccionObra"), request.getParameter("telefono"), request.getParameter("descripcion"));
			response.sendRedirect("./index.jsp");
		}else{
			response.sendRedirect("./index.jsp");
		}
	}

}
