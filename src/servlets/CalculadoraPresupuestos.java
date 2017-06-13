package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.charset.Charset;
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
import modelos.Servicio;
import modelos.ServicioCalculado;
import services.PreciosService;
import services.ServicioConPrecioService;

/**
 * Servlet implementation class CalculadoraPresupuestos
 */
@WebServlet("/CalculadoraPresupuestos")
public class CalculadoraPresupuestos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculadoraPresupuestos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Recibiendo get");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * Este metodo recoje una peticion ajax hecha en javascrip y usa la clase ServicioCalculadoService para calcular los servicios seleccionados que seran el presupuesto realmente
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Recibiendo post en CalculadoraPresupuestos");
		
		Enumeration<String> parametros=request.getParameterNames();
		
		List<ServicioCalculado> listaServiciosPasados=new ArrayList<ServicioCalculado>();
		List<Precio> listaPrecios= new PreciosService().getPrecios();
		while(parametros.hasMoreElements()) {
			//Aqui voy a declarar variables para que quede mas claro que es cada cosa porque con el lio este de pasar los datos no se entendera nada...
            String paramName = (String)parametros.nextElement();
            String valorParametro=request.getParameter(paramName);
            System.out.println("El parametro:_"+paramName+"_: tiene valor:_"+valorParametro+"_:");
            String[] paramParts=paramName.split(":");
            Double totalPrecio=0.0;
            if(paramParts[0].equals("Servicio") && valorParametro!=null && !valorParametro.equals("")){
            	try {
                	int servicio_id_recibido=Integer.parseInt(paramParts[3]);
                	String medida_recibida=paramParts[2];
                	String nombre_recibido=paramParts[1];
            		Double cuantaMedida=Double.parseDouble(request.getParameter(paramName));
            		for(Precio precio:listaPrecios){
        				if (precio.getServicio_id()==servicio_id_recibido && medida_recibida.equals("m2")) {
        					ServicioCalculado servicioCalculado=new ServicioCalculado();
        					totalPrecio+=cuantaMedida*precio.getPrecio_servicio();
        					servicioCalculado.setTotal_precio(roundDouble(cuantaMedida*precio.getPrecio_servicio(),2));
        					servicioCalculado.setCuanto_medida(servicioCalculado.getCuanto_medida());
        					servicioCalculado.setServicio_id(servicio_id_recibido);
                    		servicioCalculado.setTipo_medida(medida_recibida);
                    		servicioCalculado.setCuanto_medida(cuantaMedida);
                    		servicioCalculado.setServicio_nombre(nombre_recibido);
                    		listaServiciosPasados.add(servicioCalculado);
        				}
            		}
				} catch (Exception e) {
					System.out.println("El servidor fallo al parsear alguna cantidad para:_"+paramName);
				}
            }
		}
		
		/**
		 * Para mostrar los datos calculados usare el callback del mismo metodo AJAX que he usado para hacer el submit y mandar los datos del cliente al servidor.
		 * Podria haber usado un forward a la misma pagina y usar luego request.getParameter otra vez en cliente(el jsp) pero creo que asi queda mejor para la vista y en plan diseño.
		 */
		request.setAttribute("serviciosCalculados", listaServiciosPasados);
		RequestDispatcher rd=request.getRequestDispatcher("Presupuesto2.jsp");
		rd.forward(request, response);
	}
	public static double roundDouble(double value, int places) {
	    if (places < 0) throw new IllegalArgumentException();

	    BigDecimal bd = new BigDecimal(value);
	    bd = bd.setScale(places, RoundingMode.HALF_UP);
	    return bd.doubleValue();
	}
}