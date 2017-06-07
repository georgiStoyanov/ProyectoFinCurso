package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelos.Usuario;
import services.UsuarioService;

/**
 * Servlet implementation class ControladorUsuario
 */
@WebServlet("/ControladorUsuario")
public class ControladorUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorUsuario() {
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
		System.out.println("Email:_"+request.getParameter("email"));
		if(request.getParameter("email")!=null && request.getParameter("pass")!=null && request.getParameter("pass")!="" && request.getParameter("email")!=""){
			Usuario usu=new Usuario();
			usu.setEmail(request.getParameter("email"));
			usu.setPass(request.getParameter("pass"));
			UsuarioService uService=new UsuarioService();
			Usuario usuDevuelto=uService.login(usu);
			if(usuDevuelto!=null){
				//Redireccionamos pasando JavaScript que se ejecuta directamente en al pagina y guardamos el usuario en sesion.Mando JavaScript para poder preservar el popup del login.JSP no proporciona modals.
				HttpSession session = request.getSession(true);
				session.setAttribute("usuario", usu);
				String redireccionarString="../panel/indexPanel.jsp";
				response.setContentType("text/javascript");
				response.getOutputStream().println("window.parent.location.href='"+redireccionarString+"';");
			}
			else{
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().println("Usuario o contraseña incorrectos!");
				//Avisamos el usuario que algo esta mal(hecho en js para evitar refrescar la pagina al enviar el formu) y no le dejamos entrar.
			}
		}else{
			System.out.println("Revise los datos.");
			response.getWriter().println("Todos los campos son obligatorios!");
		}
	}

}
