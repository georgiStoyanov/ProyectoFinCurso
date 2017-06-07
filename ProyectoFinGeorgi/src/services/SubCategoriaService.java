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
	private PreparedStatement getServicioStatement;
	
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
}
