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
	
	private String altaServicioSQL="insert into elmartillo.servicios(nombre,medida) values(?,?);";
	private String getAllServiciosSQL="select * from elmartillo.servicios;";
	private String borraServicioSQL="delete from elmartillo.servicios where servicio_id=? ;";
private String getServiciosPorSubCatSQL="SELECT servicios.* FROM "
		+ "((servicios "
		+ "INNER JOIN relacion_servicio_categoria as relacion1 ON servicios.servicio_id= relacion1.servicio_id) "
		+ "INNER JOIN sub_categorias relacion2 ON relacion1.sub_categoria_id = relacion2.id_sub_categoria) where relacion1.sub_categoria_id=?;";
	
	private PreparedStatement getServiciosPorSubCatStatement;
	private PreparedStatement getAllServiciosStatement;
	private PreparedStatement borraServicioStatement;
	private PreparedStatement altasServicioStatement;
	
	public List<Servicio> getServiciosPorSubCat(int subCatId){
		this.con=new Conectar().getConeccion();
		try {
			getServiciosPorSubCatStatement=con.prepareStatement(getServiciosPorSubCatSQL);
			getServiciosPorSubCatStatement.setInt(1, subCatId);
			getServiciosPorSubCatStatement.executeQuery();
			ResultSet servicioSet=getServiciosPorSubCatStatement.executeQuery();
			List<Servicio> listaServicios=new ArrayList<Servicio>();
			while(servicioSet.next()){
				System.out.println("Sacando servicio:_"+servicioSet.getString("nombre"));
				Servicio ser=new Servicio();
				ser.setId(servicioSet.getInt("servicio_id"));
				ser.setNombre(servicioSet.getString("nombre"));
				ser.setMedida(servicioSet.getString("medida"));
				listaServicios.add(ser);
			}
			return listaServicios;
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
	public List<Servicio> getAllServicios(){
		this.con=new Conectar().getConeccion();
		try {
			getAllServiciosStatement=con.prepareStatement(getAllServiciosSQL);
			getAllServiciosStatement.executeQuery();
			ResultSet servicioSet=getAllServiciosStatement.executeQuery();
			List<Servicio> listaServicios=new ArrayList<Servicio>();
			while(servicioSet.next()){
				System.out.println("Sacando servicio:_"+servicioSet.getString("nombre"));
				Servicio ser=new Servicio();
				ser.setId(servicioSet.getInt("servicio_id"));
				ser.setNombre(servicioSet.getString("nombre"));
				ser.setMedida(servicioSet.getString("medida"));
				listaServicios.add(ser);
			}
			return listaServicios;
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
	
	public void borrarServicio(String id_servicio){
		this.con=new Conectar().getConeccion();
		try {
			borraServicioStatement=con.prepareStatement(borraServicioSQL);
			this.borraServicioStatement.setString(1, id_servicio);
			new PreciosService().bajaPrecio(id_servicio);
			System.out.println(borraServicioStatement);
			this.borraServicioStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("-------------------------------------------SQL EXCEPTION al ServicioService borrasServicio-------------------------------------");
			e.printStackTrace();
		}finally{
			try {
				this.con.close();
			} catch (Exception e2) {
				System.out.println("---------------Error cerrar coneccion en ServicioService borrasServicio----------------------");
			}
		}
	}
	
	public int altaServicios(String nombre,String medida,double d){
		this.con=new Conectar().getConeccion();
		try {
			altasServicioStatement=con.prepareStatement(altaServicioSQL,PreparedStatement.RETURN_GENERATED_KEYS);
			this.altasServicioStatement.setString(1, nombre);
			this.altasServicioStatement.setString(2, medida);
			altasServicioStatement.executeUpdate();
			ResultSet rs=altasServicioStatement.getGeneratedKeys();
			int id_retornado=0;
			while(rs.next()){
				id_retornado=rs.getInt(1);
			}
			if(id_retornado>0){
				new PreciosService().altaPrecio(d, id_retornado);
				return id_retornado;
			}
			System.out.println(altasServicioStatement);
		} catch (SQLException e) {
			System.out.println("-------------------------------------------SQL EXCEPTION al ServicioService altaServicios-------------------------------------");
			e.printStackTrace();
		}finally{
			try {
				this.con.close();
			} catch (Exception e2) {
				System.out.println("---------------Error cerrar coneccion en ServicioService altaServicios----------------------");
			}
		}
		return 0;
	}
}
