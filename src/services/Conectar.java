package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Conectar {
	Connection con;

	public Connection getConeccion() {
		try {
			InitialContext initContext = new InitialContext();
			DataSource pool = (DataSource) initContext.lookup("java:/comp/env/elmartillo");
			System.out.println("Coneccion establecida");
			return pool.getConnection();
		} catch (SQLException e) {
			System.out.println(
					"---------------------------------------------------------SQL exception al conectar a la BD!---------------------------------------------------------------");
			e.printStackTrace();
			return null;
		} catch (NamingException e) {
			System.out.println(
					"---------------------------------------------------------Naming exception al conectar a la BD!---------------------------------------------------------------");
			e.printStackTrace();
		}
		return con;
	}
}