package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import modelos.Comentario;
import modelos.RelacionSubCatServ;

public class ComentarioGeneralService {
	private Connection con;
	
			//SQL String Statements 
		private String grabaComentarioSQL="Insert into comentarios_inicio(email,name,content) values(?,?,?);";
		private String getComentariosSQL="select * from comentarios_inicio;";
		private String borraComentarioSQL="delete from comentarios_inicio where id=?;";
		//Prepared Statements
		private PreparedStatement grabaComentarioStatement;
		private PreparedStatement getComentariosStatement;
		private PreparedStatement borraComentarioStatement;
	public int grabarComentario(Comentario coment){
		this.con=new Conectar().getConeccion();
		
		
		try {
			grabaComentarioStatement=con.prepareStatement(grabaComentarioSQL,Statement.RETURN_GENERATED_KEYS);
			
			grabaComentarioStatement.setString(1, coment.getEmail());
			grabaComentarioStatement.setString(2, coment.getName());
			grabaComentarioStatement.setString(3, coment.getContent());
			grabaComentarioStatement.executeUpdate();
			
			ResultSet llaveRetornada=grabaComentarioStatement.getGeneratedKeys();
			while(llaveRetornada.next()){
				return llaveRetornada.getInt(1);
			}
			//autocomit esta a true no necesita con.commit();
		} catch (SQLException e) {
			System.out.println("Excepcion sql al grabar un comentario!");
			e.printStackTrace();
		}finally {
			try {
				//En el trabajo me enseñaron cerrar la coneccion simepre aun que este con preparedStatement.Cuando se atasca con las conecciones casca el servirdor.
				con.close();
			} catch (Exception e) {
				System.out.println("Error cerrando coneccion al grabar comentario!");
			}
		}
		return 0;
	}
	
	public List<Comentario> getComentarios(){
		this.con=new Conectar().getConeccion();
		try {
			this.getComentariosStatement=con.prepareStatement(getComentariosSQL);
			ResultSet comentarioSet=this.getComentariosStatement.executeQuery();
			ArrayList<Comentario> comentarioList=new ArrayList<Comentario>();
			while(comentarioSet.next()){
				Comentario comentario=new Comentario();
				comentario.setId(comentarioSet.getInt("id"));
				comentario.setName(comentarioSet.getString("name"));
				comentario.setEmail(comentarioSet.getString("email"));
				comentario.setContent(comentarioSet.getString("content"));
				comentarioList.add(comentario);
			}
			return comentarioList;
		} catch (Exception e) {
			System.out.println("---------------------Error sql en ComentarioGeneralService getComentarios-------------------------------");
			e.printStackTrace();
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en ComentarioGeneralService getComentarios-------------------------------");
			}
		}
		return null;
	}
	public void borraComentario(String id){
		this.con=new Conectar().getConeccion();
		try {
			this.borraComentarioStatement=con.prepareStatement(borraComentarioSQL);
			this.borraComentarioStatement.setString(1, id);
			this.borraComentarioStatement.executeUpdate();
			System.out.println(borraComentarioStatement);
		} catch (Exception e) {
			System.out.println("---------------------Error sql en ComentarioGeneralService borraComentario-------------------------------");
			e.printStackTrace();
		}finally {
			try {
				this.con.close();
			} catch (Exception e) {
				System.out.println("---------------------Error cerrando coneccion en ComentarioGeneralService borraComentario-------------------------------");
			}
		}
	}
}
