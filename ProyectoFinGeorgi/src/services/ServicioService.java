package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelos.Servicio;

public class ServicioService {
	private Connection con;
	
private String getServiciosPorSubCatSQL="SELECT servicios.* FROM "
		+ "((servicios "
		+ "INNER JOIN relacion_servicio_categoria as relacion1 ON servicios.id= relacion1.servicio_id) "
		+ "INNER JOIN sub_categorias relacion2 ON relacion1.sub_categoria_id = relacion2.id_sub_categoria) where relacion1.sub_categoria_id=?;";
	
	private PreparedStatement getServiciosPorSubCatStatement;
	
	public List<Servicio> getServiciosPorSubCat(int subCatId){
		this.con=new Conectar().getConeccion();
		try {
			getServiciosPorSubCatStatement=con.prepareStatement(getServiciosPorSubCatSQL);
			getServiciosPorSubCatStatement.setInt(1, subCatId);
			getServiciosPorSubCatStatement.executeQuery();
			ResultSet servicioSet=getServiciosPorSubCatStatement.executeQuery();
			List<Servicio> listaServiciso=new ArrayList<Servicio>();
			while(servicioSet.next()){
				System.out.println("Sacando servicio:_"+servicioSet.getString("nombre"));
				Servicio ser=new Servicio();
				ser.setId(servicioSet.getInt("id"));
				ser.setNombre(servicioSet.getString("nombre"));
				ser.setMedida(servicioSet.getString("medida"));
				listaServiciso.add(ser);
			}
			return listaServiciso;
		} catch (SQLException e) {
			System.out.println("-------------------------------------------SQL EXCEPTION al ServicioService getServiciosPorSubCat-------------------------------------");
			e.printStackTrace();
		}finally{
			try {
				this.con.close();
			} catch (Exception e2) {
				System.out.println("---------------Error cerrar coneccion en ServicioService getServiciosPorSubCat----------------------");
			}
		}
		return null;
	}
}
