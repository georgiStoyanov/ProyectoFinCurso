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
	private PreparedStatement getCategoriaStatement;
	
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
}
