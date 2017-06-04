package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import modelos.Comentario;

public class ComentarioGeneralService {
	private Connection con;
	
			//SQL String Statements 
		private String grabaComentarioSQL="Insert into comentarios_inicio(email,name,content) values(?,?,?);";
	
		//Prepared Statements
		private PreparedStatement grabaComentarioStatement;
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
}
