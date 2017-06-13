package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelos.Categoria;

public class CategoriaService {
	private Connection con;
	private String getTodoCategoriasSQL="Select * from categorias order by id_categoria;";
	private String grabaCategoriaSQL="Insert into elmartillo.categorias(nombre_categoria) values(?);";
	private String bajaCategoriaSQL="delete from elmartillo.categorias where id_categoria=?";
	
	private PreparedStatement getCategoriaStatement;
	private PreparedStatement grabaCategoriaStatement;
	private PreparedStatement bajaCategoriaStatement;
	
	public List<Categoria> getCategorias(){
		this.con=new Conectar().getConeccion();
		try {
			this.getCategoriaStatement=con.prepareStatement(getTodoCategoriasSQL);
			ResultSet categoriaSet=this.getCategoriaStatement.executeQuery();
			ArrayList<Categoria> categoriasList=new ArrayList<Categoria>();
			while(categoriaSet.next()){
				Categoria categoria=new Categoria();
				categoria.setId_categoria(categoriaSet.getInt("id_categoria"));
				categoria.setNombre_categoria(categoriaSet.getString("nombre_categoria"));
				categoriasList.add(categoria);
			}
			return categoriasList;
		} catch (Exception e) {
			System.out.println("---------------------Error sql en CategoriaService getCategorias-------------------------------");
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en CategoriaService getCategorias-------------------------------");
			}
		}
		return null;
	}
	public int grabaCategoria(String nombreCat){
		this.con=new Conectar().getConeccion();
		try {
			this.grabaCategoriaStatement=con.prepareStatement(grabaCategoriaSQL,PreparedStatement.RETURN_GENERATED_KEYS);
			grabaCategoriaStatement.setString(1, nombreCat);
			return this.grabaCategoriaStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("---------------------Error sql en CategoriaService grabaCategoria-------------------------------");
			e.printStackTrace();
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en CategoriaService grabaCategoria-------------------------------");
			}
		}
		return 0;
	}
	public void bajaCategoria(String id){
		this.con=new Conectar().getConeccion();
		try {
			this.bajaCategoriaStatement=con.prepareStatement(bajaCategoriaSQL);
			bajaCategoriaStatement.setString(1, id);
			this.bajaCategoriaStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("---------------------Error sql en CategoriaService bajaCategoria-------------------------------");
			e.printStackTrace();
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en CategoriaService bajaCategoria-------------------------------");
			}
		}
	}
}
