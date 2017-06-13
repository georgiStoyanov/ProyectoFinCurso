package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelos.SubCategoria;

public class SubCategoriaService {
	private Connection con;
	private String getTodoServicioSQL="Select * from sub_categorias";
	private String grabaSubCategoriaSQL="Insert into elmartillo.sub_categorias(nombre_sub_categoria,categoria) values(?,?)";
	private String bajaSubCategoriaSQL="delete from elmartillo.sub_categorias where id_sub_categoria=?";
	
	private PreparedStatement getServicioStatement;
	private PreparedStatement grabaSubCategoriaStatement;
	private PreparedStatement bajaSubCategoriaStatement;
	
	public List<SubCategoria> getSubCategorias(){
		this.con=new Conectar().getConeccion();
		try {
			this.getServicioStatement=con.prepareStatement(getTodoServicioSQL);
			ResultSet subCategoriaSet=this.getServicioStatement.executeQuery();
			ArrayList<SubCategoria> serviciosList=new ArrayList<SubCategoria>();
			while(subCategoriaSet.next()){
				SubCategoria subCat=new SubCategoria();
				subCat.setId_sub_categoria(subCategoriaSet.getInt("id_sub_categoria"));
				subCat.setNombre_sub_categoria(subCategoriaSet.getString("nombre_sub_categoria"));
				subCat.setCategoria(subCategoriaSet.getString("categoria"));
				serviciosList.add(subCat);
			}
			return serviciosList;
		} catch (Exception e) {
			System.out.println("---------------------Error sql en ServicioService getServicios-------------------------------");
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en ServicioService getServicios-------------------------------");
			}
		}
		return null;
	}
	
	public int grabaSubCategoria(String nombreSubCategoria,String categoria){
		this.con=new Conectar().getConeccion();
		try {
			this.grabaSubCategoriaStatement=con.prepareStatement(grabaSubCategoriaSQL,PreparedStatement.RETURN_GENERATED_KEYS);
				this.grabaSubCategoriaStatement.setString(1, nombreSubCategoria);
				this.grabaSubCategoriaStatement.setString(2, categoria);
				System.out.println(grabaSubCategoriaStatement);
			return this.grabaSubCategoriaStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("---------------------Error sql en ServicioService grabaServicio-------------------------------");
			e.printStackTrace();
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en ServicioService grabaServicio-------------------------------");
			}
		}
		return 0;
	}
	
	public void bajaSubCategoria(String id){
		this.con=new Conectar().getConeccion();
		try {
			this.bajaSubCategoriaStatement=con.prepareStatement(bajaSubCategoriaSQL);
				this.bajaSubCategoriaStatement.setString(1, id);
				this.bajaSubCategoriaStatement.executeUpdate();
				System.out.println(bajaSubCategoriaStatement);
		} catch (Exception e) {
			System.out.println("---------------------Error sql en ServicioService bajaServicio-------------------------------");
			e.printStackTrace();
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en ServicioService bajaServicio-------------------------------");
			}
		}
	}
}
