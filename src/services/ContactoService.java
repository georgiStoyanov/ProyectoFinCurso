package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelos.Comentario;
import modelos.Contacto;

public class ContactoService {
	private String grabaContactoSQL="insert into elmartillo.contactos_pedidos(personaContacto,email,direccion,telefono,descripcion) values(?,?,?,?,?)";
	private String getContactoSQL="select * from contactos_pedidos;";
	private Connection con;
	private PreparedStatement grabaContactoStatement;
	private PreparedStatement getContactoStatement;
	
	public int grabaContacto(String personaContacto,String email,String direccion,String telefono,String descripcion){
	this.con=new Conectar().getConeccion();
	try {
		grabaContactoStatement=con.prepareStatement(grabaContactoSQL,Statement.RETURN_GENERATED_KEYS);
		
		grabaContactoStatement.setString(1, personaContacto);
		grabaContactoStatement.setString(2, email);
		grabaContactoStatement.setString(3, direccion);
		grabaContactoStatement.setString(4, telefono);
		grabaContactoStatement.setString(5, descripcion);
		grabaContactoStatement.executeUpdate();
		
		ResultSet llaveRetornada=grabaContactoStatement.getGeneratedKeys();
		while(llaveRetornada.next()){
			return llaveRetornada.getInt(1);
		}
		//autocomit esta a true no necesita con.commit();
	} catch (SQLException e) {
		System.out.println("Excepcion sql al grabar un contacto!");
		e.printStackTrace();
	}finally {
		try {
			//En el trabajo me enseñaron cerrar la coneccion simepre aun que este con preparedStatement.Cuando se atasca con las conecciones casca el servirdor.
			con.close();
		} catch (Exception e) {
			System.out.println("Error cerrando coneccion al grabar un contacto!");
		}
	}
	return 0;
	}
	public List<Contacto> getContactos(){
		this.con=new Conectar().getConeccion();
		try {
			this.getContactoStatement=con.prepareStatement(getContactoSQL);
			ResultSet contactoSet=this.getContactoStatement.executeQuery();
			ArrayList<Contacto> contactoList=new ArrayList<Contacto>();
			while(contactoSet.next()){
				Contacto contacto=new Contacto();
				contacto.setId(contactoSet.getInt("id"));
				contacto.setDireccion(contactoSet.getString("direccion"));
				contacto.setEmail(contactoSet.getString("email"));
				contacto.setPersonaContacto(contactoSet.getString("personaContacto"));
				contacto.setTelefono(contactoSet.getString("telefono"));
				contacto.setDescripcion(contactoSet.getString("descripcion"));
				contactoList.add(contacto);
			}
			return contactoList;
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
}
