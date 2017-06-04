package servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelos.Comentario;
import services.ComentarioGeneralService;
import services.Conectar;

/**
 * Servlet implementation class ControladorIndex
 */
@WebServlet("/ControladorComentario")
public class ControladorComentario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorComentario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Comentario comentario=new Comentario();
		comentario.setContent(request.getParameter("content"));
		comentario.setEmail(request.getParameter("email"));
		comentario.setName(request.getParameter("name"));
		
		//Validacion hecha en el servidor de los campos obligatorios.Antes de abrir la coneccion.
		if(comentario.getContent()!=null && comentario.getEmail()!=null){
			ComentarioGeneralService comentService=new ComentarioGeneralService();
			int ifGrabado=comentService.grabarComentario(comentario);
			if(ifGrabado>0){
				System.out.println("Grabado comentario con id:_"+ifGrabado);
				//Avisar al cliente que se ha grabado.Usar Hashmap para pasar los mensajes y asignar el valor de mesanjes en un span o lo que sea 
			}else{
				//Avisar cliente que no se ha grabado.
			}
		}else{
			System.out.println("Una peticion de grabar usuario ha llegado al servidor con datos obligatorios vacios!");
		}
	}
}
