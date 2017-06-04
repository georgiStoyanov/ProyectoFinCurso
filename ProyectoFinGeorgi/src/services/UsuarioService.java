package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelos.Usuario;

public class UsuarioService {
	Connection con;
	
	private String loginSQL="Select * from usuarios where email=? and pass=?;";
	
	private PreparedStatement loginStatement;
	
	public Usuario login(Usuario usu){
		this.con=new Conectar().getConeccion();
		try {
			loginStatement=con.prepareStatement(loginSQL);
			
			loginStatement.setString(1, usu.getEmail());
			loginStatement.setString(2, usu.getPass());
			
			loginStatement.executeQuery();
			ResultSet usuRSet=loginStatement.executeQuery();
			while(usuRSet.next()){
				System.out.println("Usuario existe:_'"+usu.getEmail()+"'. Login permitido.");
				// los campos se recogen por nombre y no por indice para poder cambiar datos de la tabla facilmente sin preocuparse que los indices no seran válidos despues
				usu.setId(usuRSet.getInt("id"));
				usu.setDerechos(usuRSet.getString("derechos"));	
				return usu;
			}
		} catch (SQLException e) {
			System.out.println("-------------------------------------------SQL EXCEPTION al intentar logear-------------------------------------");
			e.printStackTrace();
		}finally{
			try {
				//cierro siempre que se atasca
				this.con.close();
			} catch (Exception e2) {
				System.out.println("---------------Error cerrar coneccion al comprobar usuarios(quizas ya ha estado cerrado)----------------------");
			}
		}
		return null;
	}
}
