package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelos.RelacionSubCatServ;

public class RelacionesService {
	private Connection con;
	private String getRelacionesSQL="select servicios.`*`,sub_categorias.`*`,relacion_servicio_categoria.relacion_id from "
			+ "elmartillo.servicios,elmartillo.relacion_servicio_categoria,elmartillo.sub_categorias where elmartillo.servicios.servicio_id=elmartillo.relacion_servicio_categoria.servicio_id "
			+ "and elmartillo.sub_categorias.id_sub_categoria=elmartillo.relacion_servicio_categoria.sub_categoria_id;";
	private String grabaRelacionSQL="insert into elmartillo.relacion_servicio_categoria(sub_categoria_id,servicio_id) values(?,?)";
	private String bajaRelacionSQL="delete from elmartillo.relacion_servicio_categoria where relacion_id=?;";
	
	private PreparedStatement getRelacionesStatement;
	private PreparedStatement grabaRelacionStatement;
	private PreparedStatement bajaRelacionStatement;
	
	public List<RelacionSubCatServ> getRelaciones(){
		this.con=new Conectar().getConeccion();
		try {
			this.getRelacionesStatement=con.prepareStatement(getRelacionesSQL);
			ResultSet relacionSet=this.getRelacionesStatement.executeQuery();
			ArrayList<RelacionSubCatServ> relacionList=new ArrayList<RelacionSubCatServ>();
			while(relacionSet.next()){
				RelacionSubCatServ relacion=new RelacionSubCatServ();
				relacion.setId_relacion(relacionSet.getInt("relacion_id"));
				relacion.setServicio_id(relacionSet.getInt("servicio_id"));
				relacion.setSub_categoria_id(relacionSet.getInt("id_sub_categoria"));
				relacion.setNombre_servicio(relacionSet.getString("nombre"));
				relacion.setNombre_subCategoria(relacionSet.getString("nombre_sub_categoria"));
				relacionList.add(relacion);
			}
			return relacionList;
		} catch (Exception e) {
			System.out.println("---------------------Error sql en RelacionesService getRelaciones-------------------------------");
			e.printStackTrace();
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en RelacionesService getRelaciones-------------------------------");
			}
		}
		return null;
	}
	
	public int grabaRelacion(String sub_categoria_id,String servicio_id){
		this.con=new Conectar().getConeccion();
		try {
			this.grabaRelacionStatement=con.prepareStatement(grabaRelacionSQL,PreparedStatement.RETURN_GENERATED_KEYS);
			grabaRelacionStatement.setInt(1, Integer.parseInt(sub_categoria_id));
			grabaRelacionStatement.setInt(2, Integer.parseInt(servicio_id));
			return this.grabaRelacionStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("---------------------Error sql en RelacionesService grabaRelacion-------------------------------");
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en RelacionesService grabaRelacion-------------------------------");
			}
		}
		return 0;
	}
	public int bajaRelacion(String id){
		this.con=new Conectar().getConeccion();
		try {
			this.bajaRelacionStatement=con.prepareStatement(bajaRelacionSQL);
			this.bajaRelacionStatement.setString(1, id);
			System.out.println(bajaRelacionStatement);
			this.bajaRelacionStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("---------------------Error sql en RelacionesService grabaRelacion-------------------------------");
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en RelacionesService grabaRelacion-------------------------------");
			}
		}
		return 0;
	}
	
}
