package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		if(request.getParameter("email")!=null && request.getParameter("pass")!=null){
			Usuario usu=new Usuario();
			usu.setEmail(request.getParameter("email"));
			usu.setPass(request.getParameter("pass"));
			UsuarioService uService=new UsuarioService();
			Usuario usuDevuelto=uService.login(usu);
			if(usuDevuelto!=null){
				//Redireccionamos pasando JavaScript que se ejecuta directamente en al pagina y guardamos el usuario en sesion.Mando JavaScript para poder preservar el popup del login.JSP no proporciona modals.
				response.getOutputStream().println("<script type='text/javascript'>window.parent.location.href='./index.html';console.log('Redireccionando');</script>'");
			}
			else{
				//Avisamos el usuario que algo esta mal y no le dejamos entrar.
			}
		}else{
			System.out.println("Los datos estan en null.");
		}
	}

}
