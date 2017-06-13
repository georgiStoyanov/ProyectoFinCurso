package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import modelos.Precio;
import modelos.Servicio;
import modelos.ServicioCalculado;

public class ServicioConPrecioService {
	public List<ServicioCalculado> getServiciosConPrecio(List<ServicioCalculado> listaServiciosPasados){
		List<ServicioCalculado> listaServiciosCalculados = new ArrayList<ServicioCalculado>();
		List<Precio> listaPrecios= new PreciosService().getPrecios();
		for(ServicioCalculado servicioSeleccionado:listaServiciosPasados){
			for(Precio precio:listaPrecios){
				if (precio.getServicio_id()==servicioSeleccionado.getServicio_id() && servicioSeleccionado.getTipo_medida().equals("m2")) {
					ServicioCalculado servicioCalculado=new ServicioCalculado();
					servicioCalculado.setTotal_precio(servicioSeleccionado.getCuanto_medida()*precio.getPrecio_servicio());
					servicioCalculado.setCuanto_medida(servicioSeleccionado.getCuanto_medida());
					listaServiciosCalculados.add(servicioCalculado);
				}
			}
		}
		/**
		 * Aqui recorro la lista otra vez por la excepcion java.util.ConcurrentModificationException
		 */
		listaServiciosPasados=listaServiciosCalculados;
		return listaServiciosPasados;
	}
}
